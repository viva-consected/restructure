# frozen_string_literal: true

class SaveTriggers::CreateReference < SaveTriggers::SaveTriggersBase
  def self.config_def(if_extras: {}); end

  def initialize(config, item)
    super

    @model_defs = config
  end

  def perform
    @model_defs = [@model_defs] unless @model_defs.is_a? Array

    @model_defs.each do |model_def|
      model_def.each do |model_name, config|
        vals = {}
        force_create = config[:force_create]
        to_existing_record = config[:to_existing_record]
        create_in = config[:in]
        create_if = config[:if]
        create_with = config[:with]

        # We calculate the conditional if inside each item, rather than relying
        # on the outer processing in ActivityLogOptions#calc_save_trigger_if
        if create_if
          ca = ConditionalActions.new create_if, @item
          next unless ca.calc_action_if
        end

        create_with&.each do |fn, def_val|
          if def_val.is_a? Hash
            ca = ConditionalActions.new def_val, @item
            res = ca.get_this_val
          else
            res = FieldDefaults.calculate_default @item, def_val
          end

          vals[fn] = res
        end

        @item.transaction do
          new_type = @master.assoc_named(model_name.to_s.pluralize)
          if to_existing_record
            to_existing_record_id = to_existing_record[:record_id]
            if to_existing_record_id.is_a? Hash
              ca = ConditionalActions.new to_existing_record_id, @item
              to_existing_record_id = ca.get_this_val
            end

            new_item = new_type.find(to_existing_record_id)
          else
            new_item = new_type.new vals
            new_item.save!
            new_item.force_save! if force_create
          end

          case create_in
          when 'this'
            ModelReference.create_with @item, new_item, force_create: force_create
          when 'referring_record'
            ModelReference.create_with @item.referring_record, new_item, force_create: force_create
          when 'master'
            # ModelReference.create_from_master_with @master, new_item
          when 'master_with_reference'
            ModelReference.create_from_master_with @master, new_item, force_create: force_create
          when 'specific_record'
            in_specific_record = config[:in_specific_record]
            in_record_type = in_specific_record[:record_type]
            in_record_id = in_specific_record[:record_id]
            in_master_id = in_specific_record[:master_id]

            if in_record_id.is_a? Hash
              ca = ConditionalActions.new in_record_id, @item
              in_record_id = ca.get_this_val
            end

            if in_master_id.is_a? Hash
              ca = ConditionalActions.new in_master_id, @item
              in_master_id = ca.get_this_val
            end

            if in_record_type
              model = Resources::Models.find_by(resource_name: in_record_type).model
              create_in_item = model.find(in_record_id)
            else
              create_in_item = Master.find(in_master_id)
            end

            ModelReference.create_with create_in_item, new_item, force_create: force_create
          else
            raise FphsException, "Unknown 'in' value in create_reference"
          end
        end
      end
    end
  end
end
