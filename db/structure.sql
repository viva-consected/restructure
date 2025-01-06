set
  statement_timeout = 0
;


set
  lock_timeout = 0
;


set
  idle_in_transaction_session_timeout = 0
;


set
  client_encoding = 'UTF8'
;


set
  standard_conforming_strings = on
;


select
  pg_catalog.set_config ('search_path', '', false)
;


set
  check_function_bodies = false
;


set
  xmloption = content
;


set
  client_min_messages = warning
;


set
  row_security = off
;


--
-- Name: ml_app; Type: SCHEMA; Schema: -; Owner: -
--
create schema ml_app
;


--
-- Name: ref_data; Type: SCHEMA; Schema: -; Owner: -
--
create schema ref_data
;


set
  default_tablespace = ''
;


set
  default_table_access_method = heap
;


--
-- Name: addresses; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.addresses (
    id integer not null,
    master_id integer,
    street character varying,
    street2 character varying,
    street3 character varying,
    city character varying,
    state character varying,
    zip character varying,
    source character varying,
    rank integer,
    rec_type character varying,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default '2017-09-25 15:43:35.929228'::timestamp without time zone,
    country character varying(3),
    postal_code character varying,
    region character varying
  )
;


--
-- Name: player_contacts; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.player_contacts (
    id integer not null,
    master_id integer,
    rec_type character varying,
    data character varying,
    source character varying,
    rank integer,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default '2017-09-25 15:43:36.922871'::timestamp without time zone
  )
;


--
-- Name: player_infos; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.player_infos (
    id integer not null,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default '2017-09-25 15:43:37.094626'::timestamp without time zone,
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contact_id integer,
    college character varying,
    end_year integer,
    source character varying
  )
;


--
-- Name: TABLE player_infos; Type: COMMENT; Schema: ml_app; Owner: -
--
comment on table ml_app.player_infos is 'Player biographical information'
;


--
-- Name: COLUMN player_infos.first_name; Type: COMMENT; Schema: ml_app; Owner: -
--
comment on column ml_app.player_infos.first_name is 'First Name'
;


--
-- Name: nfs_store_archived_files; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_archived_files (
    id integer not null,
    file_hash character varying,
    file_name character varying not null,
    content_type character varying not null,
    archive_file character varying not null,
    path character varying not null,
    file_size bigint not null,
    file_updated_at timestamp without time zone,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    nfs_store_container_id integer,
    user_id integer,
    title character varying,
    description character varying,
    nfs_store_stored_file_id integer,
    file_metadata jsonb,
    embed_resource_name character varying,
    embed_resource_id bigint
  )
;


--
-- Name: nfs_store_stored_files; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_stored_files (
    id integer not null,
    file_hash character varying not null,
    file_name character varying not null,
    content_type character varying not null,
    file_size bigint not null,
    path character varying,
    file_updated_at timestamp without time zone,
    user_id integer,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying,
    description character varying,
    last_process_name_run character varying,
    file_metadata jsonb,
    embed_resource_name character varying,
    embed_resource_id bigint
  )
;


--
-- Name: add_study_update_entry(integer, character varying, character varying, date, character varying, integer, integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.add_study_update_entry (
  master_id integer,
  update_type character varying,
  update_name character varying,
  event_date date,
  update_notes character varying,
  user_id integer,
  item_id integer,
  item_type character varying
) returns integer language plpgsql as $$
        DECLARE
          new_tracker_id integer;
          protocol_record RECORD;
        BEGIN

          SELECT add_tracker_entry_by_name(master_id, 'Updates', 'record updates', (update_type || ' ' || update_name), event_date, update_notes, user_id, item_id, item_type) into new_tracker_id;
          /*
          SELECT p.id protocol_id, sp.id sub_process_id, pe.id protocol_event_id
          INTO protocol_record
          FROM protocol_events pe
          INNER JOIN sub_processes sp on pe.sub_process_id = sp.id
          INNER JOIN protocols p on sp.protocol_id = p.id
          WHERE p.name = 'Updates'
          AND sp.name = 'record updates'
          AND pe.name = (update_type || ' ' || update_name)
          AND (p.disabled IS NULL or p.disabled = FALSE) AND (sp.disabled IS NULL or sp.disabled = FALSE) AND (pe.disabled IS NULL or pe.disabled = FALSE);

          IF NOT FOUND THEN
            RAISE EXCEPTION 'Nonexistent protocol record --> %', (update_type || ' ' || update_name );
          ELSE

            INSERT INTO trackers
            (master_id, protocol_id, sub_process_id, protocol_event_id, item_type, item_id, user_id, event_date, updated_at, created_at, notes)
            VALUES
            (master_id, protocol_record.protocol_id, protocol_record.sub_process_id, protocol_record.protocol_event_id,
             item_type, item_id, user_id, now(), now(), now(), update_notes);

            RETURN new_tracker_id;
          END IF;
          */
          RETURN new_tracker_id;
        END;
    $$
;


--
-- Name: add_tracker_entry_by_name(integer, character varying, character varying, character varying, character varying, integer, integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.add_tracker_entry_by_name (
  master_id integer,
  protocol_name character varying,
  sub_process_name character varying,
  protocol_event_name character varying,
  set_notes character varying,
  user_id integer,
  item_id integer,
  item_type character varying
) returns integer language plpgsql as $$
        DECLARE
          new_tracker_id integer;
          protocol_record RECORD;
        BEGIN


          SELECT p.id protocol_id, sp.id sub_process_id, pe.id protocol_event_id
          INTO protocol_record
          FROM protocol_events pe
          INNER JOIN sub_processes sp on pe.sub_process_id = sp.id
          INNER JOIN protocols p on sp.protocol_id = p.id
          WHERE p.name = protocol_name
          AND sp.name = sub_process_name
          AND pe.name = protocol_event_name
          AND (p.disabled IS NULL or p.disabled = FALSE) AND (sp.disabled IS NULL or sp.disabled = FALSE) AND (pe.disabled IS NULL or pe.disabled = FALSE);

          IF NOT FOUND THEN
            RAISE EXCEPTION 'Nonexistent protocol record --> %', (protocol_name || ' ' || sub_process_name || ' ' || protocol_event_name);
          ELSE

            INSERT INTO trackers
            (master_id, protocol_id, sub_process_id, protocol_event_id, item_type, item_id, user_id, event_date, updated_at, created_at, notes)
            VALUES
            (master_id, protocol_record.protocol_id, protocol_record.sub_process_id, protocol_record.protocol_event_id,
             item_type, item_id, user_id, now(), now(), now(), set_notes);

            RETURN new_tracker_id;
          END IF;

        END;
    $$
;


--
-- Name: add_tracker_entry_by_name(integer, character varying, character varying, character varying, date, character varying, integer, integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.add_tracker_entry_by_name (
  master_id integer,
  protocol_name character varying,
  sub_process_name character varying,
  protocol_event_name character varying,
  event_date date,
  set_notes character varying,
  user_id integer,
  item_id integer,
  item_type character varying
) returns integer language plpgsql as $$
        DECLARE
          new_tracker_id integer;
          protocol_record RECORD;
        BEGIN


          SELECT p.id protocol_id, sp.id sub_process_id, pe.id protocol_event_id
          INTO protocol_record
          FROM protocol_events pe
          INNER JOIN sub_processes sp on pe.sub_process_id = sp.id
          INNER JOIN protocols p on sp.protocol_id = p.id
          WHERE lower(p.name) = lower(protocol_name)
          AND lower(sp.name) = lower(sub_process_name)
          AND lower(pe.name) = lower(protocol_event_name)
          AND (p.disabled IS NULL or p.disabled = FALSE) AND (sp.disabled IS NULL or sp.disabled = FALSE) AND (pe.disabled IS NULL or pe.disabled = FALSE);

          IF NOT FOUND THEN
            RAISE EXCEPTION 'Nonexistent protocol record --> %', (protocol_name || ' ' || sub_process_name || ' ' || protocol_event_name);
          ELSE

            INSERT INTO trackers
            (master_id, protocol_id, sub_process_id, protocol_event_id, item_type, item_id, user_id, event_date, updated_at, created_at, notes)
            VALUES
            (master_id, protocol_record.protocol_id, protocol_record.sub_process_id, protocol_record.protocol_event_id,
             item_type, item_id, user_id, now(), now(), now(), set_notes);

            RETURN new_tracker_id;
          END IF;

        END;
    $$
;


--
-- Name: assign_sage_ids_to_players(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.assign_sage_ids_to_players () returns record language plpgsql as $$
      DECLARE
        min_sa integer;
        max_sa integer;
        res record;
      BEGIN


        -- update the precreated Sage ID records with the master_id from the player info, based on matching ID.

        -- apply an offset here if the Sage ID does not start at zero

        -- find the first unassigned Sage ID

        select min(id) into min_sa from sage_assignments where master_id is null;

        -- update the sage assignments in a block starting from the minimum unassigned ID

        update sage_assignments sa set master_id = (select master_id from temp_pit where id = sa.id - min_sa) where sa.master_id is null and sa.id >= min_sa;

        -- get the max value to return the results

        select max(id) into max_sa from sage_assignments where master_id is not null;

        select min_sa, max_sa into res;

        return res;


       END;

    $$
;


--
-- Name: create_message_notification_email(character varying, character varying, character varying, json, character varying[], character varying, timestamp without time zone); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.create_message_notification_email (
  layout_template_name character varying,
  content_template_name character varying,
  subject character varying,
  data json,
  recipient_emails character varying[],
  from_user_email character varying,
  run_at timestamp without time zone default null::timestamp without time zone
) returns integer language plpgsql as $$
    DECLARE
      last_id INTEGER;
    BEGIN

      IF run_at IS NULL THEN
        run_at := now();
      END IF;

      INSERT INTO ml_app.message_notifications
      (
        message_type,
        created_at,
        updated_at,
        layout_template_name,
        content_template_name,
        subject,
        data,
        recipient_emails,
        from_user_email
      )
      VALUES
      (
        'email',
        now(),
        now(),
        layout_template_name,
        content_template_name,
        subject,
        data,
        recipient_emails,
        from_user_email
      )
      RETURNING id
      INTO last_id
      ;

      SELECT create_message_notification_job(last_id, run_at)
      INTO last_id
      ;

      RETURN last_id;
    END;
    $$
;


--
-- Name: create_message_notification_email(integer, integer, integer, character varying, integer, integer[], character varying, character varying, character varying, timestamp without time zone); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.create_message_notification_email (
  app_type_id integer,
  master_id integer,
  item_id integer,
  item_type character varying,
  user_id integer,
  recipient_user_ids integer[],
  layout_template_name character varying,
  content_template_name character varying,
  subject character varying,
  run_at timestamp without time zone default null::timestamp without time zone
) returns integer language plpgsql as $$
    DECLARE
      last_id INTEGER;
    BEGIN

      IF run_at IS NULL THEN
        run_at := now();
      END IF;

      INSERT INTO ml_app.message_notifications
      (
        subject,
        app_type_id,
        user_id,
        recipient_user_ids,
        layout_template_name,
        content_template_name,
        item_type,
        item_id,
        master_id,
        message_type,
        created_at,
        updated_at
      )
      VALUES
      (
        subject,
        app_type_id,
        user_id,
        recipient_user_ids,
        layout_template_name,
        content_template_name,
        item_type,
        item_id,
        master_id,
        'email',
        now(),
        now()
      )
      RETURNING id
      INTO last_id
      ;

      SELECT create_message_notification_job(last_id, run_at)
      INTO last_id
      ;

      RETURN last_id;
    END;
    $$
;


--
-- Name: create_message_notification_job(integer, timestamp without time zone); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.create_message_notification_job (
  message_notification_id integer,
  run_at timestamp without time zone default null::timestamp without time zone
) returns integer language plpgsql as $$
    DECLARE
      last_id INTEGER;
    BEGIN

      IF run_at IS NULL THEN
        run_at := now();
      END IF;

      INSERT INTO ml_app.delayed_jobs
      (
        priority,
        attempts,
        handler,
        run_at,
        queue,
        created_at,
        updated_at
      )
      VALUES
      (
        0,
        0,
        '--- !ruby/object:ActiveJob::QueueAdapters::DelayedJobAdapter::JobWrapper
        job_data:
          job_class: HandleMessageNotificationJob
          job_id: ' || gen_random_uuid() || '
          queue_name: default
          arguments:
          - _aj_globalid: gid://fpa1/MessageNotification/' || message_notification_id::varchar || '
          locale: :en',
        run_at,
        'default',
        now(),
        now()
      )
      RETURNING id
      INTO last_id
      ;

    	RETURN last_id;
    END;
    $$
;


--
-- Name: current_user_id(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.current_user_id () returns integer language plpgsql as $$
      DECLARE
        user_id integer;
      BEGIN
        user_id := (select id from users where email = current_user limit 1);

        return user_id;
      END;
    $$
;


--
-- Name: datadic_choice_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.datadic_choice_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO datadic_choice_history (
    source_name, source_type, form_name, field_name, value, label, redcap_data_dictionary_id,
    disabled,
    admin_id,
    created_at,
    updated_at,
    datadic_choice_id)
  SELECT
    NEW.source_name, NEW.source_type, NEW.form_name, NEW.field_name, NEW.value, NEW.label, NEW.redcap_data_dictionary_id,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: datadic_variable_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.datadic_variable_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO datadic_variable_history (
    study, source_name, source_type, domain, form_name, variable_name, variable_type, presentation_type, label, label_note, annotation, is_required, valid_type, valid_min, valid_max, multi_valid_choices, is_identifier, is_derived_var, multi_derived_from_id, doc_url, target_type, owner_email, classification, other_classification, multi_timepoints, equivalent_to_id, storage_type, db_or_fs, schema_or_path, table_or_file, storage_varname, redcap_data_dictionary_id, position, section_id, sub_section_id, title,
    disabled,
    admin_id,
    created_at,
    updated_at,
    datadic_variable_id)
  SELECT
    NEW.study, NEW.source_name, NEW.source_type, NEW.domain, NEW.form_name, NEW.variable_name, NEW.variable_type, NEW.presentation_type, NEW.label, NEW.label_note, NEW.annotation, NEW.is_required, NEW.valid_type, NEW.valid_min, NEW.valid_max, NEW.multi_valid_choices, NEW.is_identifier, NEW.is_derived_var, NEW.multi_derived_from_id, NEW.doc_url, NEW.target_type, NEW.owner_email, NEW.classification, NEW.other_classification, NEW.multi_timepoints, NEW.equivalent_to_id, NEW.storage_type, NEW.db_or_fs, NEW.schema_or_path, NEW.table_or_file, NEW.storage_varname, NEW.redcap_data_dictionary_id, NEW.position, NEW.section_id, NEW.sub_section_id, NEW.title,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


set
  default_tablespace = ''
;


set
  default_table_access_method = heap
;


--
-- Name: filestore_report_file_path(ml_app.nfs_store_stored_files, ml_app.nfs_store_archived_files); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.filestore_report_file_path (sf ml_app.nfs_store_stored_files, af ml_app.nfs_store_archived_files) returns character varying language plpgsql as $$
    BEGIN

      return CASE WHEN af.id IS NOT NULL THEN
        coalesce(sf.path, '') || '/' || sf.file_name || '/' || af.path
        ELSE sf.path
      END;

	END;
$$
;


--
-- Name: filestore_report_full_file_path(ml_app.nfs_store_stored_files, ml_app.nfs_store_archived_files); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.filestore_report_full_file_path (sf ml_app.nfs_store_stored_files, af ml_app.nfs_store_archived_files) returns character varying language plpgsql as $$
    BEGIN

      return CASE WHEN af.id IS NOT NULL THEN
        coalesce(sf.path, '') || '/' || sf.file_name || '/' || af.path || '/' || af.file_name
        ELSE coalesce(sf.path, '') || '/' || sf.file_name
      END;

	END;
$$
;


--
-- Name: filestore_report_perform_action(integer, character varying, integer, ml_app.nfs_store_stored_files, ml_app.nfs_store_archived_files); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.filestore_report_perform_action (
  cid integer,
  altype character varying,
  alid integer,
  sf ml_app.nfs_store_stored_files,
  af ml_app.nfs_store_archived_files
) returns jsonb language plpgsql as $$
	DECLARE
        jo jsonb;
        rt varchar;
        fn varchar;
        alt varchar;
    BEGIN

        rt := '"' || (CASE WHEN af.id IS NOT NULL THEN 'archived_file' ELSE 'stored_file' END) || '"';
        fn := '"' || (CASE WHEN af.id IS NOT NULL THEN af.file_name ELSE sf.file_name END) || '"';
		alt := '"' || altype || '"';
        jo := '{}';

        jo := jsonb_set(jo, '{perform_action}', '"/nfs_store/downloads/!container_id"');
        jo := jsonb_set(jo, '{container_id}', cid::varchar::jsonb);
        jo := jsonb_set(jo, '{download_id}', coalesce(af.id, sf.id)::varchar::jsonb);
        jo := jsonb_set(jo, '{activity_log_type}', alt::jsonb);
        jo := jsonb_set(jo, '{activity_log_id}', alid::varchar::jsonb);
        jo := jsonb_set(jo, '{retrieval_type}', rt::jsonb );
        jo := jsonb_set(jo, '{label}', fn::jsonb);

        return jo;

	END;
$$
;


--
-- Name: filestore_report_select_fields(integer, character varying, integer, integer, integer); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.filestore_report_select_fields (cid integer, altype character varying, alid integer, sfid integer, afid integer) returns jsonb language plpgsql as $$
	DECLARE
        jo jsonb;
        joid jsonb;
        rt varchar;
        alt varchar;
    BEGIN

    	rt := '"' || CASE WHEN afid IS NOT NULL THEN 'archived_file' ELSE 'stored_file' END || '"';
    	alt := '"' || altype || '"';

        joid := '{}'::jsonb;
        joid := jsonb_set(joid, '{id}', coalesce(afid, sfid)::varchar::jsonb);
        joid := jsonb_set(joid, '{retrieval_type}', rt::jsonb );
        joid := jsonb_set(joid, '{container_id}', cid::varchar::jsonb);
        joid := jsonb_set(joid, '{activity_log_type}', alt::jsonb);
        joid := jsonb_set(joid, '{activity_log_id}', alid::varchar::jsonb);


    	jo := '{}'::jsonb;
  		jo := jsonb_set(jo, '{field_name}', '"nfs_store_download[selected_items][]"');
    	jo := jsonb_set(jo, '{value}', joid);
    	return jo;

	END;
$$
;


--
-- Name: format_update_notes(character varying, character varying, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.format_update_notes (field_name character varying, old_val character varying, new_val character varying) returns character varying language plpgsql as $$
        DECLARE
          res VARCHAR;
        BEGIN
          res := '';
          old_val := lower(coalesce(old_val, '-')::varchar);
          new_val := lower(coalesce(new_val, '')::varchar);
          IF old_val <> new_val THEN
            res := field_name;
            IF old_val <> '-' THEN
              res := res || ' from ' || old_val ;
            END IF;
            res := res || ' to ' || new_val || '; ';
          END IF;
          RETURN res;
        END;
      $$
;


--
-- Name: handle_address_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.handle_address_update () returns trigger language plpgsql as $$
        BEGIN

          NEW.street := lower(NEW.street);
          NEW.street2 := lower(NEW.street2);
          NEW.street3 := lower(NEW.street3);
          NEW.city := lower(NEW.city);
          NEW.state := lower(NEW.state);
          NEW.zip := lower(NEW.zip);
          NEW.country := lower(NEW.country);
          NEW.postal_code := lower(NEW.postal_code);
          NEW.region := lower(NEW.region);
          NEW.source := lower(NEW.source);
          RETURN NEW;

        END;
    $$
;


--
-- Name: handle_delete(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.handle_delete () returns trigger language plpgsql as $$
      DECLARE
        latest_tracker tracker_history%ROWTYPE;
      BEGIN

        -- Find the most recent remaining item in tracker_history for the master/protocol pair,
        -- now that the target record has been deleted.
        -- tracker_id is the foreign key onto the trackers table master/protocol record.

        SELECT * INTO latest_tracker
          FROM tracker_history
          WHERE tracker_id = OLD.tracker_id
          ORDER BY event_date DESC NULLS last, updated_at DESC NULLS last LIMIT 1;

        IF NOT FOUND THEN
          -- No record was found in tracker_history for the master/protocol pair.
          -- Therefore there should be no corresponding trackers record either. Delete it.
          DELETE FROM trackers WHERE trackers.id = OLD.tracker_id;

        ELSE
          -- A record was found in tracker_history. Since it is the latest one for the master/protocol pair,
          -- just go ahead and update the corresponding record in trackers.
          UPDATE trackers
            SET
              event_date = latest_tracker.event_date,
              sub_process_id = latest_tracker.sub_process_id,
              protocol_event_id = latest_tracker.protocol_event_id,
              item_id = latest_tracker.item_id,
              item_type = latest_tracker.item_type,
              updated_at = latest_tracker.updated_at,
              notes = latest_tracker.notes,
              user_id = latest_tracker.user_id
            WHERE trackers.id = OLD.tracker_id;

        END IF;


        RETURN OLD;

      END
    $$
;


--
-- Name: handle_player_contact_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.handle_player_contact_update () returns trigger language plpgsql as $$
        BEGIN


          NEW.rec_type := lower(NEW.rec_type);
          NEW.data := lower(NEW.data);
          NEW.source := lower(NEW.source);


          RETURN NEW;

        END;
    $$
;


--
-- Name: handle_player_info_before_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.handle_player_info_before_update () returns trigger language plpgsql as $$
        BEGIN
          NEW.first_name := lower(NEW.first_name);
          NEW.last_name := lower(NEW.last_name);
          NEW.middle_name := lower(NEW.middle_name);
          NEW.nick_name := lower(NEW.nick_name);
          NEW.college := lower(NEW.college);
          NEW.source := lower(NEW.source);
          RETURN NEW;

        END;
    $$
;


--
-- Name: handle_rc_cis_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.handle_rc_cis_update () returns trigger language plpgsql as $$
        DECLARE
          new_master_id integer;
          new_msid integer;
          updated_item_id integer;
          register_tracker boolean;
          update_notes VARCHAR;
          event_date DATE;
          track_p varchar;
          track_sp varchar;
          track_pe varchar;
          res_status varchar;

        BEGIN


          track_p := 'study';
          track_sp := 'CIS-received';
          track_pe := 'REDCap';

          register_tracker := FALSE;
          update_notes := '';
          res_status := NEW.status;

          event_date :=  NEW.time_stamp::date;

          IF coalesce(NEW.status,'') <> '' THEN

            IF NEW.status = 'create master' THEN

                IF NEW.master_id IS NOT NULL THEN
                  RAISE EXCEPTION 'Can not create a master when the master ID is already set. Review the linked Master record, or to create a new Master record clear the master_id first and try again.';
                END IF;


                SELECT MAX(msid) + 1 INTO new_msid FROM masters;

                INSERT INTO masters
                  (msid, created_at, updated_at, user_id)
                  VALUES
                  (new_msid, now(), now(), NEW.user_id)
                  RETURNING id INTO new_master_id;

                INSERT INTO player_infos
                  (master_id, first_name, last_name, source, created_at, updated_at, user_id)
                  VALUES
                  (new_master_id, NEW.first_name, NEW.last_name, 'cis-redcap', now(), now(), NEW.user_id);

                register_tracker := TRUE;

            ELSE
                SELECT id INTO new_master_id FROM masters WHERE id = NEW.master_id;
            END IF;

            IF NEW.status = 'update name' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN
                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;


                SELECT format_update_notes('first name', first_name, NEW.first_name) ||
                  format_update_notes('last name', last_name, NEW.last_name) ||
                  format_update_notes('middle name', middle_name, NEW.middle_name) ||
                  format_update_notes('nick name', nick_name, NEW.nick_name)
                INTO update_notes
                FROM player_infos
                WHERE master_id = new_master_id order by rank desc limit 1;

                UPDATE player_infos SET
                  master_id = new_master_id, first_name = NEW.first_name, last_name = NEW.last_name,
                  middle_name = NEW.middle_name, nick_name = NEW.nick_name,
                  source = 'cis-redcap', created_at = now(), updated_at = now(), user_id = NEW.user_id
                  WHERE master_id = new_master_id
                  RETURNING id INTO updated_item_id;


                PERFORM add_study_update_entry(new_master_id, 'updated', 'player info', event_date, update_notes, NEW.user_id, updated_item_id, 'PlayerInfo');

                register_tracker := TRUE;
                res_status := 'updated name';
            END IF;

            IF NEW.status = 'update address' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN
                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;

                IF NEW.street IS NOT NULL AND trim(NEW.street) <> '' OR
                    NEW.state IS NOT NULL AND trim(NEW.state) <> '' OR
                    NEW.zipcode IS NOT NULL AND trim(NEW.zipcode) <> '' THEN

                  SELECT format_update_notes('street', NULL, NEW.street) ||
                    format_update_notes('street2', NULL, NEW.street2) ||
                    format_update_notes('city', NULL, NEW.city) ||
                    format_update_notes('state', NULL, NEW.state) ||
                    format_update_notes('zip', NULL, NEW.zipcode)
                  INTO update_notes;
                  -- FROM addresses
                  -- WHERE master_id = new_master_id;



                  INSERT INTO addresses
                    (master_id, street, street2, city, state, zip, source, rank, created_at, updated_at, user_id)
                    VALUES
                    (new_master_id, NEW.street, NEW.street2, NEW.city, NEW.state, NEW.zipcode, 'cis-redcap', 10, now(), now(), NEW.user_id)
                    RETURNING id INTO updated_item_id;

                  PERFORM update_address_ranks(new_master_id);
                  PERFORM add_study_update_entry(new_master_id, 'updated', 'address', event_date, update_notes, NEW.user_id, updated_item_id, 'Address');

                  register_tracker := TRUE;
                  res_status := 'updated address';
                ELSE
                  res_status := 'address not updated - details blank';
                END IF;


            END IF;

            IF NEW.status = 'update email' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN

                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;

                IF NEW.email IS NOT NULL AND trim(NEW.email) <> '' THEN

                  SELECT format_update_notes('data', NULL, NEW.email)
                  INTO update_notes;


                  INSERT INTO player_contacts
                    (master_id, data, rec_type, source, rank, created_at, updated_at, user_id)
                    VALUES
                    (new_master_id, NEW.email, 'email', 'cis-redcap', 10, now(), now(), NEW.user_id)
                    RETURNING id INTO updated_item_id;


                  PERFORM update_player_contact_ranks(new_master_id, 'email');
                  PERFORM add_study_update_entry(new_master_id, 'updated', 'player contact', event_date, update_notes, NEW.user_id, updated_item_id, 'PlayerContact');

                  register_tracker := TRUE;
                  res_status := 'updated email';
                ELSE
                  res_status := 'email not updated - details blank';
                END IF;
            END IF;

            IF NEW.status = 'update phone' OR NEW.status = 'update all' OR NEW.status = 'create master' THEN
                IF new_master_id IS NULL THEN
                  RAISE EXCEPTION 'Must set a master ID to %', NEW.status;
                END IF;

                IF NEW.phone IS NOT NULL AND trim(NEW.phone) <> '' THEN

                  SELECT format_update_notes('data', NULL, NEW.phone)
                  INTO update_notes;

                  INSERT INTO player_contacts
                    (master_id, data, rec_type, source, rank, created_at, updated_at, user_id)
                    VALUES
                    (new_master_id, NEW.phone, 'phone', 'cis-redcap', 10, now(), now(), NEW.user_id)
                    RETURNING id INTO updated_item_id;

                  PERFORM update_player_contact_ranks(new_master_id, 'phone');
                  PERFORM add_study_update_entry(new_master_id, 'updated', 'player contact', event_date, update_notes, NEW.user_id, updated_item_id, 'PlayerContact');

                  register_tracker := TRUE;
                  res_status := 'updated phone';
                ELSE
                  res_status := 'phone not updated - details blank';
                END IF;
            END IF;


            CASE
              WHEN NEW.status = 'create master' THEN
                res_status := 'created master';
              WHEN NEW.status = 'update all' THEN
                res_status := 'updated all';
              ELSE
            END CASE;

            -- the master_id was set and an action performed. Register the tracker event
            IF coalesce(NEW.added_tracker, FALSE) = FALSE AND new_master_id IS NOT NULL AND register_tracker THEN
              PERFORM add_tracker_entry_by_name(new_master_id, track_p, track_sp, track_pe, OLD.time_stamp::date, ('Heard about: ' || coalesce(OLD.hearabout, '(not set)') || E'
Submitted by REDCap ID '|| OLD.redcap_survey_identifier), NEW.user_id, NULL, NULL);
              NEW.added_tracker = TRUE;
            END IF;

            NEW.master_id := new_master_id;
            NEW.updated_at := now();
            NEW.status := res_status;

          END IF;

          RETURN NEW;

        END;
    $$
;


--
-- Name: handle_tracker_history_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.handle_tracker_history_update () returns trigger language plpgsql as $$
    BEGIN

      DELETE FROM tracker_history WHERE id = OLD.id;

      INSERT INTO trackers
        (master_id, protocol_id,
         protocol_event_id, event_date, sub_process_id, notes,
         item_id, item_type,
         created_at, updated_at, user_id)

        SELECT NEW.master_id, NEW.protocol_id,
           NEW.protocol_event_id, NEW.event_date,
           NEW.sub_process_id, NEW.notes,
           NEW.item_id, NEW.item_type,
           NEW.created_at, NEW.updated_at, NEW.user_id  ;

      RETURN NULL;
    END;
    $$
;


--
-- Name: log_accuracy_score_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_accuracy_score_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO accuracy_score_history
            (
                    accuracy_score_id,
                    name ,
                    value ,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.value ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled ,
                    NEW.admin_id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_activity_log_player_contact_phone_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_activity_log_player_contact_phone_update () returns trigger language plpgsql as $$
                BEGIN
                    INSERT INTO activity_log_player_contact_phone_history
                    (
                        master_id,
                        player_contact_id,
                        data,
                        select_call_direction,
                        select_who,
                        called_when,
                        select_result,
                        select_next_step,
                        follow_up_when,
                        notes,
                        protocol_id,
                        set_related_player_contact_rank,
                        extra_log_type,
                        user_id,
                        created_at,
                        updated_at,
                        activity_log_player_contact_phone_id
                        )
                    SELECT
                        NEW.master_id,
                        NEW.player_contact_id,
                        NEW.data,
                        NEW.select_call_direction,
                        NEW.select_who,
                        NEW.called_when,
                        NEW.select_result,
                        NEW.select_next_step,
                        NEW.follow_up_when,
                        NEW.notes,
                        NEW.protocol_id,
                        NEW.set_related_player_contact_rank,
                        NEW.extra_log_type,
                        NEW.user_id,
                        NEW.created_at,
                        NEW.updated_at,
                        NEW.id
                    ;
                    RETURN NEW;
                END;
            $$
;


--
-- Name: log_activity_log_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_activity_log_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO activity_log_history
            (
                name,
                activity_log_id,
                admin_id,
                created_at,
                updated_at,
                item_type,
                rec_type,
                disabled,
                action_when_attribute,
                field_list,
                blank_log_field_list,
                blank_log_name,
                extra_log_types,
                hide_item_list_panel,
                main_log_name,
                process_name,
                table_name,
                category,
                schema_name
                )
            SELECT
                NEW.name,
                NEW.id,
                NEW.admin_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.item_type,
                NEW.rec_type,
                NEW.disabled,
                NEW.action_when_attribute,
                NEW.field_list,
                NEW.blank_log_field_list,
                NEW.blank_log_name,
                NEW.extra_log_types,
                NEW.hide_item_list_panel,
                NEW.main_log_name,
                NEW.process_name,
                NEW.table_name,
                NEW.category,
                NEW.schema_name
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_address_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_address_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO address_history
                (
                    master_id,
                    street,
                    street2,
                    street3,
                    city,
                    state,
                    zip,
                    source,
                    rank,
                    rec_type,
                    user_id,
                    created_at,
                    updated_at,
                    country,
                    postal_code,
                    region,
                    address_id
                )

            SELECT
                NEW.master_id,
                NEW.street,
                NEW.street2,
                NEW.street3,
                NEW.city,
                NEW.state,
                NEW.zip,
                NEW.source,
                NEW.rank,
                NEW.rec_type,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.country,
                NEW.postal_code,
                NEW.region,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_admin_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_admin_update () returns trigger language plpgsql as $$
    BEGIN
      INSERT INTO admin_history
      (
        admin_id,
        email,
        encrypted_password,
        sign_in_count,
        current_sign_in_at,
        last_sign_in_at,
        current_sign_in_ip ,
        last_sign_in_ip ,
        created_at ,
        updated_at,
        failed_attempts,
        unlock_token,
        locked_at,
        disabled,
        encrypted_otp_secret,
        encrypted_otp_secret_iv,
        encrypted_otp_secret_salt,
        consumed_timestep,
        otp_required_for_login,
        reset_password_sent_at,
        password_updated_at,
        updated_by_admin_id

      )
      SELECT
        NEW.id,
        NEW.email,
        NEW.encrypted_password,
        NEW.sign_in_count,
        NEW.current_sign_in_at,
        NEW.last_sign_in_at,
        NEW.current_sign_in_ip ,
        NEW.last_sign_in_ip ,
        NEW.created_at ,
        NEW.updated_at,
        NEW.failed_attempts,
        NEW.unlock_token,
        NEW.locked_at,
        NEW.disabled,
        NEW.encrypted_otp_secret,
        NEW.encrypted_otp_secret_iv,
        NEW.encrypted_otp_secret_salt,
        NEW.consumed_timestep,
        NEW.otp_required_for_login,
        NEW.reset_password_sent_at,
        NEW.password_updated_at,
        NEW.admin_id
        ;
        RETURN NEW;
    END;
    $$
;


--
-- Name: log_app_configuration_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_app_configuration_update () returns trigger language plpgsql as $$
              BEGIN
                  INSERT INTO app_configuration_history
                  (
                      name,
                      value,
                      app_type_id,
                      user_id,
                      role_name,
                      admin_id,
                      disabled,
                      created_at,
                      updated_at,
                      app_configuration_id
                      )
                  SELECT
                      NEW.name,
                      NEW.value,
                      NEW.app_type_id,
                      NEW.user_id,
                      NEW.role_name,
                      NEW.admin_id,
                      NEW.disabled,
                      NEW.created_at,
                      NEW.updated_at,
                      NEW.id
                  ;
                  RETURN NEW;
              END;
          $$
;


--
-- Name: log_app_type_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_app_type_update () returns trigger language plpgsql as $$
             BEGIN
                 INSERT INTO app_type_history
                 (
                     name,
                     label,
                     admin_id,
                     disabled,
                     created_at,
                     updated_at,
                     app_type_id
                     )
                 SELECT
                     NEW.name,
                     NEW.label,
                     NEW.admin_id,
                     NEW.disabled,
                     NEW.created_at,
                     NEW.updated_at,
                     NEW.id
                 ;
                 RETURN NEW;
             END;
         $$
;


--
-- Name: log_college_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_college_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO college_history
            (
                    college_id,
                    name ,
                    synonym_for_id,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id,
                    user_id
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.synonym_for_id ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled ,
                    NEW.admin_id,
                    NEW.user_id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_config_library_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_config_library_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO config_library_history
            (
                    config_library_id,
                    category,
                    name,
                    options,
                    format,
                    disabled,
                    admin_id,
                    updated_at,
                    created_at
                )
            SELECT
                NEW.id,
                NEW.category,
                NEW.name,
                NEW.options,
                NEW.format,
                NEW.disabled,
                NEW.admin_id,
                NEW.updated_at,
                NEW.created_at
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_dynamic_model_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_dynamic_model_update () returns trigger language plpgsql as $$
            BEGIN
                INSERT INTO dynamic_model_history
                (
                    name,
                    table_name,
                    schema_name,
                    primary_key_name,
                    foreign_key_name,
                    description,
                    position,
                    category,
                    table_key_name,
                    field_list,
                    result_order,
                    options,
                    admin_id,
                    disabled,
                    created_at,
                    updated_at,
                    dynamic_model_id
                    )
                SELECT
                    NEW.name,
                    NEW.table_name,
                    NEW.schema_name,
                    NEW.primary_key_name,
                    NEW.foreign_key_name,
                    NEW.description,
                    NEW.position,
                    NEW.category,
                    NEW.table_key_name,
                    NEW.field_list,
                    NEW.result_order,
                    NEW.options,
                    NEW.admin_id,
                    NEW.disabled,
                    NEW.created_at,
                    NEW.updated_at,
                    NEW.id
                ;
                RETURN NEW;
            END;
        $$
;


--
-- Name: log_external_identifier_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_external_identifier_update () returns trigger language plpgsql as $$
      BEGIN
          INSERT INTO external_identifier_history
          (
              name,
              label,
              external_id_attribute,
              external_id_view_formatter,
              external_id_edit_pattern,
              prevent_edit,
              pregenerate_ids,
              min_id,
              max_id,
              alphanumeric,
              extra_fields,
              admin_id,
              disabled,
              created_at,
              updated_at,
              external_identifier_id,
              schema_name,
              options
              )
          SELECT
              NEW.name,
              NEW.label,
              NEW.external_id_attribute,
              NEW.external_id_view_formatter,
              NEW.external_id_edit_pattern,
              NEW.prevent_edit,
              NEW.pregenerate_ids,
              NEW.min_id,
              NEW.max_id,
              NEW.alphanumeric,
              NEW.extra_fields,
              NEW.admin_id,
              NEW.disabled,
              NEW.created_at,
              NEW.updated_at,
              NEW.id,
              NEW.schema_name,
              NEW.options
          ;
          RETURN NEW;
      END;
  $$
;


--
-- Name: log_external_link_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_external_link_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO external_link_history
            (
                    external_link_id,
                    name,
                    value,
                    admin_id,
                    disabled,
                    created_at,
                    updated_at
                )
            SELECT
                NEW.id,
                NEW.name,
                    NEW.value,
                    NEW.admin_id,
                    NEW.disabled,
                    NEW.created_at,
                    NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_general_selection_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_general_selection_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO general_selection_history
            (
                    general_selection_id,
                    name ,
                    value ,
                    item_type ,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id ,
                    create_with ,
                    edit_if_set ,
                    edit_always ,
                    position ,
                    description ,
                    lock
                )
            SELECT
                NEW.id,
                NEW.name ,
                NEW.value ,
                NEW.item_type ,
                NEW.created_at ,
                NEW.updated_at ,
                NEW.disabled ,
                NEW.admin_id ,
                NEW.create_with ,
                NEW.edit_if_set ,
                NEW.edit_always ,
                NEW.position "position",
                NEW.description ,
                NEW.lock
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_item_flag_name_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_item_flag_name_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO item_flag_name_history
            (
                    item_flag_name_id,
                    name ,
                    item_type,
                    created_at ,
                    updated_at ,
                    disabled ,
                    admin_id
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.item_type ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled ,
                    NEW.admin_id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_item_flag_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_item_flag_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO item_flag_history
            (
                    item_flag_id,
                    item_id ,
                    item_type,
                    item_flag_name_id,
                    created_at ,
                    updated_at ,
                    user_id ,
                    disabled
                )
            SELECT
                NEW.id,
                NEW.item_id ,
                    NEW.item_type,
                    NEW.item_flag_name_id,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.user_id ,
                    NEW.disabled
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_message_template_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_message_template_update () returns trigger language plpgsql as $$
                  BEGIN
                      INSERT INTO message_template_history
                      (
                          name,
                          template_type,
                          message_type,
                          template,
                          category,
                          admin_id,
                          disabled,
                          created_at,
                          updated_at,
                          message_template_id
                          )
                      SELECT
                          NEW.name,
                          NEW.template_type,
                          NEW.message_type,
                          NEW.template,
                          NEW.category,
                          NEW.admin_id,
                          NEW.disabled,
                          NEW.created_at,
                          NEW.updated_at,
                          NEW.id
                      ;
                      RETURN NEW;
                  END;
              $$
;


--
-- Name: log_nfs_store_archived_file_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_nfs_store_archived_file_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO nfs_store_archived_file_history
            (
                file_hash,
                file_name,
                content_type,
                archive_file,
                path,
                file_size,
                file_updated_at,
                nfs_store_container_id,
                title,
                description,
                file_metadata,
                nfs_store_stored_file_id,
                user_id,
                created_at,
                updated_at,
                nfs_store_archived_file_id,
                embed_resource_name,
                embed_resource_id
                )
            SELECT
                NEW.file_hash,
                NEW.file_name,
                NEW.content_type,
                NEW.archive_file,
                NEW.path,
                NEW.file_size,
                NEW.file_updated_at,
                NEW.nfs_store_container_id,
                NEW.title,
                NEW.description,
                NEW.file_metadata,
                NEW.nfs_store_stored_file_id,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id,
                NEW.embed_resource_name,
                NEW.embed_resource_id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_nfs_store_container_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_nfs_store_container_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO nfs_store_container_history
            (
                master_id,
                name,
                app_type_id,
                orig_nfs_store_container_id,
                created_by_user_id,
                user_id,
                created_at,
                updated_at,
                nfs_store_container_id
                )
            SELECT
                NEW.master_id,
                NEW.name,
                NEW.app_type_id,
                NEW.nfs_store_container_id,
                NEW.created_by_user_id,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_nfs_store_filter_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_nfs_store_filter_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO nfs_store_filter_history
            (
                app_type_id,
                role_name,
                user_id,
                resource_name,
                filter,
                description,
                admin_id,
                disabled,
                created_at,
                updated_at,
                nfs_store_filter_id
                )
            SELECT
                NEW.app_type_id,
                NEW.role_name,
                NEW.user_id,
                NEW.resource_name,
                NEW.filter,
                NEW.description,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_nfs_store_stored_file_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_nfs_store_stored_file_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO nfs_store_stored_file_history
            (
                file_hash,
                file_name,
                content_type,
                path,
                file_size,
                file_updated_at,
                nfs_store_container_id,
                title,
                description,
                file_metadata,
                last_process_name_run,
                user_id,
                created_at,
                updated_at,
                nfs_store_stored_file_id,
                embed_resource_name,
                embed_resource_id
                )
            SELECT
                NEW.file_hash,
                NEW.file_name,
                NEW.content_type,
                NEW.path,
                NEW.file_size,
                NEW.file_updated_at,
                NEW.nfs_store_container_id,
                NEW.title,
                NEW.description,
                NEW.file_metadata,
                NEW.last_process_name_run,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id,
                NEW.embed_resource_name,
                NEW.embed_resource_id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_page_layout_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_page_layout_update () returns trigger language plpgsql as $$
          BEGIN
              INSERT INTO page_layout_history
              (
                      page_layout_id,
                      app_type_id,
                      layout_name,
                      panel_name,
                      panel_label,
                      panel_position,
                      options,
                      disabled,
                      admin_id,
                      created_at,
                      updated_at,
                      description
                  )
              SELECT
                  NEW.id,
                  NEW.app_type_id,
                  NEW.layout_name,
                  NEW.panel_name,
                  NEW.panel_label,
                  NEW.panel_position,
                  NEW.options,
                  NEW.disabled,
                  NEW.admin_id,
                  NEW.created_at,
                  NEW.updated_at,
                  NEW.description
              ;
              RETURN NEW;
          END;
      $$
;


--
-- Name: log_player_contact_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_player_contact_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO player_contact_history
            (
                    player_contact_id,
                    master_id,
                    rec_type,
                    data,
                    source,
                    rank,
                    user_id,
                    created_at,
                    updated_at
                )
            SELECT
                NEW.id,
                NEW.master_id,
                NEW.rec_type,
                NEW.data,
                NEW.source,
                NEW.rank,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_player_info_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_player_info_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO player_info_history
            (
                    master_id,
                    first_name,
                    last_name,
                    middle_name,
                    nick_name,
                    birth_date,
                    death_date,
                    user_id,
                    created_at,
                    updated_at,
                    contact_pref,
                    start_year,
                    rank,
                    notes,
                    contact_id,
                    college,
                    end_year,
                    source,
                    player_info_id
                )
            SELECT
                NEW.master_id,
                NEW.first_name,
                NEW.last_name,
                NEW.middle_name,
                NEW.nick_name,
                NEW.birth_date,
                NEW.death_date,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.contact_pref,
                NEW.start_year,
                NEW.rank,
                NEW.notes,
                NEW.contact_id,
                NEW.college,
                NEW.end_year,
                NEW.source,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_protocol_event_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_protocol_event_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO protocol_event_history
            (
                    protocol_event_id,
    name ,
    admin_id,
    created_at,
    updated_at,
    disabled ,
    sub_process_id,
    milestone ,
    description

                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.disabled ,
    NEW.sub_process_id,
    NEW.milestone ,
    NEW.description
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_protocol_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_protocol_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO protocol_history
            (
                    protocol_id,
                    name ,
                    created_at ,
                    updated_at ,
                    disabled,
                    admin_id ,
                    "position"
                )
            SELECT
                NEW.id,
                NEW.name ,
                    NEW.created_at ,
                    NEW.updated_at ,
                    NEW.disabled,
                    NEW.admin_id ,
                    NEW.position
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_report_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_report_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO report_history
            (
                    report_id,
                    name,
                    description,
                    sql,
                    search_attrs,
                    admin_id,
                    disabled,
                    report_type,
                    auto,
                    searchable,
                    position,
                    created_at,
                    updated_at,
                    edit_field_names,
                    selection_fields,
                    item_type,
                    short_name,
                    options
                )
            SELECT
                NEW.id,
                NEW.name,
                NEW.description,
                NEW.sql,
                NEW.search_attrs,
                NEW.admin_id,
                NEW.disabled,
                NEW.report_type,
                NEW.auto,
                NEW.searchable,
                NEW.position,
                NEW.created_at,
                NEW.updated_at,
                NEW.edit_field_names,
                NEW.selection_fields,
                NEW.item_type,
                NEW.short_name,
                NEW.options
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_scantron_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_scantron_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO scantron_history
            (
                master_id,
                scantron_id,
                user_id,
                created_at,
                updated_at,
                scantron_table_id
                )
            SELECT
                NEW.master_id,
                NEW.scantron_id,
                NEW.user_id,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_sub_process_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_sub_process_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO sub_process_history
            (
                    sub_process_id,

    name,
    disabled,
    protocol_id,
    admin_id ,
    created_at,
    updated_at

                )
            SELECT
                NEW.id,
                NEW.name,
    NEW.disabled,
    NEW.protocol_id,
    NEW.admin_id ,
    NEW.created_at,
    NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_tracker_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_tracker_update () returns trigger language plpgsql as $$
        BEGIN

          -- Check to see if there is an existing record in tracker_history that matches the
          -- that inserted or updated in trackers.
          -- If there is, just skip the insert into tracker_history, otherwise make the insert happen.

          PERFORM * from tracker_history
            WHERE
              master_id = NEW.master_id
              AND protocol_id = NEW.protocol_id
              AND coalesce(protocol_event_id,-1) = coalesce(NEW.protocol_event_id,-1)
              AND coalesce(event_date, '1900-01-01'::date)::date = coalesce(NEW.event_date, '1900-01-01')::date
              AND sub_process_id = NEW.sub_process_id
              AND coalesce(notes,'') = coalesce(NEW.notes,'')
              AND coalesce(item_id,-1) = coalesce(NEW.item_id,-1)
              AND coalesce(item_type,'') = coalesce(NEW.item_type,'')
              -- do not check created_at --
              AND updated_at::timestamp = NEW.updated_at::timestamp
              AND coalesce(user_id,-1) = coalesce(NEW.user_id,-1);

            IF NOT FOUND THEN
              INSERT INTO tracker_history
                  (tracker_id, master_id, protocol_id,
                   protocol_event_id, event_date, sub_process_id, notes,
                   item_id, item_type,
                   created_at, updated_at, user_id)

                  SELECT NEW.id, NEW.master_id, NEW.protocol_id,
                     NEW.protocol_event_id, NEW.event_date,
                     NEW.sub_process_id, NEW.notes,
                     NEW.item_id, NEW.item_type,
                     NEW.created_at, NEW.updated_at, NEW.user_id  ;
            END IF;

            RETURN NEW;

        END;
    $$
;


--
-- Name: log_user_access_control_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_user_access_control_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO user_access_control_history
            (
                user_id,
                resource_type,
                resource_name,
                options,
                access,
                app_type_id,
                role_name,
                admin_id,
                disabled,
                created_at,
                updated_at,
                user_access_control_id
                )
            SELECT
                NEW.user_id,
                NEW.resource_type,
                NEW.resource_name,
                NEW.options,
                NEW.access,
                NEW.app_type_id,
                NEW.role_name,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_user_authorization_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_user_authorization_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO user_authorization_history
            (
                    user_authorization_id,
                    user_id,
                    has_authorization,
                    admin_id,
                    disabled,
                    created_at,
                    updated_at
                )
            SELECT
                NEW.id,
                NEW.user_id,
                NEW.has_authorization,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_user_role_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_user_role_update () returns trigger language plpgsql as $$
        BEGIN
            INSERT INTO user_role_history
            (
                app_type_id,
                role_name,
                user_id,
                admin_id,
                disabled,
                created_at,
                updated_at,
                user_role_id
                )
            SELECT
                NEW.app_type_id,
                NEW.role_name,
                NEW.user_id,
                NEW.admin_id,
                NEW.disabled,
                NEW.created_at,
                NEW.updated_at,
                NEW.id
            ;
            RETURN NEW;
        END;
    $$
;


--
-- Name: log_user_update(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.log_user_update () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO user_history
  (
      user_id,
      email,
      encrypted_password,
      reset_password_token,
      reset_password_sent_at,
      remember_created_at,
      sign_in_count,
      current_sign_in_at,
      last_sign_in_at,
      current_sign_in_ip ,
      last_sign_in_ip ,
      created_at ,
      updated_at,
      failed_attempts,
      unlock_token,
      locked_at,
      disabled ,
      admin_id,
      app_type_id,
      authentication_token,
      encrypted_otp_secret,
      encrypted_otp_secret_iv,
      encrypted_otp_secret_salt,
      consumed_timestep,
      otp_required_for_login,
      password_updated_at,
      first_name,
      last_name,
      confirmation_token,
      confirmed_at,
      confirmation_sent_at
  )
  SELECT
    NEW.id,
    NEW.email,
    NEW.encrypted_password,
    NEW.reset_password_token,
    NEW.reset_password_sent_at,
    NEW.remember_created_at,
    NEW.sign_in_count,
    NEW.current_sign_in_at,
    NEW.last_sign_in_at,
    NEW.current_sign_in_ip ,
    NEW.last_sign_in_ip ,
    NEW.created_at ,
    NEW.updated_at,
    NEW.failed_attempts,
    NEW.unlock_token,
    NEW.locked_at,
    NEW.disabled ,
    NEW.admin_id,
    NEW.app_type_id,
    NEW.authentication_token,
    NEW.encrypted_otp_secret,
    NEW.encrypted_otp_secret_iv,
    NEW.encrypted_otp_secret_salt,
    NEW.consumed_timestep,
    NEW.otp_required_for_login,
    NEW.password_updated_at,
    NEW.first_name,
    NEW.last_name,
    NEW.confirmation_token,
    NEW.confirmed_at,
    NEW.confirmation_sent_at
  ;
  RETURN NEW;
  END;
  $$
;


--
-- Name: redcap_data_dictionary_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.redcap_data_dictionary_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO redcap_data_dictionary_history (
    redcap_project_admin_id, field_count, captured_metadata,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_data_dictionary_id)
  SELECT
    NEW.redcap_project_admin_id, NEW.field_count, NEW.captured_metadata,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: redcap_project_admin_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.redcap_project_admin_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO redcap_project_admin_history (
    name, api_key, server_url, captured_project_info, study, transfer_mode, frequency, status, post_transfer_pipeline, notes, dynamic_model_table,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_project_admin_id)
  SELECT
    NEW.name, NEW.api_key, NEW.server_url, NEW.captured_project_info, NEW.study, NEW.transfer_mode, NEW.frequency, NEW.status, NEW.post_transfer_pipeline, NEW.notes, NEW.dynamic_model_table,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: role_description_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.role_description_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO role_description_history (
    app_type_id, role_name, role_template, name, description,
    disabled,
    admin_id,
    created_at,
    updated_at,
    role_description_id)
  SELECT
    NEW.app_type_id, NEW.role_name, NEW.role_template, NEW.name, NEW.description,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: tracker_upsert(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.tracker_upsert () returns trigger language plpgsql as $$
      DECLARE
        latest_tracker trackers%ROWTYPE;
      BEGIN



        -- Look for a row in trackers for the inserted master / protocol pair
        SELECT * into latest_tracker
          FROM trackers
          WHERE
            master_id = NEW.master_id
            AND protocol_id = NEW.protocol_id
          ORDER BY
            event_date DESC NULLS LAST, updated_at DESC NULLS LAST
          LIMIT 1
        ;

        IF NOT FOUND THEN
          -- Nothing was found, so just allow the insert to continue

          RETURN NEW;

        ELSE
          -- A trackers row for the master / protocol pair was found.
          -- Check if it is more recent, by having an event date either later than the insert, or
          -- has an event_date the same as the insert but with later updated_at time (unlikely)

          IF latest_tracker.event_date > NEW.event_date OR
              latest_tracker.event_date = NEW.event_date AND latest_tracker.updated_at > NEW.updated_at
              THEN

            -- The retrieved record was more recent, we should not make a change to the trackers table,
            -- but instead we need to ensure an insert into the tracker_history table does happen even though there
            -- is no actual insert or update trigger to fire.
            -- We use the trackers record ID that was retrieved as the tracker_id in tracker_history

            INSERT INTO tracker_history (
                tracker_id, master_id, protocol_id,
                protocol_event_id, event_date, sub_process_id, notes,
                item_id, item_type,
                created_at, updated_at, user_id
              )
              SELECT
                latest_tracker.id, NEW.master_id, NEW.protocol_id,
                NEW.protocol_event_id, NEW.event_date,
                NEW.sub_process_id, NEW.notes,
                NEW.item_id, NEW.item_type,
                NEW.created_at, NEW.updated_at, NEW.user_id  ;

            RETURN NULL;

          ELSE
            -- The tracker record for the master / protocol pair exists and was not more recent, therefore it
            -- needs to be replaced by the intended NEW record. Complete with an update and allow the cascading
            -- trackers update trigger to handle the insert into tracker_history.

            UPDATE trackers SET
              master_id = NEW.master_id,
              protocol_id = NEW.protocol_id,
              protocol_event_id = NEW.protocol_event_id,
              event_date = NEW.event_date,
              sub_process_id = NEW.sub_process_id,
              notes = NEW.notes,
              item_id = NEW.item_id,
              item_type = NEW.item_type,
              -- do not update created_at --
              updated_at = NEW.updated_at,
              user_id = NEW.user_id
            WHERE master_id = NEW.master_id AND
              protocol_id = NEW.protocol_id
            ;

            -- Prevent the original insert from actually completing.
            RETURN NULL;
          END IF;
        END IF;
      END;
    $$
;


--
-- Name: update_address_ranks(integer); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.update_address_ranks (set_master_id integer) returns integer language plpgsql as $$
        DECLARE
          latest_primary RECORD;
        BEGIN

          SELECT * into latest_primary
          FROM addresses
          WHERE master_id = set_master_id
          AND rank = 10
          ORDER BY updated_at DESC
          LIMIT 1;

          IF NOT FOUND THEN
            RETURN NULL;
          END IF;


          UPDATE addresses SET rank = 5
          WHERE
            master_id = set_master_id
            AND rank = 10
            AND id <> latest_primary.id;


          RETURN 1;
        END;
    $$
;


--
-- Name: update_master_with_player_info(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.update_master_with_player_info () returns trigger language plpgsql as $$
      BEGIN
          UPDATE masters
              set rank = (
              case when NEW.rank is null then null
                   when (NEW.rank > 12) then NEW.rank * -1
                   else new.rank
              end
              )

          WHERE masters.id = NEW.master_id;

          RETURN NEW;
      END;
      $$
;


--
-- Name: update_master_with_pro_info(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.update_master_with_pro_info () returns trigger language plpgsql as $$
    BEGIN
        UPDATE masters
            set pro_info_id = NEW.id, pro_id = NEW.pro_id
        WHERE masters.id = NEW.master_id;

        RETURN NEW;
    END;
    $$
;


--
-- Name: update_player_contact_ranks(integer, character varying); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.update_player_contact_ranks (set_master_id integer, set_rec_type character varying) returns integer language plpgsql as $$
        DECLARE
          latest_primary RECORD;
        BEGIN

          SELECT * into latest_primary
          FROM player_contacts
          WHERE master_id = set_master_id
          AND rank = 10
          AND rec_type = set_rec_type
          ORDER BY updated_at DESC
          LIMIT 1;

          IF NOT FOUND THEN
            RETURN NULL;
          END IF;


          UPDATE player_contacts SET rank = 5
          WHERE
            master_id = set_master_id
            AND rank = 10
            AND rec_type = set_rec_type
            AND id <> latest_primary.id;


          RETURN 1;
        END;
    $$
;


--
-- Name: user_description_history_upd(); Type: FUNCTION; Schema: ml_app; Owner: -
--
create function ml_app.user_description_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO user_description_history (
    app_type_id, role_name, role_template, name, description,
    disabled,
    admin_id,
    created_at,
    updated_at,
    user_description_id)
  SELECT
    NEW.app_type_id, NEW.role_name, NEW.role_template, NEW.name, NEW.description,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: calc_var_stats_for_boolean(bigint); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.calc_var_stats_for_boolean (var_id bigint) returns table (
  variable_id bigint,
  variable text,
  results bigint[],
  labels character varying[],
  cat_counts jsonb,
  distincts bigint,
  completed bigint,
  total_recs bigint,
  "chart:" text
) language plpgsql as $_$
declare
sql text;
varrec record;
varname varchar;
BEGIN 
	
select * from ref_data.datadic_variables dv where id = var_id
into varrec;

varname := varrec.storage_varname;

raise notice '%1', varrec;
if varname is null then
  raise notice 'No matching storage variable name for variable %', (var_id);
  
  return;
end if;

sql := format($$
with n as (
    select %1$s
    from %3$s.%4$s
), 
c as (
	select %1$s::varchar cat, count(*) num
	from n
	group by %1$s
),
m as (
    select 
      (
        select array_to_json(array_agg(json_build_object(c.cat, c.num))) from c
        where c.cat is not null
      ) cat_counts_m,
      count(distinct %1$s)  distincts_m,
      count(%1$s) count_m,
      count(coalesce(%1$s, false)) recs_m
    from n
)
select
%5$s::bigint variable_id,
'%1$s' "variable",
array_agg(num) "results", 
array_agg(cat) "labels", 
cat_counts_m::jsonb "cat_counts",
distincts_m "distincts", -- distinct values
count_m  "completed",
recs_m "total_recs",
null "chart"
from 
c, m
where c.cat is not null
group by "variable",
 "cat_counts",
 "distincts",
 "completed",
 "total_recs"
 ;
$$
,
varname, varrec.variable_type, varrec.schema_or_path, varrec.table_or_file, var_id
);

return query execute sql;

return query execute sql;
exception when others then
raise notice '%', varrec;
raise notice '%', sqlerrm;
null;


end
$_$
;


--
-- Name: calc_var_stats_for_categorical(bigint); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.calc_var_stats_for_categorical (var_id bigint) returns table (
  variable_id bigint,
  variable text,
  results bigint[],
  labels character varying[],
  cat_counts jsonb,
  distincts bigint,
  completed bigint,
  total_recs bigint,
  "chart:" text
) language plpgsql as $_$
declare
sql text;
varrec record;
varname varchar;
BEGIN 
	
select * from ref_data.datadic_variables dv where id = var_id
into varrec;

varname := varrec.storage_varname;

raise notice '%1', varrec;
if varname is null then
  raise notice 'No matching storage variable name for variable %', (var_id);
  
  return;
end if;

sql := format($$
with n as (
    select nullif(%1$s, '')::numeric  %1$s
    from %3$s.%4$s
), 
c as (
	select %1$s::varchar cat, count(*) num
	from n
	group by %1$s
	order by "cat"
),
m as (
    select 
      (
        select array_to_json(array_agg(json_build_object(c.cat, c.num))) from c
        where c.cat is not null
      ) cat_counts_m,
      count(distinct %1$s)  distincts_m,
      count(%1$s) count_m,
      count(coalesce(%1$s, 0)) recs_m
    from n
)
select
%5$s::bigint variable_id,
'%1$s' "variable",
array_agg(num) "results", 
array_agg(cat) "labels", 
cat_counts_m::jsonb "cat_counts",
distincts_m "distincts", -- distinct values
count_m  "completed",
recs_m "total_recs",
null "chart"
from 
c, m
where c.cat is not null
group by "variable",
 "cat_counts",
 "distincts",
 "completed",
 "total_recs"
 ;
$$
,
varname, varrec.variable_type, varrec.schema_or_path, varrec.table_or_file, var_id
);

return query execute sql;

return query execute sql;
exception when others then
raise notice '%', varrec;
raise notice '%', sqlerrm;
null;


end
$_$
;


--
-- Name: calc_var_stats_for_numeric(bigint); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.calc_var_stats_for_numeric (var_id bigint) returns table (
  variable_id bigint,
  variable text,
  results bigint[],
  labels character varying[],
  min numeric,
  med numeric,
  max numeric,
  mean numeric,
  stddev numeric,
  distincts bigint,
  completed bigint,
  total_recs bigint,
  "chart:" text
) language plpgsql as $_$
declare
sql text;
varrec record;
varname varchar;
vardt varchar;
BEGIN 
	
select * 
from ref_data.datadic_variables dv 
inner join
information_schema."columns"
on dv.table_or_file = table_name and dv.schema_or_path = table_schema
and dv.storage_varname = column_name
where id = var_id
into varrec;

varname := varrec.storage_varname;
vardt := varrec.data_type;

if varname is null then
  raise notice 'No matching storage variable name for variable %', (var_id);
  
  return;
end if;

--raise notice 'ID: %', varrec.id;

sql := format($$
with n as (
    select 
$$ ||    
  case when vardt in ('varchar','character varying', 'text')
  then 
  $$ nullif(%1$s, '')::numeric $$
  else $$ %1$s::numeric $$
  end
|| $$ 
%1$s
    from %3$s.%4$s
), 
m as (
    select 
      min(%1$s) min_m, 
      max(%1$s) max_m,
      round((PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY %1$s))::numeric, 1) med_m,
      round(avg(%1$s)::numeric, 1) mean_m, 
      round(stddev_pop(%1$s)::numeric, 1) stddev_m,
      count(distinct %1$s)  distincts_m,
      count(%1$s) count_m,
      count(coalesce(%1$s, 0)) recs_m,
      12 buckets_m,
      (max(%1$s)-min(%1$s))/12 bin_width_m
    from n
)
select
%5$s::bigint variable_id,
'%1$s' "variable",
array_agg(num) "results", 
array_agg(bucket)::varchar[] "labels", 
min_m "min", 
med_m "med",
max_m "max", 
mean_m "mean", 
stddev_m "stddev",
distincts_m "distincts", -- distinct values
count_m  "completed",
recs_m "total_recs",
null "chart"
from 
(

  select 
  count(val) num, 
  --t.val val, 
  (round(min_m + ((bin-1) * bin_width_m),2))::varchar || ' - ' || (round(min_m + ((bin) * bin_width_m),2))::varchar "bucket"
  from
  (
    select generate_series(1,buckets_m+1) bin from m
  ) bins
  left join (
    select 
      width_bucket(%1$s, min_m, max_m+0.0000001, buckets_m) bucket, 
      %1$s val
    from n, m
    where %1$s is not null
  ) t on bins.bin = t.bucket
  cross join  m
  group by bin, min_m, bin_width_m
  order by bin
  
) vals, m
group by "variable",
 "min", 
 "med",
 "max", 
 "mean", 
 "stddev",
 "distincts",
 "completed",
 "total_recs"
 ;
$$
,
varname, varrec.variable_type, varrec.schema_or_path, varrec.table_or_file, var_id, vardt
);
--raise notice '%', sql;

return query execute sql;
exception when others then
raise notice '%', varrec;
raise notice '%', sqlerrm;
null;

end
$_$
;


--
-- Name: log_data_variable_package_vars_update(); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.log_data_variable_package_vars_update () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO data_variable_package_var_history (
    
    data_variable_package_id, domain, record_id, variable_name, record_type, disabled,
    user_id,
    created_at,
    updated_at,
    data_variable_package_var_id)
  SELECT
    
    NEW.data_variable_package_id, NEW.domain, NEW.record_id, NEW.variable_name, NEW.record_type, NEW.disabled,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: log_data_variable_packages_update(); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.log_data_variable_packages_update () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO data_variable_package_history (
    
    name, tag_select_health_categories, package_type, storage_type, db_or_fs, schema_or_path, table_or_file, is_static, sourced_from_packages, n_for_timepoints, contact_email, key_fields, description, info_url, disabled,
    user_id,
    created_at,
    updated_at,
    data_variable_package_id)
  SELECT
    
    NEW.name, NEW.tag_select_health_categories, NEW.package_type, NEW.storage_type, NEW.db_or_fs, NEW.schema_or_path, NEW.table_or_file, NEW.is_static, NEW.sourced_from_packages, NEW.n_for_timepoints, NEW.contact_email, NEW.key_fields, NEW.description, NEW.info_url, NEW.disabled,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: log_datadic_variables_update(); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.log_datadic_variables_update () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO datadic_variable_history (
    
    study, source_name, source_type, domain, form_name, variable_name, variable_type, presentation_type, label, label_note, annotation, is_required, valid_type, valid_min, valid_max, multi_valid_choices, is_identifier, is_derived_var, multi_derived_from_id, doc_url, target_type, owner_email, classification, other_classification, multi_timepoints, equivalent_to_id, storage_type, db_or_fs, schema_or_path, table_or_file, disabled, admin_id, redcap_data_dictionary_id, position, section_id, sub_section_id, title, storage_varname, contributor_type, n_for_timepoints, notes,
    user_id,
    created_at,
    updated_at,
    datadic_variable_id)
  SELECT
    
    NEW.study, NEW.source_name, NEW.source_type, NEW.domain, NEW.form_name, NEW.variable_name, NEW.variable_type, NEW.presentation_type, NEW.label, NEW.label_note, NEW.annotation, NEW.is_required, NEW.valid_type, NEW.valid_min, NEW.valid_max, NEW.multi_valid_choices, NEW.is_identifier, NEW.is_derived_var, NEW.multi_derived_from_id, NEW.doc_url, NEW.target_type, NEW.owner_email, NEW.classification, NEW.other_classification, NEW.multi_timepoints, NEW.equivalent_to_id, NEW.storage_type, NEW.db_or_fs, NEW.schema_or_path, NEW.table_or_file, NEW.disabled, NEW.admin_id, NEW.redcap_data_dictionary_id, NEW.position, NEW.section_id, NEW.sub_section_id, NEW.title, NEW.storage_varname, NEW.contributor_type, NEW.n_for_timepoints, NEW.notes,
    NEW.user_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: redcap_data_collection_instrument_history_upd(); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.redcap_data_collection_instrument_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO redcap_data_collection_instrument_history (
    redcap_project_admin_id, name, label,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_data_collection_instrument_id)
  SELECT
    NEW.redcap_project_admin_id, NEW.name, NEW.label,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: redcap_project_user_history_upd(); Type: FUNCTION; Schema: ref_data; Owner: -
--
create function ref_data.redcap_project_user_history_upd () returns trigger language plpgsql as $$
BEGIN
  INSERT INTO redcap_project_user_history (
    redcap_project_admin_id, username, email, expiration,
    disabled,
    admin_id,
    created_at,
    updated_at,
    redcap_project_user_id)
  SELECT
    NEW.redcap_project_admin_id, NEW.username, NEW.email, NEW.expiration,
    NEW.disabled,
    NEW.admin_id,
    NEW.created_at,
    NEW.updated_at,
    NEW.id;
  RETURN NEW;
END;
$$
;


--
-- Name: accuracy_score_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.accuracy_score_history (
    id integer not null,
    name character varying,
    value integer,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    accuracy_score_id integer
  )
;


--
-- Name: accuracy_score_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.accuracy_score_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: accuracy_score_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.accuracy_score_history_id_seq owned by ml_app.accuracy_score_history.id
;


--
-- Name: accuracy_scores; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.accuracy_scores (
    id integer not null,
    name character varying,
    value integer,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean
  )
;


--
-- Name: accuracy_scores_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.accuracy_scores_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: accuracy_scores_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.accuracy_scores_id_seq owned by ml_app.accuracy_scores.id
;


--
-- Name: activity_log_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.activity_log_history (
    id integer not null,
    activity_log_id integer,
    name character varying,
    item_type character varying,
    rec_type character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    action_when_attribute character varying,
    field_list character varying,
    blank_log_field_list character varying,
    blank_log_name character varying,
    extra_log_types character varying,
    hide_item_list_panel boolean,
    main_log_name character varying,
    process_name character varying,
    table_name character varying,
    category character varying,
    schema_name character varying
  )
;


--
-- Name: activity_log_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.activity_log_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: activity_log_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.activity_log_history_id_seq owned by ml_app.activity_log_history.id
;


--
-- Name: activity_log_player_contact_phone_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.activity_log_player_contact_phone_history (
    id integer not null,
    master_id integer,
    player_contact_id integer,
    data character varying,
    select_call_direction character varying,
    select_who character varying,
    called_when date,
    select_result character varying,
    select_next_step character varying,
    follow_up_when date,
    notes character varying,
    protocol_id integer,
    set_related_player_contact_rank character varying,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    activity_log_player_contact_phone_id integer,
    extra_log_type character varying
  )
;


--
-- Name: activity_log_player_contact_phone_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.activity_log_player_contact_phone_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: activity_log_player_contact_phone_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.activity_log_player_contact_phone_history_id_seq owned by ml_app.activity_log_player_contact_phone_history.id
;


--
-- Name: activity_log_player_contact_phones; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.activity_log_player_contact_phones (
    id integer not null,
    data character varying,
    select_call_direction character varying,
    select_who character varying,
    called_when date,
    select_result character varying,
    select_next_step character varying,
    follow_up_when date,
    protocol_id integer,
    notes character varying,
    user_id integer,
    player_contact_id integer,
    master_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    set_related_player_contact_rank character varying,
    extra_log_type character varying
  )
;


--
-- Name: activity_log_player_contact_phones_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.activity_log_player_contact_phones_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: activity_log_player_contact_phones_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.activity_log_player_contact_phones_id_seq owned by ml_app.activity_log_player_contact_phones.id
;


--
-- Name: activity_logs; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.activity_logs (
    id integer not null,
    name character varying,
    item_type character varying,
    rec_type character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    action_when_attribute character varying,
    field_list character varying,
    blank_log_field_list character varying,
    blank_log_name character varying,
    extra_log_types character varying,
    hide_item_list_panel boolean,
    main_log_name character varying,
    process_name character varying,
    table_name character varying,
    category character varying,
    schema_name character varying
  )
;


--
-- Name: activity_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.activity_logs_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: activity_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.activity_logs_id_seq owned by ml_app.activity_logs.id
;


--
-- Name: address_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.address_history (
    id integer not null,
    master_id integer,
    street character varying,
    street2 character varying,
    street3 character varying,
    city character varying,
    state character varying,
    zip character varying,
    source character varying,
    rank integer,
    rec_type character varying,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now(),
    country character varying(3),
    postal_code character varying,
    region character varying,
    address_id integer
  )
;


--
-- Name: address_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.address_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: address_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.address_history_id_seq owned by ml_app.address_history.id
;


--
-- Name: addresses; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.addresses (
    id integer not null,
    master_id integer,
    street character varying,
    street2 character varying,
    street3 character varying,
    city character varying,
    state character varying,
    zip character varying,
    source character varying,
    rank integer,
    rec_type character varying,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now(),
    country character varying(3),
    postal_code character varying,
    region character varying
  )
;


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.addresses_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.addresses_id_seq owned by ml_app.addresses.id
;


--
-- Name: admin_action_logs; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.admin_action_logs (
    id integer not null,
    admin_id integer,
    item_type character varying,
    item_id integer,
    action character varying,
    url character varying,
    prev_value json,
    new_value json,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: admin_action_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.admin_action_logs_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: admin_action_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.admin_action_logs_id_seq owned by ml_app.admin_action_logs.id
;


--
-- Name: admin_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.admin_history (
    id integer not null,
    email character varying default ''::character varying not null,
    encrypted_password character varying default ''::character varying not null,
    sign_in_count integer default 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    failed_attempts integer default 0,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    disabled boolean,
    admin_id integer,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    reset_password_sent_at timestamp without time zone,
    password_updated_at timestamp without time zone,
    updated_by_admin_id integer
  )
;


--
-- Name: admin_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.admin_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: admin_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.admin_history_id_seq owned by ml_app.admin_history.id
;


--
-- Name: admins; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.admins (
    id integer not null,
    email character varying default ''::character varying not null,
    encrypted_password character varying default ''::character varying not null,
    sign_in_count integer default 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying,
    failed_attempts integer default 0,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    disabled boolean,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    reset_password_sent_at timestamp without time zone,
    password_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    do_not_email boolean default false,
    admin_id bigint,
    capabilities character varying[],
    otp_secret character varying
  )
;


--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.admins_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.admins_id_seq owned by ml_app.admins.id
;


--
-- Name: app_configuration_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.app_configuration_history (
    id integer not null,
    name character varying,
    value character varying,
    app_type_id bigint,
    user_id bigint,
    role_name character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    app_configuration_id integer
  )
;


--
-- Name: app_configuration_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.app_configuration_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: app_configuration_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.app_configuration_history_id_seq owned by ml_app.app_configuration_history.id
;


--
-- Name: app_configurations; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.app_configurations (
    id integer not null,
    name character varying,
    value character varying,
    disabled boolean,
    admin_id integer,
    user_id integer,
    app_type_id integer,
    role_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: app_configurations_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.app_configurations_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: app_configurations_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.app_configurations_id_seq owned by ml_app.app_configurations.id
;


--
-- Name: app_type_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.app_type_history (
    id integer not null,
    name character varying,
    label character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    app_type_id integer
  )
;


--
-- Name: app_type_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.app_type_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: app_type_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.app_type_history_id_seq owned by ml_app.app_type_history.id
;


--
-- Name: app_types; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.app_types (
    id integer not null,
    name character varying,
    label character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    default_schema_name character varying
  )
;


--
-- Name: app_types_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.app_types_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: app_types_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.app_types_id_seq owned by ml_app.app_types.id
;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.ar_internal_metadata (
    key character varying not null,
    value character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: college_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.college_history (
    id integer not null,
    name character varying,
    synonym_for_id integer,
    disabled boolean,
    admin_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    college_id integer
  )
;


--
-- Name: college_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.college_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: college_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.college_history_id_seq owned by ml_app.college_history.id
;


--
-- Name: colleges; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.colleges (
    id integer not null,
    name character varying,
    synonym_for_id integer,
    disabled boolean,
    admin_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: colleges_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.colleges_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: colleges_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.colleges_id_seq owned by ml_app.colleges.id
;


--
-- Name: config_libraries; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.config_libraries (
    id integer not null,
    category character varying,
    name character varying,
    options character varying,
    format character varying,
    disabled boolean default false,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: config_libraries_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.config_libraries_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: config_libraries_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.config_libraries_id_seq owned by ml_app.config_libraries.id
;


--
-- Name: config_library_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.config_library_history (
    id integer not null,
    category character varying,
    name character varying,
    options character varying,
    format character varying,
    disabled boolean default false,
    admin_id integer,
    config_library_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: config_library_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.config_library_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: config_library_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.config_library_history_id_seq owned by ml_app.config_library_history.id
;


--
-- Name: copy_player_infos; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.copy_player_infos (
    id integer,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contactid integer,
    college character varying,
    end_year integer,
    source character varying
  )
;


--
-- Name: delayed_jobs; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.delayed_jobs (
    id integer not null,
    priority integer default 0 not null,
    attempts integer default 0 not null,
    handler text not null,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.delayed_jobs_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.delayed_jobs_id_seq owned by ml_app.delayed_jobs.id
;


--
-- Name: dynamic_model_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.dynamic_model_history (
    id integer not null,
    name character varying,
    table_name character varying,
    schema_name character varying,
    primary_key_name character varying,
    foreign_key_name character varying,
    description character varying,
    admin_id integer,
    disabled boolean,
    "position" integer,
    category character varying,
    table_key_name character varying,
    field_list character varying,
    result_order character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    dynamic_model_id integer,
    options character varying
  )
;


--
-- Name: dynamic_model_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.dynamic_model_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: dynamic_model_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.dynamic_model_history_id_seq owned by ml_app.dynamic_model_history.id
;


--
-- Name: dynamic_models; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.dynamic_models (
    id integer not null,
    name character varying,
    table_name character varying,
    schema_name character varying,
    primary_key_name character varying,
    foreign_key_name character varying,
    description character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    "position" integer,
    category character varying,
    table_key_name character varying,
    field_list character varying,
    result_order character varying,
    options character varying
  )
;


--
-- Name: dynamic_models_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.dynamic_models_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: dynamic_models_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.dynamic_models_id_seq owned by ml_app.dynamic_models.id
;


--
-- Name: exception_logs; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.exception_logs (
    id integer not null,
    message character varying,
    main character varying,
    backtrace character varying,
    user_id integer,
    admin_id integer,
    notified_at timestamp without time zone,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: exception_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.exception_logs_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: exception_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.exception_logs_id_seq owned by ml_app.exception_logs.id
;


--
-- Name: external_identifier_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.external_identifier_history (
    id integer not null,
    name character varying,
    label character varying,
    external_id_attribute character varying,
    external_id_view_formatter character varying,
    external_id_edit_pattern character varying,
    prevent_edit boolean,
    pregenerate_ids boolean,
    min_id bigint,
    max_id bigint,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    external_identifier_id integer,
    extra_fields character varying,
    alphanumeric boolean,
    schema_name character varying,
    options character varying
  )
;


--
-- Name: external_identifier_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.external_identifier_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: external_identifier_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.external_identifier_history_id_seq owned by ml_app.external_identifier_history.id
;


--
-- Name: external_identifiers; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.external_identifiers (
    id integer not null,
    name character varying,
    label character varying,
    external_id_attribute character varying,
    external_id_view_formatter character varying,
    external_id_edit_pattern character varying,
    prevent_edit boolean,
    pregenerate_ids boolean,
    min_id bigint,
    max_id bigint,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    alphanumeric boolean,
    extra_fields character varying,
    category character varying,
    schema_name character varying,
    options character varying
  )
;


--
-- Name: external_identifiers_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.external_identifiers_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: external_identifiers_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.external_identifiers_id_seq owned by ml_app.external_identifiers.id
;


--
-- Name: external_link_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.external_link_history (
    id integer not null,
    name character varying,
    value character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    external_link_id integer
  )
;


--
-- Name: external_link_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.external_link_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: external_link_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.external_link_history_id_seq owned by ml_app.external_link_history.id
;


--
-- Name: external_links; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.external_links (
    id integer not null,
    name character varying,
    value character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: external_links_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.external_links_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: external_links_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.external_links_id_seq owned by ml_app.external_links.id
;


--
-- Name: general_selection_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.general_selection_history (
    id integer not null,
    name character varying,
    value character varying,
    item_type character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    admin_id integer,
    create_with boolean,
    edit_if_set boolean,
    edit_always boolean,
    "position" integer,
    description character varying,
    lock boolean,
    general_selection_id integer
  )
;


--
-- Name: general_selection_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.general_selection_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: general_selection_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.general_selection_history_id_seq owned by ml_app.general_selection_history.id
;


--
-- Name: general_selections; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.general_selections (
    id integer not null,
    name character varying,
    value character varying,
    item_type character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    admin_id integer,
    create_with boolean,
    edit_if_set boolean,
    edit_always boolean,
    "position" integer,
    description character varying,
    lock boolean
  )
;


--
-- Name: general_selections_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.general_selections_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: general_selections_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.general_selections_id_seq owned by ml_app.general_selections.id
;


--
-- Name: imports; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.imports (
    id integer not null,
    primary_table character varying,
    item_count integer,
    filename character varying,
    imported_items integer[],
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: imports_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.imports_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: imports_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.imports_id_seq owned by ml_app.imports.id
;


--
-- Name: imports_model_generators; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.imports_model_generators (
    id bigint not null,
    name character varying,
    dynamic_model_table character varying,
    options json,
    description character varying,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: imports_model_generators_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.imports_model_generators_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: imports_model_generators_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.imports_model_generators_id_seq owned by ml_app.imports_model_generators.id
;


--
-- Name: item_flag_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.item_flag_history (
    id integer not null,
    item_id integer,
    item_type character varying,
    item_flag_name_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    user_id integer,
    item_flag_id integer,
    disabled boolean
  )
;


--
-- Name: item_flag_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.item_flag_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: item_flag_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.item_flag_history_id_seq owned by ml_app.item_flag_history.id
;


--
-- Name: item_flag_name_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.item_flag_name_history (
    id integer not null,
    name character varying,
    item_type character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    item_flag_name_id integer
  )
;


--
-- Name: item_flag_name_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.item_flag_name_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: item_flag_name_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.item_flag_name_history_id_seq owned by ml_app.item_flag_name_history.id
;


--
-- Name: item_flag_names; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.item_flag_names (
    id integer not null,
    name character varying,
    item_type character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    admin_id integer
  )
;


--
-- Name: item_flag_names_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.item_flag_names_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: item_flag_names_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.item_flag_names_id_seq owned by ml_app.item_flag_names.id
;


--
-- Name: item_flags; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.item_flags (
    id integer not null,
    item_id integer,
    item_type character varying,
    item_flag_name_id integer not null,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    user_id integer,
    disabled boolean
  )
;


--
-- Name: item_flags_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.item_flags_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: item_flags_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.item_flags_id_seq owned by ml_app.item_flags.id
;


--
-- Name: manage_users; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.manage_users (
    id integer not null,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: manage_users_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.manage_users_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: manage_users_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.manage_users_id_seq owned by ml_app.manage_users.id
;


--
-- Name: masters; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.masters (
    id integer not null,
    msid integer,
    pro_id integer,
    pro_info_id integer,
    rank integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer,
    contact_id integer,
    created_by_user_id bigint
  )
;


--
-- Name: masters_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.masters_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: masters_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.masters_id_seq owned by ml_app.masters.id
;


--
-- Name: message_notifications; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.message_notifications (
    id integer not null,
    app_type_id integer,
    master_id integer,
    user_id integer,
    item_id integer,
    item_type character varying,
    message_type character varying,
    recipient_user_ids integer[],
    layout_template_name character varying,
    content_template_name character varying,
    generated_content character varying,
    status character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    status_changed character varying,
    subject character varying,
    data json,
    recipient_data character varying[],
    from_user_email character varying,
    role_name character varying,
    content_template_text character varying,
    importance character varying,
    extra_substitutions character varying,
    content_hash character varying
  )
;


--
-- Name: message_notifications_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.message_notifications_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: message_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.message_notifications_id_seq owned by ml_app.message_notifications.id
;


--
-- Name: message_template_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.message_template_history (
    id integer not null,
    name character varying,
    template_type character varying,
    template character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    message_template_id integer,
    message_type character varying,
    category character varying
  )
;


--
-- Name: message_template_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.message_template_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: message_template_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.message_template_history_id_seq owned by ml_app.message_template_history.id
;


--
-- Name: message_templates; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.message_templates (
    id integer not null,
    name character varying,
    message_type character varying,
    template_type character varying,
    template character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    category character varying
  )
;


--
-- Name: message_templates_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.message_templates_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: message_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.message_templates_id_seq owned by ml_app.message_templates.id
;


--
-- Name: model_references; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.model_references (
    id integer not null,
    from_record_type character varying,
    from_record_id integer,
    from_record_master_id integer,
    to_record_type character varying,
    to_record_id integer,
    to_record_master_id integer,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean
  )
;


--
-- Name: model_references_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.model_references_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: model_references_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.model_references_id_seq owned by ml_app.model_references.id
;


--
-- Name: msid_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.msid_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_archived_file_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_archived_file_history (
    id integer not null,
    file_hash character varying,
    file_name character varying,
    content_type character varying,
    archive_file character varying,
    path character varying,
    file_size character varying,
    file_updated_at character varying,
    nfs_store_container_id bigint,
    title character varying,
    description character varying,
    file_metadata character varying,
    nfs_store_stored_file_id bigint,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_archived_file_id integer,
    embed_resource_name character varying,
    embed_resource_id bigint
  )
;


--
-- Name: nfs_store_archived_file_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_archived_file_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_archived_file_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_archived_file_history_id_seq owned by ml_app.nfs_store_archived_file_history.id
;


--
-- Name: nfs_store_archived_files_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_archived_files_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_archived_files_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_archived_files_id_seq owned by ml_app.nfs_store_archived_files.id
;


--
-- Name: nfs_store_container_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_container_history (
    id integer not null,
    master_id integer,
    name character varying,
    app_type_id bigint,
    orig_nfs_store_container_id bigint,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_container_id integer,
    created_by_user_id bigint
  )
;


--
-- Name: nfs_store_container_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_container_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_container_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_container_history_id_seq owned by ml_app.nfs_store_container_history.id
;


--
-- Name: nfs_store_containers_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_containers_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_containers_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_containers_id_seq owned by ml_app.nfs_store_containers.id
;


--
-- Name: nfs_store_downloads; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_downloads (
    id integer not null,
    user_groups integer[] default '{}'::integer[],
    path character varying,
    retrieval_path character varying,
    retrieved_items character varying,
    user_id integer not null,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_container_ids integer[]
  )
;


--
-- Name: nfs_store_downloads_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_downloads_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_downloads_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_downloads_id_seq owned by ml_app.nfs_store_downloads.id
;


--
-- Name: nfs_store_filter_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_filter_history (
    id integer not null,
    app_type_id bigint,
    role_name character varying,
    user_id bigint,
    resource_name character varying,
    filter character varying,
    description character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_filter_id integer
  )
;


--
-- Name: nfs_store_filter_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_filter_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_filter_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_filter_history_id_seq owned by ml_app.nfs_store_filter_history.id
;


--
-- Name: nfs_store_filters; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_filters (
    id integer not null,
    app_type_id integer,
    role_name character varying,
    user_id integer,
    resource_name character varying,
    filter character varying,
    description character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: nfs_store_filters_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_filters_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_filters_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_filters_id_seq owned by ml_app.nfs_store_filters.id
;


--
-- Name: nfs_store_imports; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_imports (
    id integer not null,
    file_hash character varying,
    file_name character varying,
    user_id integer,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    path character varying
  )
;


--
-- Name: nfs_store_imports_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_imports_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_imports_id_seq owned by ml_app.nfs_store_imports.id
;


--
-- Name: nfs_store_move_actions; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_move_actions (
    id integer not null,
    user_groups integer[],
    path character varying,
    new_path character varying,
    retrieval_path character varying,
    moved_items character varying,
    nfs_store_container_ids integer[],
    user_id integer not null,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: nfs_store_move_actions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_move_actions_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_move_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_move_actions_id_seq owned by ml_app.nfs_store_move_actions.id
;


--
-- Name: nfs_store_stored_file_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_stored_file_history (
    id integer not null,
    file_hash character varying,
    file_name character varying,
    content_type character varying,
    path character varying,
    file_size character varying,
    file_updated_at character varying,
    nfs_store_container_id bigint,
    title character varying,
    description character varying,
    file_metadata character varying,
    last_process_name_run character varying,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nfs_store_stored_file_id integer,
    embed_resource_name character varying,
    embed_resource_id bigint
  )
;


--
-- Name: nfs_store_stored_file_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_stored_file_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_stored_file_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_stored_file_history_id_seq owned by ml_app.nfs_store_stored_file_history.id
;


--
-- Name: nfs_store_stored_files_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_stored_files_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_stored_files_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_stored_files_id_seq owned by ml_app.nfs_store_stored_files.id
;


--
-- Name: nfs_store_trash_actions; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_trash_actions (
    id integer not null,
    user_groups integer[] default '{}'::integer[],
    path character varying,
    retrieval_path character varying,
    trashed_items character varying,
    nfs_store_container_ids integer[],
    user_id integer not null,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: nfs_store_trash_actions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_trash_actions_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_trash_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_trash_actions_id_seq owned by ml_app.nfs_store_trash_actions.id
;


--
-- Name: nfs_store_uploads; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_uploads (
    id integer not null,
    file_hash character varying not null,
    file_name character varying not null,
    content_type character varying not null,
    file_size bigint not null,
    chunk_count integer,
    completed boolean,
    file_updated_at timestamp without time zone,
    user_id integer,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    path character varying,
    nfs_store_stored_file_id integer,
    upload_set character varying
  )
;


--
-- Name: nfs_store_uploads_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_uploads_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_uploads_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_uploads_id_seq owned by ml_app.nfs_store_uploads.id
;


--
-- Name: nfs_store_user_file_actions; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.nfs_store_user_file_actions (
    id integer not null,
    user_groups integer[],
    path character varying,
    new_path character varying,
    action character varying,
    retrieval_path character varying,
    action_items character varying,
    nfs_store_container_ids integer[],
    user_id integer not null,
    nfs_store_container_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: nfs_store_user_file_actions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.nfs_store_user_file_actions_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: nfs_store_user_file_actions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.nfs_store_user_file_actions_id_seq owned by ml_app.nfs_store_user_file_actions.id
;


--
-- Name: page_layout_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.page_layout_history (
    id integer not null,
    layout_name character varying,
    panel_name character varying,
    panel_label character varying,
    panel_position character varying,
    options character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    page_layout_id integer,
    app_type_id character varying,
    description character varying
  )
;


--
-- Name: page_layout_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.page_layout_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: page_layout_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.page_layout_history_id_seq owned by ml_app.page_layout_history.id
;


--
-- Name: page_layouts; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.page_layouts (
    id integer not null,
    app_type_id integer,
    layout_name character varying,
    panel_name character varying,
    panel_label character varying,
    panel_position integer,
    options character varying,
    disabled boolean,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    description character varying
  )
;


--
-- Name: page_layouts_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.page_layouts_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: page_layouts_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.page_layouts_id_seq owned by ml_app.page_layouts.id
;


--
-- Name: player_contact_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.player_contact_history (
    id integer not null,
    master_id integer,
    rec_type character varying,
    data character varying,
    source character varying,
    rank integer,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now(),
    player_contact_id integer
  )
;


--
-- Name: player_contact_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.player_contact_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: player_contact_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.player_contact_history_id_seq owned by ml_app.player_contact_history.id
;


--
-- Name: player_contacts; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.player_contacts (
    id integer not null,
    master_id integer,
    rec_type character varying,
    data character varying,
    source character varying,
    rank integer,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now()
  )
;


--
-- Name: player_contacts_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.player_contacts_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: player_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.player_contacts_id_seq owned by ml_app.player_contacts.id
;


--
-- Name: player_info_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.player_info_history (
    id integer not null,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now(),
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contact_id integer,
    college character varying,
    end_year integer,
    source character varying,
    player_info_id integer
  )
;


--
-- Name: player_info_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.player_info_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: player_info_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.player_info_history_id_seq owned by ml_app.player_info_history.id
;


--
-- Name: player_infos; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.player_infos (
    id integer not null,
    master_id integer,
    first_name character varying,
    last_name character varying,
    middle_name character varying,
    nick_name character varying,
    birth_date date,
    death_date date,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now(),
    contact_pref character varying,
    start_year integer,
    rank integer,
    notes character varying,
    contact_id integer,
    college character varying,
    end_year integer,
    source character varying
  )
;


--
-- Name: player_infos_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.player_infos_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: player_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.player_infos_id_seq owned by ml_app.player_infos.id
;


--
-- Name: pro_infos; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.pro_infos (
    id integer not null,
    master_id integer,
    pro_id integer,
    first_name character varying,
    middle_name character varying,
    nick_name character varying,
    last_name character varying,
    birth_date date,
    death_date date,
    start_year integer,
    end_year integer,
    college character varying,
    birthplace character varying,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone default now()
  )
;


--
-- Name: pro_infos_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.pro_infos_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: pro_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.pro_infos_id_seq owned by ml_app.pro_infos.id
;


--
-- Name: protocol_event_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.protocol_event_history (
    id integer not null,
    name character varying,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    sub_process_id integer,
    milestone character varying,
    description character varying,
    protocol_event_id integer
  )
;


--
-- Name: protocol_event_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.protocol_event_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: protocol_event_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.protocol_event_history_id_seq owned by ml_app.protocol_event_history.id
;


--
-- Name: protocol_events; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.protocol_events (
    id integer not null,
    name character varying,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    sub_process_id integer,
    milestone character varying,
    description character varying
  )
;


--
-- Name: protocol_events_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.protocol_events_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: protocol_events_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.protocol_events_id_seq owned by ml_app.protocol_events.id
;


--
-- Name: protocol_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.protocol_history (
    id integer not null,
    name character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    admin_id integer,
    "position" integer,
    protocol_id integer
  )
;


--
-- Name: protocol_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.protocol_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: protocol_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.protocol_history_id_seq owned by ml_app.protocol_history.id
;


--
-- Name: protocols; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.protocols (
    id integer not null,
    name character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    disabled boolean,
    admin_id integer,
    "position" integer,
    app_type_id bigint
  )
;


--
-- Name: protocols_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.protocols_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: protocols_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.protocols_id_seq owned by ml_app.protocols.id
;


--
-- Name: q1_rc_links; Type: VIEW; Schema: ml_app; Owner: -
--
create view
  ml_app.q1_rc_links as
select
  rc_links.id,
  rc_links.master_id,
  rc_links.link as q1_rc_link_ext_id,
  null::timestamp without time zone as created_at,
  null::timestamp without time zone as updated_at,
  null::integer as user_id
from
  q1.rc_links
;


--
-- Name: q2_rc_links; Type: VIEW; Schema: ml_app; Owner: -
--
create view
  ml_app.q2_rc_links as
select
  rc.id,
  masters.id as master_id,
  split_part((rc.link)::text, '='::text, 2) as q2_rc_link_ext_id,
  null::timestamp without time zone as created_at,
  null::timestamp without time zone as updated_at,
  null::integer as user_id
from
  (
    q2.rc_links rc
    join ml_app.masters on ((masters.msid = rc.msid))
  )
;


--
-- Name: rc_cis; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.rc_cis (
    id integer not null,
    fname character varying,
    lname character varying,
    status character varying,
    created_at timestamp without time zone default now(),
    updated_at timestamp without time zone default now(),
    user_id integer,
    master_id integer,
    street character varying,
    street2 character varying,
    city character varying,
    state character varying,
    zip character varying,
    phone character varying,
    email character varying,
    form_date timestamp without time zone
  )
;


--
-- Name: rc_cis2; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.rc_cis2 (
    id integer,
    fname character varying,
    lname character varying,
    status character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
  )
;


--
-- Name: rc_cis_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.rc_cis_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: rc_cis_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.rc_cis_id_seq owned by ml_app.rc_cis.id
;


--
-- Name: rc_stage_cif_copy; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.rc_stage_cif_copy (
    record_id integer,
    redcap_survey_identifier integer,
    time_stamp timestamp without time zone,
    first_name character varying,
    middle_name character varying,
    last_name character varying,
    nick_name character varying,
    street character varying,
    street2 character varying,
    city character varying,
    state character varying,
    zipcode character varying,
    phone character varying,
    email character varying,
    hearabout character varying,
    completed integer,
    id integer not null,
    status character varying,
    created_at timestamp without time zone default now(),
    user_id integer,
    master_id integer,
    updated_at timestamp without time zone default now(),
    added_tracker boolean
  )
;


--
-- Name: rc_stage_cif_copy_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.rc_stage_cif_copy_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: rc_stage_cif_copy_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.rc_stage_cif_copy_id_seq owned by ml_app.rc_stage_cif_copy.id
;


--
-- Name: report_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.report_history (
    id integer not null,
    name character varying,
    description character varying,
    sql character varying,
    search_attrs character varying,
    admin_id integer,
    disabled boolean,
    report_type character varying,
    auto boolean,
    searchable boolean,
    "position" integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    report_id integer,
    item_type character varying,
    edit_model character varying,
    edit_field_names character varying,
    selection_fields character varying,
    short_name character varying,
    options character varying
  )
;


--
-- Name: report_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.report_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: report_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.report_history_id_seq owned by ml_app.report_history.id
;


--
-- Name: reports; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.reports (
    id integer not null,
    name character varying,
    description character varying,
    sql character varying,
    search_attrs character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    report_type character varying,
    auto boolean,
    searchable boolean,
    "position" integer,
    edit_model character varying,
    edit_field_names character varying,
    selection_fields character varying,
    item_type character varying,
    short_name character varying,
    options character varying
  )
;


--
-- Name: reports_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.reports_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: reports_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.reports_id_seq owned by ml_app.reports.id
;


--
-- Name: role_description_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.role_description_history (
    id bigint not null,
    role_description_id bigint,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: role_description_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.role_description_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: role_description_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.role_description_history_id_seq owned by ml_app.role_description_history.id
;


--
-- Name: role_descriptions; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.role_descriptions (
    id bigint not null,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: role_descriptions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.role_descriptions_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: role_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.role_descriptions_id_seq owned by ml_app.role_descriptions.id
;


--
-- Name: sage_assignments; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.sage_assignments (
    id integer not null,
    sage_id character varying(10),
    assigned_by character varying,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    master_id integer,
    admin_id integer
  )
;


--
-- Name: sage_assignments_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.sage_assignments_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: sage_assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.sage_assignments_id_seq owned by ml_app.sage_assignments.id
;


--
-- Name: scantron_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.scantron_history (
    id integer not null,
    master_id integer,
    scantron_id integer,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    scantron_table_id integer
  )
;


--
-- Name: scantron_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.scantron_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: scantron_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.scantron_history_id_seq owned by ml_app.scantron_history.id
;


--
-- Name: scantrons; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.scantrons (
    id integer not null,
    master_id integer,
    scantron_id integer,
    user_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: scantrons_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.scantrons_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: scantrons_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.scantrons_id_seq owned by ml_app.scantrons.id
;


--
-- Name: schema_migrations; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.schema_migrations (version character varying not null)
;


--
-- Name: sessions; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.sessions (
    id bigint not null,
    session_id character varying not null,
    data text,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.sessions_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.sessions_id_seq owned by ml_app.sessions.id
;


--
-- Name: smback; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.smback (version character varying)
;


--
-- Name: sub_process_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.sub_process_history (
    id integer not null,
    name character varying,
    disabled boolean,
    protocol_id integer,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    sub_process_id integer
  )
;


--
-- Name: sub_process_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.sub_process_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: sub_process_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.sub_process_history_id_seq owned by ml_app.sub_process_history.id
;


--
-- Name: sub_processes; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.sub_processes (
    id integer not null,
    name character varying,
    disabled boolean,
    protocol_id integer,
    admin_id integer,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: sub_processes_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.sub_processes_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: sub_processes_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.sub_processes_id_seq owned by ml_app.sub_processes.id
;


--
-- Name: tracker_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.tracker_history (
    id integer not null,
    master_id integer,
    protocol_id integer,
    tracker_id integer,
    event_date timestamp without time zone,
    user_id integer,
    notes character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    sub_process_id integer,
    protocol_event_id integer,
    item_id integer,
    item_type character varying
  )
;


--
-- Name: tracker_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.tracker_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: tracker_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.tracker_history_id_seq owned by ml_app.tracker_history.id
;


--
-- Name: trackers; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.trackers (
    id integer not null,
    master_id integer,
    protocol_id integer not null,
    event_date timestamp without time zone,
    user_id integer default ml_app.current_user_id (),
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    notes character varying,
    sub_process_id integer not null,
    protocol_event_id integer,
    item_id integer,
    item_type character varying
  )
;


--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.trackers_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.trackers_id_seq owned by ml_app.trackers.id
;


--
-- Name: user_access_control_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_access_control_history (
    id integer not null,
    user_id bigint,
    resource_type character varying,
    resource_name character varying,
    options character varying,
    access character varying,
    app_type_id bigint,
    role_name character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_access_control_id integer
  )
;


--
-- Name: user_access_control_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_access_control_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_access_control_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_access_control_history_id_seq owned by ml_app.user_access_control_history.id
;


--
-- Name: user_access_controls; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_access_controls (
    id integer not null,
    user_id integer,
    resource_type character varying,
    resource_name character varying,
    options character varying,
    access character varying,
    disabled boolean,
    admin_id integer,
    app_type_id integer,
    role_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
  )
;


--
-- Name: user_access_controls_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_access_controls_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_access_controls_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_access_controls_id_seq owned by ml_app.user_access_controls.id
;


--
-- Name: user_action_logs; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_action_logs (
    id integer not null,
    user_id integer,
    app_type_id integer,
    master_id integer,
    item_type character varying,
    item_id integer,
    index_action_ids integer[],
    action character varying,
    url character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: user_action_logs_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_action_logs_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_action_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_action_logs_id_seq owned by ml_app.user_action_logs.id
;


--
-- Name: user_authorization_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_authorization_history (
    id integer not null,
    user_id character varying,
    has_authorization character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    user_authorization_id integer
  )
;


--
-- Name: user_authorization_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_authorization_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_authorization_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_authorization_history_id_seq owned by ml_app.user_authorization_history.id
;


--
-- Name: user_authorizations; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_authorizations (
    id integer not null,
    user_id integer,
    has_authorization character varying,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: user_authorizations_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_authorizations_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_authorizations_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_authorizations_id_seq owned by ml_app.user_authorizations.id
;


--
-- Name: user_description_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_description_history (
    id bigint not null,
    user_description_id bigint,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: user_description_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_description_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_description_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_description_history_id_seq owned by ml_app.user_description_history.id
;


--
-- Name: user_descriptions; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_descriptions (
    id bigint not null,
    app_type_id bigint,
    role_name character varying,
    role_template character varying,
    name character varying,
    description character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: user_descriptions_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_descriptions_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_descriptions_id_seq owned by ml_app.user_descriptions.id
;


--
-- Name: user_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_history (
    id integer not null,
    email character varying default ''::character varying not null,
    encrypted_password character varying default ''::character varying not null,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer default 0 not null,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    failed_attempts integer default 0 not null,
    unlock_token character varying,
    locked_at timestamp without time zone,
    disabled boolean,
    admin_id integer,
    user_id integer,
    app_type_id integer,
    authentication_token character varying,
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    password_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone
  )
;


--
-- Name: user_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_history_id_seq owned by ml_app.user_history.id
;


--
-- Name: user_preferences; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_preferences (
    id bigint not null,
    user_id bigint,
    date_format character varying,
    date_time_format character varying,
    time_format character varying,
    timezone character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: user_preferences_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_preferences_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_preferences_id_seq owned by ml_app.user_preferences.id
;


--
-- Name: user_role_history; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_role_history (
    id integer not null,
    app_type_id bigint,
    role_name character varying,
    user_id bigint,
    admin_id integer,
    disabled boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_role_id integer
  )
;


--
-- Name: user_role_history_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_role_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_role_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_role_history_id_seq owned by ml_app.user_role_history.id
;


--
-- Name: user_roles; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.user_roles (
    id integer not null,
    app_type_id integer,
    role_name character varying,
    user_id integer,
    admin_id integer,
    disabled boolean default false not null,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.user_roles_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.user_roles_id_seq owned by ml_app.user_roles.id
;


--
-- Name: users; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.users (
    id integer not null,
    email character varying default ''::character varying not null,
    encrypted_password character varying default ''::character varying not null,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer default 0 not null,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    failed_attempts integer default 0 not null,
    unlock_token character varying,
    locked_at timestamp without time zone,
    disabled boolean,
    admin_id integer,
    app_type_id integer,
    authentication_token character varying(30),
    encrypted_otp_secret character varying,
    encrypted_otp_secret_iv character varying,
    encrypted_otp_secret_salt character varying,
    consumed_timestep integer,
    otp_required_for_login boolean,
    password_updated_at timestamp without time zone,
    first_name character varying,
    last_name character varying,
    do_not_email boolean default false,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    country_code character varying,
    terms_of_use_accepted character varying
  )
;


--
-- Name: users_contact_infos; Type: TABLE; Schema: ml_app; Owner: -
--
create table
  ml_app.users_contact_infos (
    id integer not null,
    user_id integer,
    sms_number character varying,
    phone_number character varying,
    alt_email character varying,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    admin_id integer,
    disabled boolean
  )
;


--
-- Name: users_contact_infos_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.users_contact_infos_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: users_contact_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.users_contact_infos_id_seq owned by ml_app.users_contact_infos.id
;


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: ml_app; Owner: -
--
create sequence ml_app.users_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: ml_app; Owner: -
--
alter sequence ml_app.users_id_seq owned by ml_app.users.id
;


--
-- Name: view_users; Type: VIEW; Schema: ml_app; Owner: -
--
create view
  ml_app.view_users as
select
  users.email,
  users.first_name,
  users.last_name,
  users.disabled
from
  ml_app.users
;


--
-- Name: datadic_choice_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.datadic_choice_history (
    id bigint not null,
    datadic_choice_id bigint,
    source_name character varying,
    source_type character varying,
    form_name character varying,
    field_name character varying,
    value character varying,
    label character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: datadic_choice_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.datadic_choice_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: datadic_choice_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.datadic_choice_history_id_seq owned by ref_data.datadic_choice_history.id
;


--
-- Name: datadic_choices; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.datadic_choices (
    id bigint not null,
    source_name character varying,
    source_type character varying,
    form_name character varying,
    field_name character varying,
    value character varying,
    label character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: datadic_choices_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.datadic_choices_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: datadic_choices_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.datadic_choices_id_seq owned by ref_data.datadic_choices.id
;


--
-- Name: datadic_variables; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.datadic_variables (
    id bigint not null,
    study character varying,
    source_name character varying,
    source_type character varying,
    domain character varying,
    form_name character varying,
    variable_name character varying,
    variable_type character varying,
    presentation_type character varying,
    label character varying,
    label_note character varying,
    annotation character varying,
    is_required boolean,
    valid_type character varying,
    valid_min character varying,
    valid_max character varying,
    multi_valid_choices character varying[],
    is_identifier boolean,
    is_derived_var boolean,
    multi_derived_from_id bigint[],
    doc_url character varying,
    target_type character varying,
    owner_email character varying,
    classification character varying,
    other_classification character varying,
    multi_timepoints character varying[],
    equivalent_to_id bigint,
    storage_type character varying,
    db_or_fs character varying,
    schema_or_path character varying,
    table_or_file character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    "position" integer,
    section_id integer,
    sub_section_id integer,
    title character varying,
    storage_varname character varying,
    user_id bigint,
    contributor_type character varying,
    n_for_timepoints jsonb,
    notes character varying
  )
;


--
-- Name: TABLE datadic_variables; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.datadic_variables is 'Dynamicmodel: User Variables'
;


--
-- Name: COLUMN datadic_variables.study; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.study is 'Study name'
;


--
-- Name: COLUMN datadic_variables.source_name; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.source_name is 'Source of variable'
;


--
-- Name: COLUMN datadic_variables.source_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.source_type is 'Source type'
;


--
-- Name: COLUMN datadic_variables.domain; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.domain is 'Domain'
;


--
-- Name: COLUMN datadic_variables.form_name; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.form_name is 'Form name (if the source was a type of form)'
;


--
-- Name: COLUMN datadic_variables.variable_name; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.variable_name is 'Variable name'
;


--
-- Name: COLUMN datadic_variables.variable_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.variable_type is 'Variable type'
;


--
-- Name: COLUMN datadic_variables.presentation_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.presentation_type is 'Data type for presentation purposes'
;


--
-- Name: COLUMN datadic_variables.label; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.label is 'Primary label or title (if source was a form, the label presented for the field)'
;


--
-- Name: COLUMN datadic_variables.label_note; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.label_note is 'Description (if source was a form, a note presented for the field)'
;


--
-- Name: COLUMN datadic_variables.annotation; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.annotation is 'Annotations (if source was a form, annotations not presented to the user)'
;


--
-- Name: COLUMN datadic_variables.is_required; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.is_required is 'Was required in source'
;


--
-- Name: COLUMN datadic_variables.valid_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.valid_type is 'Source data type'
;


--
-- Name: COLUMN datadic_variables.valid_min; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.valid_min is 'Minimum value'
;


--
-- Name: COLUMN datadic_variables.valid_max; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.valid_max is 'Maximum value'
;


--
-- Name: COLUMN datadic_variables.multi_valid_choices; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.multi_valid_choices is 'List of valid choices for categorical variables'
;


--
-- Name: COLUMN datadic_variables.is_identifier; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.is_identifier is 'Represents identifiable information'
;


--
-- Name: COLUMN datadic_variables.is_derived_var; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.is_derived_var is 'Is a derived variable'
;


--
-- Name: COLUMN datadic_variables.multi_derived_from_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.multi_derived_from_id is 'If a derived variable, ids of variables used to calculate it'
;


--
-- Name: COLUMN datadic_variables.doc_url; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.doc_url is 'URL to additional documentation'
;


--
-- Name: COLUMN datadic_variables.target_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.target_type is 'Type of participant this variable relates to'
;


--
-- Name: COLUMN datadic_variables.owner_email; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.owner_email is 'Owner, especially for derived variables'
;


--
-- Name: COLUMN datadic_variables.classification; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.classification is 'Category of sensitivity from a privacy perspective'
;


--
-- Name: COLUMN datadic_variables.other_classification; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.other_classification is 'Additional information regarding classification'
;


--
-- Name: COLUMN datadic_variables.multi_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.multi_timepoints is 'Timepoints this data is collected (in longitudinal studies)'
;


--
-- Name: COLUMN datadic_variables.equivalent_to_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.equivalent_to_id is 'Primary variable id this is equivalent to'
;


--
-- Name: COLUMN datadic_variables.storage_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.storage_type is 'Type of storage for dataset'
;


--
-- Name: COLUMN datadic_variables.db_or_fs; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.db_or_fs is 'Database or Filesystem name'
;


--
-- Name: COLUMN datadic_variables.schema_or_path; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.schema_or_path is 'Database schema or Filesystem directory path'
;


--
-- Name: COLUMN datadic_variables.table_or_file; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.table_or_file is 'Database table (or view, if derived or equivalent to another variable), or filename in directory'
;


--
-- Name: COLUMN datadic_variables.redcap_data_dictionary_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.redcap_data_dictionary_id is 'Reference to REDCap data dictionary representation'
;


--
-- Name: COLUMN datadic_variables."position"; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables."position" is 'Relative position (for source forms or other variables where order of collection matters)'
;


--
-- Name: COLUMN datadic_variables.section_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.section_id is 'Section this belongs to'
;


--
-- Name: COLUMN datadic_variables.sub_section_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.sub_section_id is 'Sub-section this belongs to'
;


--
-- Name: COLUMN datadic_variables.title; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.title is 'Section caption'
;


--
-- Name: COLUMN datadic_variables.storage_varname; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.storage_varname is 'Database field name, or variable name in data file'
;


--
-- Name: COLUMN datadic_variables.contributor_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.contributor_type is 'Type of contributor this variable was provided by'
;


--
-- Name: COLUMN datadic_variables.n_for_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.n_for_timepoints is 'For each named timepoint (name:), the population or count of responses (n:), with notes (notes:)'
;


--
-- Name: COLUMN datadic_variables.notes; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variables.notes is 'Notes'
;


--
-- Name: datadic_stats; Type: MATERIALIZED VIEW; Schema: ref_data; Owner: -
--
create materialized view
  ref_data.datadic_stats as
with
  vars as (
    select
      var.id,
      var.study,
      var.source_name,
      var.source_type,
      var.domain,
      var.form_name,
      var.variable_name,
      var.variable_type,
      var.presentation_type,
      var.label,
      var.label_note,
      var.annotation,
      var.is_required,
      var.valid_type,
      var.valid_min,
      var.valid_max,
      var.multi_valid_choices,
      var.is_identifier,
      var.is_derived_var,
      var.multi_derived_from_id,
      var.doc_url,
      var.target_type,
      var.owner_email,
      var.classification,
      var.other_classification,
      var.multi_timepoints,
      var.equivalent_to_id,
      var.storage_type,
      var.db_or_fs,
      var.schema_or_path,
      var.table_or_file,
      var.disabled,
      var.admin_id,
      var.redcap_data_dictionary_id,
      var.created_at,
      var.updated_at,
      var."position",
      var.section_id,
      var.sub_section_id,
      var.title,
      var.storage_varname,
      var.user_id,
      var.contributor_type,
      var.n_for_timepoints,
      var.notes
    from
      ref_data.datadic_variables var
    where
      (
        (not coalesce(var.disabled, false))
        and ((var.variable_name)::text <> 'participant_id'::text)
        and (nullif((var.storage_varname)::text, ''::text) is not null)
      )
  )
select
  var.id as variable_id,
  stats.variable as variable_name,
  var.label as variable_label,
  stats.results,
  stats.labels,
  stats.mean,
  stats.stddev,
  stats.min,
  stats.med,
  stats.max,
  null::character varying as choices,
  stats.distincts,
  stats.completed,
  stats.total_recs
from
  (
    vars var
    join lateral ref_data.calc_var_stats_for_numeric (var.id) stats (
      variable_id,
      variable,
      results,
      labels,
      min,
      med,
      max,
      mean,
      stddev,
      distincts,
      completed,
      total_recs,
      "chart:"
    ) on ((stats.variable is not null))
  )
where
  (
    (var.table_or_file is not null)
    and (
      (var.variable_type)::text = any ((array['numeric'::character varying, 'calculated'::character varying])::text[])
    )
  )
union
select
  var.id as variable_id,
  stats.variable as variable_name,
  var.label as variable_label,
  stats.results,
  stats.labels,
  null::numeric as mean,
  null::numeric as stddev,
  null::numeric as min,
  null::numeric as med,
  null::numeric as max,
  (to_json(var.multi_valid_choices))::character varying as choices,
  stats.distincts,
  stats.completed,
  stats.total_recs
from
  (
    vars var
    join lateral ref_data.calc_var_stats_for_categorical (var.id) stats (variable_id, variable, results, labels, cat_counts, distincts, completed, total_recs, "chart:") on ((stats.variable is not null))
  )
where
  (
    (var.table_or_file is not null)
    and ((var.variable_type)::text = 'categorical'::text)
  )
union
select
  var.id as variable_id,
  stats.variable as variable_name,
  var.label as variable_label,
  stats.results,
  stats.labels,
  null::numeric as mean,
  null::numeric as stddev,
  null::numeric as min,
  null::numeric as med,
  null::numeric as max,
  null::character varying as choices,
  stats.distincts,
  stats.completed,
  stats.total_recs
from
  (
    vars var
    join lateral ref_data.calc_var_stats_for_boolean (var.id) stats (variable_id, variable, results, labels, cat_counts, distincts, completed, total_recs, "chart:") on ((stats.variable is not null))
  )
where
  (
    (var.table_or_file is not null)
    and ((var.variable_type)::text = 'dichotomous'::text)
  )
with
  no data
;


--
-- Name: datadic_variable_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.datadic_variable_history (
    id bigint not null,
    datadic_variable_id bigint,
    study character varying,
    source_name character varying,
    source_type character varying,
    domain character varying,
    form_name character varying,
    variable_name character varying,
    variable_type character varying,
    presentation_type character varying,
    label character varying,
    label_note character varying,
    annotation character varying,
    is_required boolean,
    valid_type character varying,
    valid_min character varying,
    valid_max character varying,
    multi_valid_choices character varying[],
    is_identifier boolean,
    is_derived_var boolean,
    multi_derived_from_id bigint[],
    doc_url character varying,
    target_type character varying,
    owner_email character varying,
    classification character varying,
    other_classification character varying,
    multi_timepoints character varying[],
    equivalent_to_id bigint,
    storage_type character varying,
    db_or_fs character varying,
    schema_or_path character varying,
    table_or_file character varying,
    disabled boolean,
    admin_id bigint,
    redcap_data_dictionary_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    "position" integer,
    section_id integer,
    sub_section_id integer,
    title character varying,
    storage_varname character varying,
    contributor_type character varying,
    user_id bigint,
    n_for_timepoints jsonb,
    notes character varying
  )
;


--
-- Name: COLUMN datadic_variable_history.study; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.study is 'Study name'
;


--
-- Name: COLUMN datadic_variable_history.source_name; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.source_name is 'Source of variable'
;


--
-- Name: COLUMN datadic_variable_history.source_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.source_type is 'Source type'
;


--
-- Name: COLUMN datadic_variable_history.domain; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.domain is 'Domain'
;


--
-- Name: COLUMN datadic_variable_history.form_name; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.form_name is 'Form name (if the source was a type of form)'
;


--
-- Name: COLUMN datadic_variable_history.variable_name; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.variable_name is 'Variable name (as stored)'
;


--
-- Name: COLUMN datadic_variable_history.variable_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.variable_type is 'Variable type'
;


--
-- Name: COLUMN datadic_variable_history.presentation_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.presentation_type is 'Data type for presentation purposes'
;


--
-- Name: COLUMN datadic_variable_history.label; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.label is 'Primary label or title (if source was a form, the label presented for the field)'
;


--
-- Name: COLUMN datadic_variable_history.label_note; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.label_note is 'Description (if source was a form, a note presented for the field)'
;


--
-- Name: COLUMN datadic_variable_history.annotation; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.annotation is 'Annotations (if source was a form, annotations not presented to the user)'
;


--
-- Name: COLUMN datadic_variable_history.is_required; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.is_required is 'Was required in source'
;


--
-- Name: COLUMN datadic_variable_history.valid_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.valid_type is 'Source data type'
;


--
-- Name: COLUMN datadic_variable_history.valid_min; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.valid_min is 'Minimum value'
;


--
-- Name: COLUMN datadic_variable_history.valid_max; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.valid_max is 'Maximum value'
;


--
-- Name: COLUMN datadic_variable_history.multi_valid_choices; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.multi_valid_choices is 'List of valid choices for categorical variables'
;


--
-- Name: COLUMN datadic_variable_history.is_identifier; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.is_identifier is 'Represents identifiable information'
;


--
-- Name: COLUMN datadic_variable_history.is_derived_var; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.is_derived_var is 'Is a derived variable'
;


--
-- Name: COLUMN datadic_variable_history.multi_derived_from_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.multi_derived_from_id is 'If a derived variable, ids of variables used to calculate it'
;


--
-- Name: COLUMN datadic_variable_history.doc_url; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.doc_url is 'URL to additional documentation'
;


--
-- Name: COLUMN datadic_variable_history.target_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.target_type is 'Type of participant this variable relates to'
;


--
-- Name: COLUMN datadic_variable_history.owner_email; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.owner_email is 'Owner, especially for derived variables'
;


--
-- Name: COLUMN datadic_variable_history.classification; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.classification is 'Category of sensitivity from a privacy perspective'
;


--
-- Name: COLUMN datadic_variable_history.other_classification; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.other_classification is 'Additional information regarding classification'
;


--
-- Name: COLUMN datadic_variable_history.multi_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.multi_timepoints is 'Timepoints this data is collected (in longitudinal studies)'
;


--
-- Name: COLUMN datadic_variable_history.equivalent_to_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.equivalent_to_id is 'Primary variable id this is equivalent to'
;


--
-- Name: COLUMN datadic_variable_history.storage_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.storage_type is 'Type of storage for dataset'
;


--
-- Name: COLUMN datadic_variable_history.db_or_fs; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.db_or_fs is 'Database or Filesystem name'
;


--
-- Name: COLUMN datadic_variable_history.schema_or_path; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.schema_or_path is 'Database schema or Filesystem directory path'
;


--
-- Name: COLUMN datadic_variable_history.table_or_file; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.table_or_file is 'Database table (or view, if derived or equivalent to another variable), or filename in directory'
;


--
-- Name: COLUMN datadic_variable_history.redcap_data_dictionary_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.redcap_data_dictionary_id is 'Reference to REDCap data dictionary representation'
;


--
-- Name: COLUMN datadic_variable_history."position"; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history."position" is 'Relative position (for source forms or other variables where order of collection matters)'
;


--
-- Name: COLUMN datadic_variable_history.section_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.section_id is 'Section this belongs to'
;


--
-- Name: COLUMN datadic_variable_history.sub_section_id; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.sub_section_id is 'Sub-section this belongs to'
;


--
-- Name: COLUMN datadic_variable_history.title; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.title is 'Section caption'
;


--
-- Name: COLUMN datadic_variable_history.storage_varname; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.storage_varname is 'Database field name, or variable name in data file'
;


--
-- Name: COLUMN datadic_variable_history.contributor_type; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.contributor_type is 'Type of contributor this variable was provided by'
;


--
-- Name: COLUMN datadic_variable_history.n_for_timepoints; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.n_for_timepoints is 'For each named timepoint (name:), the population or count of responses (n:), with notes (notes:)'
;


--
-- Name: COLUMN datadic_variable_history.notes; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.datadic_variable_history.notes is 'Notes'
;


--
-- Name: datadic_variable_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.datadic_variable_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: datadic_variable_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.datadic_variable_history_id_seq owned by ref_data.datadic_variable_history.id
;


--
-- Name: datadic_variables_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.datadic_variables_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: datadic_variables_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.datadic_variables_id_seq owned by ref_data.datadic_variables.id
;


--
-- Name: domain_mapping_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.domain_mapping_history (
    id bigint not null,
    domain character varying,
    domain_title character varying,
    tag_select_health_categories character varying[],
    notes character varying,
    hide_from_datadic boolean,
    disabled boolean default false,
    user_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    domain_mapping_id bigint
  )
;


--
-- Name: COLUMN domain_mapping_history.domain; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mapping_history.domain is 'Domain'
;


--
-- Name: COLUMN domain_mapping_history.domain_title; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mapping_history.domain_title is 'Title'
;


--
-- Name: COLUMN domain_mapping_history.tag_select_health_categories; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mapping_history.tag_select_health_categories is 'Health Categories'
;


--
-- Name: COLUMN domain_mapping_history.notes; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mapping_history.notes is 'Notes'
;


--
-- Name: COLUMN domain_mapping_history.hide_from_datadic; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mapping_history.hide_from_datadic is 'Hide from Data Dictionary'
;


--
-- Name: domain_mapping_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.domain_mapping_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: domain_mapping_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.domain_mapping_history_id_seq owned by ref_data.domain_mapping_history.id
;


--
-- Name: domain_mappings; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.domain_mappings (
    id bigint not null,
    domain character varying,
    domain_title character varying,
    tag_select_health_categories character varying[],
    notes character varying,
    hide_from_datadic boolean,
    disabled boolean default false,
    user_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: TABLE domain_mappings; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.domain_mappings is 'Dynamicmodel: Domain Mapping'
;


--
-- Name: COLUMN domain_mappings.domain; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mappings.domain is 'Domain'
;


--
-- Name: COLUMN domain_mappings.domain_title; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mappings.domain_title is 'Title'
;


--
-- Name: COLUMN domain_mappings.tag_select_health_categories; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mappings.tag_select_health_categories is 'Health Categories'
;


--
-- Name: COLUMN domain_mappings.notes; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mappings.notes is 'Notes'
;


--
-- Name: COLUMN domain_mappings.hide_from_datadic; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on column ref_data.domain_mappings.hide_from_datadic is 'Hide from Data Dictionary'
;


--
-- Name: domain_mappings_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.domain_mappings_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: domain_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.domain_mappings_id_seq owned by ref_data.domain_mappings.id
;


--
-- Name: redcap_client_requests; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_client_requests (
    id bigint not null,
    redcap_project_admin_id bigint,
    action character varying,
    name character varying,
    server_url character varying,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    result jsonb
  )
;


--
-- Name: TABLE redcap_client_requests; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.redcap_client_requests is 'Redcap client requests'
;


--
-- Name: redcap_client_requests_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_client_requests_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_client_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_client_requests_id_seq owned by ref_data.redcap_client_requests.id
;


--
-- Name: redcap_data_collection_instrument_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_data_collection_instrument_history (
    id bigint not null,
    redcap_data_collection_instrument_id bigint,
    redcap_project_admin_id bigint,
    name character varying,
    label character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: redcap_data_collection_instrument_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_data_collection_instrument_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_data_collection_instrument_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_data_collection_instrument_history_id_seq owned by ref_data.redcap_data_collection_instrument_history.id
;


--
-- Name: redcap_data_collection_instruments; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_data_collection_instruments (
    id bigint not null,
    name character varying,
    label character varying,
    disabled boolean,
    redcap_project_admin_id bigint,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: redcap_data_collection_instruments_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_data_collection_instruments_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_data_collection_instruments_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_data_collection_instruments_id_seq owned by ref_data.redcap_data_collection_instruments.id
;


--
-- Name: redcap_data_dictionaries; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_data_dictionaries (
    id bigint not null,
    redcap_project_admin_id bigint,
    field_count integer,
    captured_metadata jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: TABLE redcap_data_dictionaries; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.redcap_data_dictionaries is 'Retrieved Redcap Data Dictionaries (metadata)'
;


--
-- Name: redcap_data_dictionaries_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_data_dictionaries_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_data_dictionaries_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_data_dictionaries_id_seq owned by ref_data.redcap_data_dictionaries.id
;


--
-- Name: redcap_data_dictionary_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_data_dictionary_history (
    id bigint not null,
    redcap_data_dictionary_id bigint,
    redcap_project_admin_id bigint,
    field_count integer,
    captured_metadata jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: TABLE redcap_data_dictionary_history; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.redcap_data_dictionary_history is 'Retrieved Redcap Data Dictionaries (metadata) - history'
;


--
-- Name: redcap_data_dictionary_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_data_dictionary_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_data_dictionary_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_data_dictionary_history_id_seq owned by ref_data.redcap_data_dictionary_history.id
;


--
-- Name: redcap_project_admin_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_project_admin_history (
    id bigint not null,
    redcap_project_admin_id bigint,
    name character varying,
    api_key character varying,
    server_url character varying,
    captured_project_info jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    transfer_mode character varying,
    frequency character varying,
    status character varying,
    post_transfer_pipeline character varying[] default '{}'::character varying[],
    notes character varying,
    study character varying,
    dynamic_model_table character varying
  )
;


--
-- Name: TABLE redcap_project_admin_history; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.redcap_project_admin_history is 'Redcap project administration - history'
;


--
-- Name: redcap_project_admin_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_project_admin_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_project_admin_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_project_admin_history_id_seq owned by ref_data.redcap_project_admin_history.id
;


--
-- Name: redcap_project_admins; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_project_admins (
    id bigint not null,
    name character varying,
    api_key character varying,
    server_url character varying,
    captured_project_info jsonb,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null,
    transfer_mode character varying,
    frequency character varying,
    status character varying,
    post_transfer_pipeline character varying[] default '{}'::character varying[],
    notes character varying,
    study character varying,
    dynamic_model_table character varying,
    options character varying
  )
;


--
-- Name: TABLE redcap_project_admins; Type: COMMENT; Schema: ref_data; Owner: -
--
comment on table ref_data.redcap_project_admins is 'Redcap project administration'
;


--
-- Name: redcap_project_admins_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_project_admins_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_project_admins_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_project_admins_id_seq owned by ref_data.redcap_project_admins.id
;


--
-- Name: redcap_project_user_history; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_project_user_history (
    id bigint not null,
    redcap_project_user_id bigint,
    redcap_project_admin_id bigint,
    username character varying,
    email character varying,
    expiration character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: redcap_project_user_history_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_project_user_history_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_project_user_history_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_project_user_history_id_seq owned by ref_data.redcap_project_user_history.id
;


--
-- Name: redcap_project_users; Type: TABLE; Schema: ref_data; Owner: -
--
create table
  ref_data.redcap_project_users (
    id bigint not null,
    redcap_project_admin_id bigint,
    username character varying,
    email character varying,
    expiration character varying,
    disabled boolean,
    admin_id bigint,
    created_at timestamp without time zone not null,
    updated_at timestamp without time zone not null
  )
;


--
-- Name: redcap_project_users_id_seq; Type: SEQUENCE; Schema: ref_data; Owner: -
--
create sequence ref_data.redcap_project_users_id_seq start
with
  1 increment by 1 no minvalue no maxvalue cache 1
;


--
-- Name: redcap_project_users_id_seq; Type: SEQUENCE OWNED BY; Schema: ref_data; Owner: -
--
alter sequence ref_data.redcap_project_users_id_seq owned by ref_data.redcap_project_users.id
;


--
-- Name: accuracy_score_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.accuracy_score_history
alter column id
set default nextval('ml_app.accuracy_score_history_id_seq'::regclass)
;


--
-- Name: accuracy_scores id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.accuracy_scores
alter column id
set default nextval('ml_app.accuracy_scores_id_seq'::regclass)
;


--
-- Name: activity_log_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_history
alter column id
set default nextval('ml_app.activity_log_history_id_seq'::regclass)
;


--
-- Name: activity_log_player_contact_phone_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phone_history
alter column id
set default nextval('ml_app.activity_log_player_contact_phone_history_id_seq'::regclass)
;


--
-- Name: activity_log_player_contact_phones id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phones
alter column id
set default nextval('ml_app.activity_log_player_contact_phones_id_seq'::regclass)
;


--
-- Name: activity_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_logs
alter column id
set default nextval('ml_app.activity_logs_id_seq'::regclass)
;


--
-- Name: address_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.address_history
alter column id
set default nextval('ml_app.address_history_id_seq'::regclass)
;


--
-- Name: addresses id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.addresses
alter column id
set default nextval('ml_app.addresses_id_seq'::regclass)
;


--
-- Name: admin_action_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_action_logs
alter column id
set default nextval('ml_app.admin_action_logs_id_seq'::regclass)
;


--
-- Name: admin_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_history
alter column id
set default nextval('ml_app.admin_history_id_seq'::regclass)
;


--
-- Name: admins id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.admins
alter column id
set default nextval('ml_app.admins_id_seq'::regclass)
;


--
-- Name: app_configuration_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configuration_history
alter column id
set default nextval('ml_app.app_configuration_history_id_seq'::regclass)
;


--
-- Name: app_configurations id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configurations
alter column id
set default nextval('ml_app.app_configurations_id_seq'::regclass)
;


--
-- Name: app_type_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_type_history
alter column id
set default nextval('ml_app.app_type_history_id_seq'::regclass)
;


--
-- Name: app_types id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_types
alter column id
set default nextval('ml_app.app_types_id_seq'::regclass)
;


--
-- Name: college_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.college_history
alter column id
set default nextval('ml_app.college_history_id_seq'::regclass)
;


--
-- Name: colleges id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.colleges
alter column id
set default nextval('ml_app.colleges_id_seq'::regclass)
;


--
-- Name: config_libraries id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_libraries
alter column id
set default nextval('ml_app.config_libraries_id_seq'::regclass)
;


--
-- Name: config_library_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_library_history
alter column id
set default nextval('ml_app.config_library_history_id_seq'::regclass)
;


--
-- Name: delayed_jobs id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.delayed_jobs
alter column id
set default nextval('ml_app.delayed_jobs_id_seq'::regclass)
;


--
-- Name: dynamic_model_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.dynamic_model_history
alter column id
set default nextval('ml_app.dynamic_model_history_id_seq'::regclass)
;


--
-- Name: dynamic_models id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.dynamic_models
alter column id
set default nextval('ml_app.dynamic_models_id_seq'::regclass)
;


--
-- Name: exception_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.exception_logs
alter column id
set default nextval('ml_app.exception_logs_id_seq'::regclass)
;


--
-- Name: external_identifier_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifier_history
alter column id
set default nextval('ml_app.external_identifier_history_id_seq'::regclass)
;


--
-- Name: external_identifiers id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifiers
alter column id
set default nextval('ml_app.external_identifiers_id_seq'::regclass)
;


--
-- Name: external_link_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_link_history
alter column id
set default nextval('ml_app.external_link_history_id_seq'::regclass)
;


--
-- Name: external_links id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_links
alter column id
set default nextval('ml_app.external_links_id_seq'::regclass)
;


--
-- Name: general_selection_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.general_selection_history
alter column id
set default nextval('ml_app.general_selection_history_id_seq'::regclass)
;


--
-- Name: general_selections id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.general_selections
alter column id
set default nextval('ml_app.general_selections_id_seq'::regclass)
;


--
-- Name: imports id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.imports
alter column id
set default nextval('ml_app.imports_id_seq'::regclass)
;


--
-- Name: imports_model_generators id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.imports_model_generators
alter column id
set default nextval('ml_app.imports_model_generators_id_seq'::regclass)
;


--
-- Name: item_flag_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_history
alter column id
set default nextval('ml_app.item_flag_history_id_seq'::regclass)
;


--
-- Name: item_flag_name_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_name_history
alter column id
set default nextval('ml_app.item_flag_name_history_id_seq'::regclass)
;


--
-- Name: item_flag_names id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_names
alter column id
set default nextval('ml_app.item_flag_names_id_seq'::regclass)
;


--
-- Name: item_flags id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flags
alter column id
set default nextval('ml_app.item_flags_id_seq'::regclass)
;


--
-- Name: manage_users id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.manage_users
alter column id
set default nextval('ml_app.manage_users_id_seq'::regclass)
;


--
-- Name: masters id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.masters
alter column id
set default nextval('ml_app.masters_id_seq'::regclass)
;


--
-- Name: message_notifications id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_notifications
alter column id
set default nextval('ml_app.message_notifications_id_seq'::regclass)
;


--
-- Name: message_template_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_template_history
alter column id
set default nextval('ml_app.message_template_history_id_seq'::regclass)
;


--
-- Name: message_templates id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_templates
alter column id
set default nextval('ml_app.message_templates_id_seq'::regclass)
;


--
-- Name: model_references id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.model_references
alter column id
set default nextval('ml_app.model_references_id_seq'::regclass)
;


--
-- Name: nfs_store_archived_file_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_file_history
alter column id
set default nextval('ml_app.nfs_store_archived_file_history_id_seq'::regclass)
;


--
-- Name: nfs_store_archived_files id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_files
alter column id
set default nextval('ml_app.nfs_store_archived_files_id_seq'::regclass)
;


--
-- Name: nfs_store_container_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_container_history
alter column id
set default nextval('ml_app.nfs_store_container_history_id_seq'::regclass)
;


--
-- Name: nfs_store_containers id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
alter column id
set default nextval('ml_app.nfs_store_containers_id_seq'::regclass)
;


--
-- Name: nfs_store_downloads id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_downloads
alter column id
set default nextval('ml_app.nfs_store_downloads_id_seq'::regclass)
;


--
-- Name: nfs_store_filter_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filter_history
alter column id
set default nextval('ml_app.nfs_store_filter_history_id_seq'::regclass)
;


--
-- Name: nfs_store_filters id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filters
alter column id
set default nextval('ml_app.nfs_store_filters_id_seq'::regclass)
;


--
-- Name: nfs_store_imports id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_imports
alter column id
set default nextval('ml_app.nfs_store_imports_id_seq'::regclass)
;


--
-- Name: nfs_store_move_actions id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_move_actions
alter column id
set default nextval('ml_app.nfs_store_move_actions_id_seq'::regclass)
;


--
-- Name: nfs_store_stored_file_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_file_history
alter column id
set default nextval('ml_app.nfs_store_stored_file_history_id_seq'::regclass)
;


--
-- Name: nfs_store_stored_files id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_files
alter column id
set default nextval('ml_app.nfs_store_stored_files_id_seq'::regclass)
;


--
-- Name: nfs_store_trash_actions id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_trash_actions
alter column id
set default nextval('ml_app.nfs_store_trash_actions_id_seq'::regclass)
;


--
-- Name: nfs_store_uploads id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_uploads
alter column id
set default nextval('ml_app.nfs_store_uploads_id_seq'::regclass)
;


--
-- Name: nfs_store_user_file_actions id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_user_file_actions
alter column id
set default nextval('ml_app.nfs_store_user_file_actions_id_seq'::regclass)
;


--
-- Name: page_layout_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layout_history
alter column id
set default nextval('ml_app.page_layout_history_id_seq'::regclass)
;


--
-- Name: page_layouts id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layouts
alter column id
set default nextval('ml_app.page_layouts_id_seq'::regclass)
;


--
-- Name: player_contact_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contact_history
alter column id
set default nextval('ml_app.player_contact_history_id_seq'::regclass)
;


--
-- Name: player_contacts id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contacts
alter column id
set default nextval('ml_app.player_contacts_id_seq'::regclass)
;


--
-- Name: player_info_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_info_history
alter column id
set default nextval('ml_app.player_info_history_id_seq'::regclass)
;


--
-- Name: player_infos id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_infos
alter column id
set default nextval('ml_app.player_infos_id_seq'::regclass)
;


--
-- Name: pro_infos id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.pro_infos
alter column id
set default nextval('ml_app.pro_infos_id_seq'::regclass)
;


--
-- Name: protocol_event_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_event_history
alter column id
set default nextval('ml_app.protocol_event_history_id_seq'::regclass)
;


--
-- Name: protocol_events id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_events
alter column id
set default nextval('ml_app.protocol_events_id_seq'::regclass)
;


--
-- Name: protocol_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_history
alter column id
set default nextval('ml_app.protocol_history_id_seq'::regclass)
;


--
-- Name: protocols id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocols
alter column id
set default nextval('ml_app.protocols_id_seq'::regclass)
;


--
-- Name: rc_cis id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.rc_cis
alter column id
set default nextval('ml_app.rc_cis_id_seq'::regclass)
;


--
-- Name: rc_stage_cif_copy id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.rc_stage_cif_copy
alter column id
set default nextval('ml_app.rc_stage_cif_copy_id_seq'::regclass)
;


--
-- Name: report_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.report_history
alter column id
set default nextval('ml_app.report_history_id_seq'::regclass)
;


--
-- Name: reports id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.reports
alter column id
set default nextval('ml_app.reports_id_seq'::regclass)
;


--
-- Name: role_description_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_description_history
alter column id
set default nextval('ml_app.role_description_history_id_seq'::regclass)
;


--
-- Name: role_descriptions id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_descriptions
alter column id
set default nextval('ml_app.role_descriptions_id_seq'::regclass)
;


--
-- Name: sage_assignments id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.sage_assignments
alter column id
set default nextval('ml_app.sage_assignments_id_seq'::regclass)
;


--
-- Name: scantron_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantron_history
alter column id
set default nextval('ml_app.scantron_history_id_seq'::regclass)
;


--
-- Name: scantrons id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantrons
alter column id
set default nextval('ml_app.scantrons_id_seq'::regclass)
;


--
-- Name: sessions id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.sessions
alter column id
set default nextval('ml_app.sessions_id_seq'::regclass)
;


--
-- Name: sub_process_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_process_history
alter column id
set default nextval('ml_app.sub_process_history_id_seq'::regclass)
;


--
-- Name: sub_processes id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_processes
alter column id
set default nextval('ml_app.sub_processes_id_seq'::regclass)
;


--
-- Name: tracker_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
alter column id
set default nextval('ml_app.tracker_history_id_seq'::regclass)
;


--
-- Name: trackers id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
alter column id
set default nextval('ml_app.trackers_id_seq'::regclass)
;


--
-- Name: user_access_control_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_control_history
alter column id
set default nextval('ml_app.user_access_control_history_id_seq'::regclass)
;


--
-- Name: user_access_controls id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_controls
alter column id
set default nextval('ml_app.user_access_controls_id_seq'::regclass)
;


--
-- Name: user_action_logs id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_action_logs
alter column id
set default nextval('ml_app.user_action_logs_id_seq'::regclass)
;


--
-- Name: user_authorization_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_authorization_history
alter column id
set default nextval('ml_app.user_authorization_history_id_seq'::regclass)
;


--
-- Name: user_authorizations id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_authorizations
alter column id
set default nextval('ml_app.user_authorizations_id_seq'::regclass)
;


--
-- Name: user_description_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_description_history
alter column id
set default nextval('ml_app.user_description_history_id_seq'::regclass)
;


--
-- Name: user_descriptions id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_descriptions
alter column id
set default nextval('ml_app.user_descriptions_id_seq'::regclass)
;


--
-- Name: user_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_history
alter column id
set default nextval('ml_app.user_history_id_seq'::regclass)
;


--
-- Name: user_preferences id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_preferences
alter column id
set default nextval('ml_app.user_preferences_id_seq'::regclass)
;


--
-- Name: user_role_history id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_role_history
alter column id
set default nextval('ml_app.user_role_history_id_seq'::regclass)
;


--
-- Name: user_roles id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_roles
alter column id
set default nextval('ml_app.user_roles_id_seq'::regclass)
;


--
-- Name: users id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.users
alter column id
set default nextval('ml_app.users_id_seq'::regclass)
;


--
-- Name: users_contact_infos id; Type: DEFAULT; Schema: ml_app; Owner: -
--
alter table only ml_app.users_contact_infos
alter column id
set default nextval('ml_app.users_contact_infos_id_seq'::regclass)
;


--
-- Name: datadic_choice_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choice_history
alter column id
set default nextval('ref_data.datadic_choice_history_id_seq'::regclass)
;


--
-- Name: datadic_choices id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choices
alter column id
set default nextval('ref_data.datadic_choices_id_seq'::regclass)
;


--
-- Name: datadic_variable_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variable_history
alter column id
set default nextval('ref_data.datadic_variable_history_id_seq'::regclass)
;


--
-- Name: datadic_variables id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variables
alter column id
set default nextval('ref_data.datadic_variables_id_seq'::regclass)
;


--
-- Name: domain_mapping_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.domain_mapping_history
alter column id
set default nextval('ref_data.domain_mapping_history_id_seq'::regclass)
;


--
-- Name: domain_mappings id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.domain_mappings
alter column id
set default nextval('ref_data.domain_mappings_id_seq'::regclass)
;


--
-- Name: redcap_client_requests id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_client_requests
alter column id
set default nextval('ref_data.redcap_client_requests_id_seq'::regclass)
;


--
-- Name: redcap_data_collection_instrument_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instrument_history
alter column id
set default nextval('ref_data.redcap_data_collection_instrument_history_id_seq'::regclass)
;


--
-- Name: redcap_data_collection_instruments id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instruments
alter column id
set default nextval('ref_data.redcap_data_collection_instruments_id_seq'::regclass)
;


--
-- Name: redcap_data_dictionaries id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionaries
alter column id
set default nextval('ref_data.redcap_data_dictionaries_id_seq'::regclass)
;


--
-- Name: redcap_data_dictionary_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionary_history
alter column id
set default nextval('ref_data.redcap_data_dictionary_history_id_seq'::regclass)
;


--
-- Name: redcap_project_admin_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_admin_history
alter column id
set default nextval('ref_data.redcap_project_admin_history_id_seq'::regclass)
;


--
-- Name: redcap_project_admins id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_admins
alter column id
set default nextval('ref_data.redcap_project_admins_id_seq'::regclass)
;


--
-- Name: redcap_project_user_history id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_user_history
alter column id
set default nextval('ref_data.redcap_project_user_history_id_seq'::regclass)
;


--
-- Name: redcap_project_users id; Type: DEFAULT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_users
alter column id
set default nextval('ref_data.redcap_project_users_id_seq'::regclass)
;


--
-- Name: accuracy_score_history accuracy_score_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.accuracy_score_history
add constraint accuracy_score_history_pkey primary key (id)
;


--
-- Name: accuracy_scores accuracy_scores_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.accuracy_scores
add constraint accuracy_scores_pkey primary key (id)
;


--
-- Name: activity_log_history activity_log_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_history
add constraint activity_log_history_pkey primary key (id)
;


--
-- Name: activity_log_player_contact_phone_history activity_log_player_contact_phone_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phone_history
add constraint activity_log_player_contact_phone_history_pkey primary key (id)
;


--
-- Name: activity_log_player_contact_phones activity_log_player_contact_phones_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phones
add constraint activity_log_player_contact_phones_pkey primary key (id)
;


--
-- Name: activity_logs activity_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_logs
add constraint activity_logs_pkey primary key (id)
;


--
-- Name: address_history address_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.address_history
add constraint address_history_pkey primary key (id)
;


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.addresses
add constraint addresses_pkey primary key (id)
;


--
-- Name: admin_action_logs admin_action_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_action_logs
add constraint admin_action_logs_pkey primary key (id)
;


--
-- Name: admin_history admin_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_history
add constraint admin_history_pkey primary key (id)
;


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admins
add constraint admins_pkey primary key (id)
;


--
-- Name: app_configuration_history app_configuration_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configuration_history
add constraint app_configuration_history_pkey primary key (id)
;


--
-- Name: app_configurations app_configurations_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configurations
add constraint app_configurations_pkey primary key (id)
;


--
-- Name: app_type_history app_type_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_type_history
add constraint app_type_history_pkey primary key (id)
;


--
-- Name: app_types app_types_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_types
add constraint app_types_pkey primary key (id)
;


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.ar_internal_metadata
add constraint ar_internal_metadata_pkey primary key (key)
;


--
-- Name: college_history college_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.college_history
add constraint college_history_pkey primary key (id)
;


--
-- Name: colleges colleges_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.colleges
add constraint colleges_pkey primary key (id)
;


--
-- Name: config_libraries config_libraries_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_libraries
add constraint config_libraries_pkey primary key (id)
;


--
-- Name: config_library_history config_library_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_library_history
add constraint config_library_history_pkey primary key (id)
;


--
-- Name: delayed_jobs delayed_jobs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.delayed_jobs
add constraint delayed_jobs_pkey primary key (id)
;


--
-- Name: dynamic_model_history dynamic_model_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.dynamic_model_history
add constraint dynamic_model_history_pkey primary key (id)
;


--
-- Name: dynamic_models dynamic_models_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.dynamic_models
add constraint dynamic_models_pkey primary key (id)
;


--
-- Name: exception_logs exception_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.exception_logs
add constraint exception_logs_pkey primary key (id)
;


--
-- Name: external_identifier_history external_identifier_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifier_history
add constraint external_identifier_history_pkey primary key (id)
;


--
-- Name: external_identifiers external_identifiers_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifiers
add constraint external_identifiers_pkey primary key (id)
;


--
-- Name: external_link_history external_link_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_link_history
add constraint external_link_history_pkey primary key (id)
;


--
-- Name: external_links external_links_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_links
add constraint external_links_pkey primary key (id)
;


--
-- Name: general_selection_history general_selection_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.general_selection_history
add constraint general_selection_history_pkey primary key (id)
;


--
-- Name: general_selections general_selections_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.general_selections
add constraint general_selections_pkey primary key (id)
;


--
-- Name: imports_model_generators imports_model_generators_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.imports_model_generators
add constraint imports_model_generators_pkey primary key (id)
;


--
-- Name: imports imports_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.imports
add constraint imports_pkey primary key (id)
;


--
-- Name: item_flag_history item_flag_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_history
add constraint item_flag_history_pkey primary key (id)
;


--
-- Name: item_flag_name_history item_flag_name_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_name_history
add constraint item_flag_name_history_pkey primary key (id)
;


--
-- Name: item_flag_names item_flag_names_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_names
add constraint item_flag_names_pkey primary key (id)
;


--
-- Name: item_flags item_flags_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flags
add constraint item_flags_pkey primary key (id)
;


--
-- Name: manage_users manage_users_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.manage_users
add constraint manage_users_pkey primary key (id)
;


--
-- Name: masters masters_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.masters
add constraint masters_pkey primary key (id)
;


--
-- Name: message_notifications message_notifications_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_notifications
add constraint message_notifications_pkey primary key (id)
;


--
-- Name: message_template_history message_template_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_template_history
add constraint message_template_history_pkey primary key (id)
;


--
-- Name: message_templates message_templates_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_templates
add constraint message_templates_pkey primary key (id)
;


--
-- Name: model_references model_references_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.model_references
add constraint model_references_pkey primary key (id)
;


--
-- Name: nfs_store_archived_file_history nfs_store_archived_file_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_file_history
add constraint nfs_store_archived_file_history_pkey primary key (id)
;


--
-- Name: nfs_store_archived_files nfs_store_archived_files_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_files
add constraint nfs_store_archived_files_pkey primary key (id)
;


--
-- Name: nfs_store_container_history nfs_store_container_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_container_history
add constraint nfs_store_container_history_pkey primary key (id)
;


--
-- Name: nfs_store_containers nfs_store_containers_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
add constraint nfs_store_containers_pkey primary key (id)
;


--
-- Name: nfs_store_downloads nfs_store_downloads_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_downloads
add constraint nfs_store_downloads_pkey primary key (id)
;


--
-- Name: nfs_store_filter_history nfs_store_filter_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filter_history
add constraint nfs_store_filter_history_pkey primary key (id)
;


--
-- Name: nfs_store_filters nfs_store_filters_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filters
add constraint nfs_store_filters_pkey primary key (id)
;


--
-- Name: nfs_store_imports nfs_store_imports_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_imports
add constraint nfs_store_imports_pkey primary key (id)
;


--
-- Name: nfs_store_move_actions nfs_store_move_actions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_move_actions
add constraint nfs_store_move_actions_pkey primary key (id)
;


--
-- Name: nfs_store_stored_file_history nfs_store_stored_file_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_file_history
add constraint nfs_store_stored_file_history_pkey primary key (id)
;


--
-- Name: nfs_store_stored_files nfs_store_stored_files_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_files
add constraint nfs_store_stored_files_pkey primary key (id)
;


--
-- Name: nfs_store_trash_actions nfs_store_trash_actions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_trash_actions
add constraint nfs_store_trash_actions_pkey primary key (id)
;


--
-- Name: nfs_store_uploads nfs_store_uploads_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_uploads
add constraint nfs_store_uploads_pkey primary key (id)
;


--
-- Name: nfs_store_user_file_actions nfs_store_user_file_actions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_user_file_actions
add constraint nfs_store_user_file_actions_pkey primary key (id)
;


--
-- Name: page_layout_history page_layout_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layout_history
add constraint page_layout_history_pkey primary key (id)
;


--
-- Name: page_layouts page_layouts_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layouts
add constraint page_layouts_pkey primary key (id)
;


--
-- Name: player_contact_history player_contact_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contact_history
add constraint player_contact_history_pkey primary key (id)
;


--
-- Name: player_contacts player_contacts_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contacts
add constraint player_contacts_pkey primary key (id)
;


--
-- Name: player_info_history player_info_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_info_history
add constraint player_info_history_pkey primary key (id)
;


--
-- Name: player_infos player_infos_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_infos
add constraint player_infos_pkey primary key (id)
;


--
-- Name: pro_infos pro_infos_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.pro_infos
add constraint pro_infos_pkey primary key (id)
;


--
-- Name: protocol_event_history protocol_event_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_event_history
add constraint protocol_event_history_pkey primary key (id)
;


--
-- Name: protocol_events protocol_events_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_events
add constraint protocol_events_pkey primary key (id)
;


--
-- Name: protocol_history protocol_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_history
add constraint protocol_history_pkey primary key (id)
;


--
-- Name: protocols protocols_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocols
add constraint protocols_pkey primary key (id)
;


--
-- Name: rc_cis rc_cis_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.rc_cis
add constraint rc_cis_pkey primary key (id)
;


--
-- Name: rc_stage_cif_copy rc_stage_cif_copy_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.rc_stage_cif_copy
add constraint rc_stage_cif_copy_pkey primary key (id)
;


--
-- Name: report_history report_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.report_history
add constraint report_history_pkey primary key (id)
;


--
-- Name: reports reports_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.reports
add constraint reports_pkey primary key (id)
;


--
-- Name: role_description_history role_description_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_description_history
add constraint role_description_history_pkey primary key (id)
;


--
-- Name: role_descriptions role_descriptions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_descriptions
add constraint role_descriptions_pkey primary key (id)
;


--
-- Name: sage_assignments sage_assignments_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sage_assignments
add constraint sage_assignments_pkey primary key (id)
;


--
-- Name: scantron_history scantron_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantron_history
add constraint scantron_history_pkey primary key (id)
;


--
-- Name: scantrons scantrons_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantrons
add constraint scantrons_pkey primary key (id)
;


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sessions
add constraint sessions_pkey primary key (id)
;


--
-- Name: sub_process_history sub_process_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_process_history
add constraint sub_process_history_pkey primary key (id)
;


--
-- Name: sub_processes sub_processes_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_processes
add constraint sub_processes_pkey primary key (id)
;


--
-- Name: tracker_history tracker_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint tracker_history_pkey primary key (id)
;


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint trackers_pkey primary key (id)
;


--
-- Name: trackers unique_master_protocol; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint unique_master_protocol unique (master_id, protocol_id)
;


--
-- Name: trackers unique_master_protocol_id; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint unique_master_protocol_id unique (master_id, protocol_id, id)
;


--
-- Name: sub_processes unique_protocol_and_id; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_processes
add constraint unique_protocol_and_id unique (protocol_id, id)
;


--
-- Name: protocol_events unique_sub_process_and_id; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_events
add constraint unique_sub_process_and_id unique (sub_process_id, id)
;


--
-- Name: user_access_control_history user_access_control_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_control_history
add constraint user_access_control_history_pkey primary key (id)
;


--
-- Name: user_access_controls user_access_controls_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_controls
add constraint user_access_controls_pkey primary key (id)
;


--
-- Name: user_action_logs user_action_logs_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_action_logs
add constraint user_action_logs_pkey primary key (id)
;


--
-- Name: user_authorization_history user_authorization_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_authorization_history
add constraint user_authorization_history_pkey primary key (id)
;


--
-- Name: user_authorizations user_authorizations_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_authorizations
add constraint user_authorizations_pkey primary key (id)
;


--
-- Name: user_description_history user_description_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_description_history
add constraint user_description_history_pkey primary key (id)
;


--
-- Name: user_descriptions user_descriptions_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_descriptions
add constraint user_descriptions_pkey primary key (id)
;


--
-- Name: user_history user_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_history
add constraint user_history_pkey primary key (id)
;


--
-- Name: user_preferences user_preferences_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_preferences
add constraint user_preferences_pkey primary key (id)
;


--
-- Name: user_role_history user_role_history_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_role_history
add constraint user_role_history_pkey primary key (id)
;


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_roles
add constraint user_roles_pkey primary key (id)
;


--
-- Name: users_contact_infos users_contact_infos_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.users_contact_infos
add constraint users_contact_infos_pkey primary key (id)
;


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.users
add constraint users_pkey primary key (id)
;


--
-- Name: datadic_choice_history datadic_choice_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choice_history
add constraint datadic_choice_history_pkey primary key (id)
;


--
-- Name: datadic_choices datadic_choices_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choices
add constraint datadic_choices_pkey primary key (id)
;


--
-- Name: datadic_variable_history datadic_variable_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variable_history
add constraint datadic_variable_history_pkey primary key (id)
;


--
-- Name: datadic_variables datadic_variables_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variables
add constraint datadic_variables_pkey primary key (id)
;


--
-- Name: domain_mapping_history domain_mapping_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.domain_mapping_history
add constraint domain_mapping_history_pkey primary key (id)
;


--
-- Name: domain_mappings domain_mappings_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.domain_mappings
add constraint domain_mappings_pkey primary key (id)
;


--
-- Name: redcap_client_requests redcap_client_requests_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_client_requests
add constraint redcap_client_requests_pkey primary key (id)
;


--
-- Name: redcap_data_collection_instrument_history redcap_data_collection_instrument_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instrument_history
add constraint redcap_data_collection_instrument_history_pkey primary key (id)
;


--
-- Name: redcap_data_collection_instruments redcap_data_collection_instruments_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instruments
add constraint redcap_data_collection_instruments_pkey primary key (id)
;


--
-- Name: redcap_data_dictionaries redcap_data_dictionaries_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionaries
add constraint redcap_data_dictionaries_pkey primary key (id)
;


--
-- Name: redcap_data_dictionary_history redcap_data_dictionary_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionary_history
add constraint redcap_data_dictionary_history_pkey primary key (id)
;


--
-- Name: redcap_project_admin_history redcap_project_admin_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_admin_history
add constraint redcap_project_admin_history_pkey primary key (id)
;


--
-- Name: redcap_project_admins redcap_project_admins_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_admins
add constraint redcap_project_admins_pkey primary key (id)
;


--
-- Name: redcap_project_user_history redcap_project_user_history_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_user_history
add constraint redcap_project_user_history_pkey primary key (id)
;


--
-- Name: redcap_project_users redcap_project_users_pkey; Type: CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_users
add constraint redcap_project_users_pkey primary key (id)
;


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: ml_app; Owner: -
--
create index delayed_jobs_priority on ml_app.delayed_jobs using btree (priority, run_at)
;


--
-- Name: idx_h_on_role_descriptions_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index idx_h_on_role_descriptions_id on ml_app.role_description_history using btree (role_description_id)
;


--
-- Name: idx_h_on_user_descriptions_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index idx_h_on_user_descriptions_id on ml_app.user_description_history using btree (user_description_id)
;


--
-- Name: index_accuracy_score_history_on_accuracy_score_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_accuracy_score_history_on_accuracy_score_id on ml_app.accuracy_score_history using btree (accuracy_score_id)
;


--
-- Name: index_accuracy_scores_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_accuracy_scores_on_admin_id on ml_app.accuracy_scores using btree (admin_id)
;


--
-- Name: index_activity_log_history_on_activity_log_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_history_on_activity_log_id on ml_app.activity_log_history using btree (activity_log_id)
;


--
-- Name: index_activity_log_player_contact_phone_history_on_activity_log; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phone_history_on_activity_log on ml_app.activity_log_player_contact_phone_history using btree (activity_log_player_contact_phone_id)
;


--
-- Name: index_activity_log_player_contact_phone_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phone_history_on_master_id on ml_app.activity_log_player_contact_phone_history using btree (master_id)
;


--
-- Name: index_activity_log_player_contact_phone_history_on_player_conta; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phone_history_on_player_conta on ml_app.activity_log_player_contact_phone_history using btree (player_contact_id)
;


--
-- Name: index_activity_log_player_contact_phone_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phone_history_on_user_id on ml_app.activity_log_player_contact_phone_history using btree (user_id)
;


--
-- Name: index_activity_log_player_contact_phones_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phones_on_master_id on ml_app.activity_log_player_contact_phones using btree (master_id)
;


--
-- Name: index_activity_log_player_contact_phones_on_player_contact_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phones_on_player_contact_id on ml_app.activity_log_player_contact_phones using btree (player_contact_id)
;


--
-- Name: index_activity_log_player_contact_phones_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phones_on_protocol_id on ml_app.activity_log_player_contact_phones using btree (protocol_id)
;


--
-- Name: index_activity_log_player_contact_phones_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_activity_log_player_contact_phones_on_user_id on ml_app.activity_log_player_contact_phones using btree (user_id)
;


--
-- Name: index_address_history_on_address_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_address_history_on_address_id on ml_app.address_history using btree (address_id)
;


--
-- Name: index_address_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_address_history_on_master_id on ml_app.address_history using btree (master_id)
;


--
-- Name: index_address_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_address_history_on_user_id on ml_app.address_history using btree (user_id)
;


--
-- Name: index_addresses_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_addresses_on_master_id on ml_app.addresses using btree (master_id)
;


--
-- Name: index_addresses_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_addresses_on_user_id on ml_app.addresses using btree (user_id)
;


--
-- Name: index_admin_action_logs_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_admin_action_logs_on_admin_id on ml_app.admin_action_logs using btree (admin_id)
;


--
-- Name: index_admin_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_admin_history_on_admin_id on ml_app.admin_history using btree (admin_id)
;


--
-- Name: index_admin_history_on_upd_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_admin_history_on_upd_admin_id on ml_app.admin_history using btree (updated_by_admin_id)
;


--
-- Name: index_admins_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_admins_on_admin_id on ml_app.admins using btree (admin_id)
;


--
-- Name: index_app_configuration_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_configuration_history_on_admin_id on ml_app.app_configuration_history using btree (admin_id)
;


--
-- Name: index_app_configuration_history_on_app_configuration_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_configuration_history_on_app_configuration_id on ml_app.app_configuration_history using btree (app_configuration_id)
;


--
-- Name: index_app_configurations_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_configurations_on_admin_id on ml_app.app_configurations using btree (admin_id)
;


--
-- Name: index_app_configurations_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_configurations_on_app_type_id on ml_app.app_configurations using btree (app_type_id)
;


--
-- Name: index_app_configurations_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_configurations_on_user_id on ml_app.app_configurations using btree (user_id)
;


--
-- Name: index_app_type_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_type_history_on_admin_id on ml_app.app_type_history using btree (admin_id)
;


--
-- Name: index_app_type_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_type_history_on_app_type_id on ml_app.app_type_history using btree (app_type_id)
;


--
-- Name: index_app_types_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_app_types_on_admin_id on ml_app.app_types using btree (admin_id)
;


--
-- Name: index_college_history_on_college_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_college_history_on_college_id on ml_app.college_history using btree (college_id)
;


--
-- Name: index_colleges_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_colleges_on_admin_id on ml_app.colleges using btree (admin_id)
;


--
-- Name: index_colleges_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_colleges_on_user_id on ml_app.colleges using btree (user_id)
;


--
-- Name: index_config_libraries_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_config_libraries_on_admin_id on ml_app.config_libraries using btree (admin_id)
;


--
-- Name: index_config_library_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_config_library_history_on_admin_id on ml_app.config_library_history using btree (admin_id)
;


--
-- Name: index_config_library_history_on_config_library_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_config_library_history_on_config_library_id on ml_app.config_library_history using btree (config_library_id)
;


--
-- Name: index_dynamic_model_history_on_dynamic_model_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_dynamic_model_history_on_dynamic_model_id on ml_app.dynamic_model_history using btree (dynamic_model_id)
;


--
-- Name: index_dynamic_models_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_dynamic_models_on_admin_id on ml_app.dynamic_models using btree (admin_id)
;


--
-- Name: index_exception_logs_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_exception_logs_on_admin_id on ml_app.exception_logs using btree (admin_id)
;


--
-- Name: index_exception_logs_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_exception_logs_on_user_id on ml_app.exception_logs using btree (user_id)
;


--
-- Name: index_external_identifier_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_external_identifier_history_on_admin_id on ml_app.external_identifier_history using btree (admin_id)
;


--
-- Name: index_external_identifier_history_on_external_identifier_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_external_identifier_history_on_external_identifier_id on ml_app.external_identifier_history using btree (external_identifier_id)
;


--
-- Name: index_external_identifiers_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_external_identifiers_on_admin_id on ml_app.external_identifiers using btree (admin_id)
;


--
-- Name: index_external_link_history_on_external_link_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_external_link_history_on_external_link_id on ml_app.external_link_history using btree (external_link_id)
;


--
-- Name: index_external_links_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_external_links_on_admin_id on ml_app.external_links using btree (admin_id)
;


--
-- Name: index_general_selection_history_on_general_selection_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_general_selection_history_on_general_selection_id on ml_app.general_selection_history using btree (general_selection_id)
;


--
-- Name: index_general_selections_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_general_selections_on_admin_id on ml_app.general_selections using btree (admin_id)
;


--
-- Name: index_imports_model_generators_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_imports_model_generators_on_admin_id on ml_app.imports_model_generators using btree (admin_id)
;


--
-- Name: index_imports_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_imports_on_user_id on ml_app.imports using btree (user_id)
;


--
-- Name: index_item_flag_history_on_item_flag_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_item_flag_history_on_item_flag_id on ml_app.item_flag_history using btree (item_flag_id)
;


--
-- Name: index_item_flag_name_history_on_item_flag_name_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_item_flag_name_history_on_item_flag_name_id on ml_app.item_flag_name_history using btree (item_flag_name_id)
;


--
-- Name: index_item_flag_names_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_item_flag_names_on_admin_id on ml_app.item_flag_names using btree (admin_id)
;


--
-- Name: index_item_flags_on_item_flag_name_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_item_flags_on_item_flag_name_id on ml_app.item_flags using btree (item_flag_name_id)
;


--
-- Name: index_item_flags_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_item_flags_on_user_id on ml_app.item_flags using btree (user_id)
;


--
-- Name: index_masters_on_created_by_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_masters_on_created_by_user_id on ml_app.masters using btree (created_by_user_id)
;


--
-- Name: index_masters_on_msid; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_masters_on_msid on ml_app.masters using btree (msid)
;


--
-- Name: index_masters_on_pro_info_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_masters_on_pro_info_id on ml_app.masters using btree (pro_info_id)
;


--
-- Name: index_masters_on_proid; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_masters_on_proid on ml_app.masters using btree (pro_id)
;


--
-- Name: index_masters_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_masters_on_user_id on ml_app.masters using btree (user_id)
;


--
-- Name: index_message_notifications_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_notifications_on_app_type_id on ml_app.message_notifications using btree (app_type_id)
;


--
-- Name: index_message_notifications_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_notifications_on_master_id on ml_app.message_notifications using btree (master_id)
;


--
-- Name: index_message_notifications_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_notifications_on_user_id on ml_app.message_notifications using btree (user_id)
;


--
-- Name: index_message_notifications_status; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_notifications_status on ml_app.message_notifications using btree (status)
;


--
-- Name: index_message_template_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_template_history_on_admin_id on ml_app.message_template_history using btree (admin_id)
;


--
-- Name: index_message_template_history_on_message_template_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_template_history_on_message_template_id on ml_app.message_template_history using btree (message_template_id)
;


--
-- Name: index_message_templates_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_message_templates_on_admin_id on ml_app.message_templates using btree (admin_id)
;


--
-- Name: index_model_references_on_from_record_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_model_references_on_from_record_master_id on ml_app.model_references using btree (from_record_master_id)
;


--
-- Name: index_model_references_on_from_record_type_and_from_record_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_model_references_on_from_record_type_and_from_record_id on ml_app.model_references using btree (from_record_type, from_record_id)
;


--
-- Name: index_model_references_on_to_record_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_model_references_on_to_record_master_id on ml_app.model_references using btree (to_record_master_id)
;


--
-- Name: index_model_references_on_to_record_type_and_to_record_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_model_references_on_to_record_type_and_to_record_id on ml_app.model_references using btree (to_record_type, to_record_id)
;


--
-- Name: index_model_references_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_model_references_on_user_id on ml_app.model_references using btree (user_id)
;


--
-- Name: index_nfs_store_archived_file_history_on_nfs_store_archived_fil; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_archived_file_history_on_nfs_store_archived_fil on ml_app.nfs_store_archived_file_history using btree (nfs_store_archived_file_id)
;


--
-- Name: index_nfs_store_archived_file_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_archived_file_history_on_user_id on ml_app.nfs_store_archived_file_history using btree (user_id)
;


--
-- Name: index_nfs_store_archived_files_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_archived_files_on_nfs_store_container_id on ml_app.nfs_store_archived_files using btree (nfs_store_container_id)
;


--
-- Name: index_nfs_store_archived_files_on_nfs_store_stored_file_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_archived_files_on_nfs_store_stored_file_id on ml_app.nfs_store_archived_files using btree (nfs_store_stored_file_id)
;


--
-- Name: index_nfs_store_container_history_on_created_by_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_container_history_on_created_by_user_id on ml_app.nfs_store_container_history using btree (created_by_user_id)
;


--
-- Name: index_nfs_store_container_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_container_history_on_master_id on ml_app.nfs_store_container_history using btree (master_id)
;


--
-- Name: index_nfs_store_container_history_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_container_history_on_nfs_store_container_id on ml_app.nfs_store_container_history using btree (nfs_store_container_id)
;


--
-- Name: index_nfs_store_container_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_container_history_on_user_id on ml_app.nfs_store_container_history using btree (user_id)
;


--
-- Name: index_nfs_store_containers_on_created_by_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_containers_on_created_by_user_id on ml_app.nfs_store_containers using btree (created_by_user_id)
;


--
-- Name: index_nfs_store_containers_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_containers_on_master_id on ml_app.nfs_store_containers using btree (master_id)
;


--
-- Name: index_nfs_store_containers_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_containers_on_nfs_store_container_id on ml_app.nfs_store_containers using btree (nfs_store_container_id)
;


--
-- Name: index_nfs_store_filter_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_filter_history_on_admin_id on ml_app.nfs_store_filter_history using btree (admin_id)
;


--
-- Name: index_nfs_store_filter_history_on_nfs_store_filter_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_filter_history_on_nfs_store_filter_id on ml_app.nfs_store_filter_history using btree (nfs_store_filter_id)
;


--
-- Name: index_nfs_store_filters_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_filters_on_admin_id on ml_app.nfs_store_filters using btree (admin_id)
;


--
-- Name: index_nfs_store_filters_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_filters_on_app_type_id on ml_app.nfs_store_filters using btree (app_type_id)
;


--
-- Name: index_nfs_store_filters_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_filters_on_user_id on ml_app.nfs_store_filters using btree (user_id)
;


--
-- Name: index_nfs_store_stored_file_history_on_nfs_store_stored_file_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_stored_file_history_on_nfs_store_stored_file_id on ml_app.nfs_store_stored_file_history using btree (nfs_store_stored_file_id)
;


--
-- Name: index_nfs_store_stored_file_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_stored_file_history_on_user_id on ml_app.nfs_store_stored_file_history using btree (user_id)
;


--
-- Name: index_nfs_store_stored_files_on_nfs_store_container_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_stored_files_on_nfs_store_container_id on ml_app.nfs_store_stored_files using btree (nfs_store_container_id)
;


--
-- Name: index_nfs_store_uploads_on_nfs_store_stored_file_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_uploads_on_nfs_store_stored_file_id on ml_app.nfs_store_uploads using btree (nfs_store_stored_file_id)
;


--
-- Name: index_nfs_store_uploads_on_upload_set; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_nfs_store_uploads_on_upload_set on ml_app.nfs_store_uploads using btree (upload_set)
;


--
-- Name: index_page_layout_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_page_layout_history_on_admin_id on ml_app.page_layout_history using btree (admin_id)
;


--
-- Name: index_page_layout_history_on_page_layout_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_page_layout_history_on_page_layout_id on ml_app.page_layout_history using btree (page_layout_id)
;


--
-- Name: index_page_layouts_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_page_layouts_on_admin_id on ml_app.page_layouts using btree (admin_id)
;


--
-- Name: index_page_layouts_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_page_layouts_on_app_type_id on ml_app.page_layouts using btree (app_type_id)
;


--
-- Name: index_player_contact_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_contact_history_on_master_id on ml_app.player_contact_history using btree (master_id)
;


--
-- Name: index_player_contact_history_on_player_contact_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_contact_history_on_player_contact_id on ml_app.player_contact_history using btree (player_contact_id)
;


--
-- Name: index_player_contact_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_contact_history_on_user_id on ml_app.player_contact_history using btree (user_id)
;


--
-- Name: index_player_contacts_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_contacts_on_master_id on ml_app.player_contacts using btree (master_id)
;


--
-- Name: index_player_contacts_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_contacts_on_user_id on ml_app.player_contacts using btree (user_id)
;


--
-- Name: index_player_info_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_info_history_on_master_id on ml_app.player_info_history using btree (master_id)
;


--
-- Name: index_player_info_history_on_player_info_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_info_history_on_player_info_id on ml_app.player_info_history using btree (player_info_id)
;


--
-- Name: index_player_info_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_info_history_on_user_id on ml_app.player_info_history using btree (user_id)
;


--
-- Name: index_player_infos_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_infos_on_master_id on ml_app.player_infos using btree (master_id)
;


--
-- Name: index_player_infos_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_player_infos_on_user_id on ml_app.player_infos using btree (user_id)
;


--
-- Name: index_pro_infos_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_pro_infos_on_master_id on ml_app.pro_infos using btree (master_id)
;


--
-- Name: index_pro_infos_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_pro_infos_on_user_id on ml_app.pro_infos using btree (user_id)
;


--
-- Name: index_protocol_event_history_on_protocol_event_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_protocol_event_history_on_protocol_event_id on ml_app.protocol_event_history using btree (protocol_event_id)
;


--
-- Name: index_protocol_events_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_protocol_events_on_admin_id on ml_app.protocol_events using btree (admin_id)
;


--
-- Name: index_protocol_events_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_protocol_events_on_sub_process_id on ml_app.protocol_events using btree (sub_process_id)
;


--
-- Name: index_protocol_history_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_protocol_history_on_protocol_id on ml_app.protocol_history using btree (protocol_id)
;


--
-- Name: index_protocols_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_protocols_on_admin_id on ml_app.protocols using btree (admin_id)
;


--
-- Name: index_protocols_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_protocols_on_app_type_id on ml_app.protocols using btree (app_type_id)
;


--
-- Name: index_report_history_on_report_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_report_history_on_report_id on ml_app.report_history using btree (report_id)
;


--
-- Name: index_reports_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_reports_on_admin_id on ml_app.reports using btree (admin_id)
;


--
-- Name: index_role_description_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_role_description_history_on_admin_id on ml_app.role_description_history using btree (admin_id)
;


--
-- Name: index_role_description_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_role_description_history_on_app_type_id on ml_app.role_description_history using btree (app_type_id)
;


--
-- Name: index_role_descriptions_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_role_descriptions_on_admin_id on ml_app.role_descriptions using btree (admin_id)
;


--
-- Name: index_role_descriptions_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_role_descriptions_on_app_type_id on ml_app.role_descriptions using btree (app_type_id)
;


--
-- Name: index_sage_assignments_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sage_assignments_on_admin_id on ml_app.sage_assignments using btree (admin_id)
;


--
-- Name: index_sage_assignments_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sage_assignments_on_master_id on ml_app.sage_assignments using btree (master_id)
;


--
-- Name: index_sage_assignments_on_sage_id; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_sage_assignments_on_sage_id on ml_app.sage_assignments using btree (sage_id)
;


--
-- Name: index_sage_assignments_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sage_assignments_on_user_id on ml_app.sage_assignments using btree (user_id)
;


--
-- Name: index_scantron_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_scantron_history_on_master_id on ml_app.scantron_history using btree (master_id)
;


--
-- Name: index_scantron_history_on_scantron_table_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_scantron_history_on_scantron_table_id on ml_app.scantron_history using btree (scantron_table_id)
;


--
-- Name: index_scantron_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_scantron_history_on_user_id on ml_app.scantron_history using btree (user_id)
;


--
-- Name: index_scantrons_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_scantrons_on_master_id on ml_app.scantrons using btree (master_id)
;


--
-- Name: index_scantrons_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_scantrons_on_user_id on ml_app.scantrons using btree (user_id)
;


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_sessions_on_session_id on ml_app.sessions using btree (session_id)
;


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sessions_on_updated_at on ml_app.sessions using btree (updated_at)
;


--
-- Name: index_sub_process_history_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sub_process_history_on_sub_process_id on ml_app.sub_process_history using btree (sub_process_id)
;


--
-- Name: index_sub_processes_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sub_processes_on_admin_id on ml_app.sub_processes using btree (admin_id)
;


--
-- Name: index_sub_processes_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_sub_processes_on_protocol_id on ml_app.sub_processes using btree (protocol_id)
;


--
-- Name: index_test1_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1_history_on_admin_id on ml_app.test1_history using btree (admin_id)
;


--
-- Name: index_test1_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1_history_on_master_id on ml_app.test1_history using btree (master_id)
;


--
-- Name: index_test1_history_on_test1_table_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1_history_on_test1_table_id on ml_app.test1_history using btree (test1_table_id)
;


--
-- Name: index_test1_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1_history_on_user_id on ml_app.test1_history using btree (user_id)
;


--
-- Name: index_test1s_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1s_on_admin_id on ml_app.test1s using btree (admin_id)
;


--
-- Name: index_test1s_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1s_on_master_id on ml_app.test1s using btree (master_id)
;


--
-- Name: index_test1s_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test1s_on_user_id on ml_app.test1s using btree (user_id)
;


--
-- Name: index_test2_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2_history_on_admin_id on ml_app.test2_history using btree (admin_id)
;


--
-- Name: index_test2_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2_history_on_master_id on ml_app.test2_history using btree (master_id)
;


--
-- Name: index_test2_history_on_test2_table_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2_history_on_test2_table_id on ml_app.test2_history using btree (test2_table_id)
;


--
-- Name: index_test2_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2_history_on_user_id on ml_app.test2_history using btree (user_id)
;


--
-- Name: index_test2s_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2s_on_admin_id on ml_app.test2s using btree (admin_id)
;


--
-- Name: index_test2s_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2s_on_master_id on ml_app.test2s using btree (master_id)
;


--
-- Name: index_test2s_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test2s_on_user_id on ml_app.test2s using btree (user_id)
;


--
-- Name: index_test_2_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2_history_on_admin_id on ml_app.test_2_history using btree (admin_id)
;


--
-- Name: index_test_2_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2_history_on_master_id on ml_app.test_2_history using btree (master_id)
;


--
-- Name: index_test_2_history_on_test_2_table_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2_history_on_test_2_table_id on ml_app.test_2_history using btree (test_2_table_id)
;


--
-- Name: index_test_2_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2_history_on_user_id on ml_app.test_2_history using btree (user_id)
;


--
-- Name: index_test_2s_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2s_on_admin_id on ml_app.test_2s using btree (admin_id)
;


--
-- Name: index_test_2s_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2s_on_master_id on ml_app.test_2s using btree (master_id)
;


--
-- Name: index_test_2s_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_2s_on_user_id on ml_app.test_2s using btree (user_id)
;


--
-- Name: index_test_ext2_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext2_history_on_master_id on ml_app.test_ext2_history using btree (master_id)
;


--
-- Name: index_test_ext2_history_on_test_ext2_table_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext2_history_on_test_ext2_table_id on ml_app.test_ext2_history using btree (test_ext2_table_id)
;


--
-- Name: index_test_ext2_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext2_history_on_user_id on ml_app.test_ext2_history using btree (user_id)
;


--
-- Name: index_test_ext2s_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext2s_on_master_id on ml_app.test_ext2s using btree (master_id)
;


--
-- Name: index_test_ext2s_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext2s_on_user_id on ml_app.test_ext2s using btree (user_id)
;


--
-- Name: index_test_ext_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext_history_on_master_id on ml_app.test_ext_history using btree (master_id)
;


--
-- Name: index_test_ext_history_on_test_ext_table_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext_history_on_test_ext_table_id on ml_app.test_ext_history using btree (test_ext_table_id)
;


--
-- Name: index_test_ext_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_ext_history_on_user_id on ml_app.test_ext_history using btree (user_id)
;


--
-- Name: index_test_exts_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_exts_on_master_id on ml_app.test_exts using btree (master_id)
;


--
-- Name: index_test_exts_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_exts_on_user_id on ml_app.test_exts using btree (user_id)
;


--
-- Name: index_test_item_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_item_history_on_master_id on ml_app.test_item_history using btree (master_id)
;


--
-- Name: index_test_item_history_on_test_item_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_item_history_on_test_item_id on ml_app.test_item_history using btree (test_item_id)
;


--
-- Name: index_test_item_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_item_history_on_user_id on ml_app.test_item_history using btree (user_id)
;


--
-- Name: index_test_items_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_items_on_master_id on ml_app.test_items using btree (master_id)
;


--
-- Name: index_test_items_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_test_items_on_user_id on ml_app.test_items using btree (user_id)
;


--
-- Name: index_tracker_history_on_item_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_item_type_id on ml_app.tracker_history using btree (item_type, item_id)
;


--
-- Name: index_tracker_history_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_master_id on ml_app.tracker_history using btree (master_id)
;


--
-- Name: index_tracker_history_on_protocol_event_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_protocol_event_id on ml_app.tracker_history using btree (protocol_event_id)
;


--
-- Name: index_tracker_history_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_protocol_id on ml_app.tracker_history using btree (protocol_id)
;


--
-- Name: index_tracker_history_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_sub_process_id on ml_app.tracker_history using btree (sub_process_id)
;


--
-- Name: index_tracker_history_on_tracker_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_tracker_id on ml_app.tracker_history using btree (tracker_id)
;


--
-- Name: index_tracker_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_tracker_history_on_user_id on ml_app.tracker_history using btree (user_id)
;


--
-- Name: index_trackers_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_trackers_on_master_id on ml_app.trackers using btree (master_id)
;


--
-- Name: index_trackers_on_protocol_event_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_trackers_on_protocol_event_id on ml_app.trackers using btree (protocol_event_id)
;


--
-- Name: index_trackers_on_protocol_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_trackers_on_protocol_id on ml_app.trackers using btree (protocol_id)
;


--
-- Name: index_trackers_on_sub_process_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_trackers_on_sub_process_id on ml_app.trackers using btree (sub_process_id)
;


--
-- Name: index_trackers_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_trackers_on_user_id on ml_app.trackers using btree (user_id)
;


--
-- Name: index_user_access_control_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_access_control_history_on_admin_id on ml_app.user_access_control_history using btree (admin_id)
;


--
-- Name: index_user_access_control_history_on_user_access_control_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_access_control_history_on_user_access_control_id on ml_app.user_access_control_history using btree (user_access_control_id)
;


--
-- Name: index_user_access_controls_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_access_controls_on_app_type_id on ml_app.user_access_controls using btree (app_type_id)
;


--
-- Name: index_user_action_logs_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_action_logs_on_app_type_id on ml_app.user_action_logs using btree (app_type_id)
;


--
-- Name: index_user_action_logs_on_master_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_action_logs_on_master_id on ml_app.user_action_logs using btree (master_id)
;


--
-- Name: index_user_action_logs_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_action_logs_on_user_id on ml_app.user_action_logs using btree (user_id)
;


--
-- Name: index_user_authorization_history_on_user_authorization_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_authorization_history_on_user_authorization_id on ml_app.user_authorization_history using btree (user_authorization_id)
;


--
-- Name: index_user_description_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_description_history_on_admin_id on ml_app.user_description_history using btree (admin_id)
;


--
-- Name: index_user_description_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_description_history_on_app_type_id on ml_app.user_description_history using btree (app_type_id)
;


--
-- Name: index_user_descriptions_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_descriptions_on_admin_id on ml_app.user_descriptions using btree (admin_id)
;


--
-- Name: index_user_descriptions_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_descriptions_on_app_type_id on ml_app.user_descriptions using btree (app_type_id)
;


--
-- Name: index_user_history_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_history_on_app_type_id on ml_app.user_history using btree (app_type_id)
;


--
-- Name: index_user_history_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_history_on_user_id on ml_app.user_history using btree (user_id)
;


--
-- Name: index_user_preferences_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_user_preferences_on_user_id on ml_app.user_preferences using btree (user_id)
;


--
-- Name: index_user_role_history_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_role_history_on_admin_id on ml_app.user_role_history using btree (admin_id)
;


--
-- Name: index_user_role_history_on_user_role_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_role_history_on_user_role_id on ml_app.user_role_history using btree (user_role_id)
;


--
-- Name: index_user_roles_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_roles_on_admin_id on ml_app.user_roles using btree (admin_id)
;


--
-- Name: index_user_roles_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_roles_on_app_type_id on ml_app.user_roles using btree (app_type_id)
;


--
-- Name: index_user_roles_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_user_roles_on_user_id on ml_app.user_roles using btree (user_id)
;


--
-- Name: index_users_contact_infos_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_users_contact_infos_on_admin_id on ml_app.users_contact_infos using btree (admin_id)
;


--
-- Name: index_users_contact_infos_on_user_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_users_contact_infos_on_user_id on ml_app.users_contact_infos using btree (user_id)
;


--
-- Name: index_users_on_admin_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_users_on_admin_id on ml_app.users using btree (admin_id)
;


--
-- Name: index_users_on_app_type_id; Type: INDEX; Schema: ml_app; Owner: -
--
create index index_users_on_app_type_id on ml_app.users using btree (app_type_id)
;


--
-- Name: index_users_on_authentication_token; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_users_on_authentication_token on ml_app.users using btree (authentication_token)
;


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_users_on_confirmation_token on ml_app.users using btree (confirmation_token)
;


--
-- Name: index_users_on_email; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_users_on_email on ml_app.users using btree (email)
;


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_users_on_reset_password_token on ml_app.users using btree (reset_password_token)
;


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index index_users_on_unlock_token on ml_app.users using btree (unlock_token)
;


--
-- Name: nfs_store_stored_files_unique_file; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index nfs_store_stored_files_unique_file on ml_app.nfs_store_stored_files using btree (nfs_store_container_id, file_hash, file_name, path)
;


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: ml_app; Owner: -
--
create unique index unique_schema_migrations on ml_app.schema_migrations using btree (version)
;


--
-- Name: idx_dch_on_redcap_dd_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_dch_on_redcap_dd_id on ref_data.datadic_choice_history using btree (redcap_data_dictionary_id)
;


--
-- Name: idx_dv_equiv; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_dv_equiv on ref_data.datadic_variables using btree (equivalent_to_id)
;


--
-- Name: idx_dvh_equiv; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_dvh_equiv on ref_data.datadic_variable_history using btree (equivalent_to_id)
;


--
-- Name: idx_dvh_on_redcap_dd_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_dvh_on_redcap_dd_id on ref_data.datadic_variable_history using btree (redcap_data_dictionary_id)
;


--
-- Name: idx_h_on_datadic_variable_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_h_on_datadic_variable_id on ref_data.datadic_variable_history using btree (datadic_variable_id)
;


--
-- Name: idx_h_on_proj_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_h_on_proj_admin_id on ref_data.redcap_project_user_history using btree (redcap_project_admin_id)
;


--
-- Name: idx_h_on_rdci_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_h_on_rdci_id on ref_data.redcap_data_collection_instrument_history using btree (redcap_data_collection_instrument_id)
;


--
-- Name: idx_h_on_redcap_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_h_on_redcap_admin_id on ref_data.redcap_data_dictionary_history using btree (redcap_project_admin_id)
;


--
-- Name: idx_h_on_redcap_project_user_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_h_on_redcap_project_user_id on ref_data.redcap_project_user_history using btree (redcap_project_user_id)
;


--
-- Name: idx_history_on_datadic_choice_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_history_on_datadic_choice_id on ref_data.datadic_choice_history using btree (datadic_choice_id)
;


--
-- Name: idx_history_on_redcap_data_dictionary_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_history_on_redcap_data_dictionary_id on ref_data.redcap_data_dictionary_history using btree (redcap_data_dictionary_id)
;


--
-- Name: idx_history_on_redcap_project_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_history_on_redcap_project_admin_id on ref_data.redcap_project_admin_history using btree (redcap_project_admin_id)
;


--
-- Name: idx_on_redcap_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_on_redcap_admin_id on ref_data.redcap_data_dictionaries using btree (redcap_project_admin_id)
;


--
-- Name: idx_rcr_on_redcap_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_rcr_on_redcap_admin_id on ref_data.redcap_client_requests using btree (redcap_project_admin_id)
;


--
-- Name: idx_rdci_pa; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_rdci_pa on ref_data.redcap_data_collection_instruments using btree (redcap_project_admin_id)
;


--
-- Name: idx_rdcih_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_rdcih_on_admin_id on ref_data.redcap_data_collection_instrument_history using btree (admin_id)
;


--
-- Name: idx_rdcih_on_proj_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index idx_rdcih_on_proj_admin_id on ref_data.redcap_data_collection_instrument_history using btree (redcap_project_admin_id)
;


--
-- Name: index_datadic_variable_history_on_user_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index index_datadic_variable_history_on_user_id on ref_data.datadic_variable_history using btree (user_id)
;


--
-- Name: index_datadic_variables_on_user_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index index_datadic_variables_on_user_id on ref_data.datadic_variables using btree (user_id)
;


--
-- Name: index_ref_data.datadic_choice_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.datadic_choice_history_on_admin_id" on ref_data.datadic_choice_history using btree (admin_id)
;


--
-- Name: index_ref_data.datadic_choices_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.datadic_choices_on_admin_id" on ref_data.datadic_choices using btree (admin_id)
;


--
-- Name: index_ref_data.datadic_choices_on_redcap_data_dictionary_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.datadic_choices_on_redcap_data_dictionary_id" on ref_data.datadic_choices using btree (redcap_data_dictionary_id)
;


--
-- Name: index_ref_data.datadic_variable_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.datadic_variable_history_on_admin_id" on ref_data.datadic_variable_history using btree (admin_id)
;


--
-- Name: index_ref_data.datadic_variables_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.datadic_variables_on_admin_id" on ref_data.datadic_variables using btree (admin_id)
;


--
-- Name: index_ref_data.datadic_variables_on_redcap_data_dictionary_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.datadic_variables_on_redcap_data_dictionary_id" on ref_data.datadic_variables using btree (redcap_data_dictionary_id)
;


--
-- Name: index_ref_data.domain_mappings_on_user_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.domain_mappings_on_user_id" on ref_data.domain_mappings using btree (user_id)
;


--
-- Name: index_ref_data.redcap_client_requests_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_client_requests_on_admin_id" on ref_data.redcap_client_requests using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_data_collection_instruments_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_data_collection_instruments_on_admin_id" on ref_data.redcap_data_collection_instruments using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_data_dictionaries_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_data_dictionaries_on_admin_id" on ref_data.redcap_data_dictionaries using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_data_dictionary_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_data_dictionary_history_on_admin_id" on ref_data.redcap_data_dictionary_history using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_project_admin_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_project_admin_history_on_admin_id" on ref_data.redcap_project_admin_history using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_project_admins_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_project_admins_on_admin_id" on ref_data.redcap_project_admins using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_project_user_history_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_project_user_history_on_admin_id" on ref_data.redcap_project_user_history using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_project_users_on_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_project_users_on_admin_id" on ref_data.redcap_project_users using btree (admin_id)
;


--
-- Name: index_ref_data.redcap_project_users_on_redcap_project_admin_id; Type: INDEX; Schema: ref_data; Owner: -
--
create index "index_ref_data.redcap_project_users_on_redcap_project_admin_id" on ref_data.redcap_project_users using btree (redcap_project_admin_id)
;


--
-- Name: accuracy_scores accuracy_score_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger accuracy_score_history_insert
after insert on ml_app.accuracy_scores for each row
execute function ml_app.log_accuracy_score_update ()
;


--
-- Name: accuracy_scores accuracy_score_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger accuracy_score_history_update
after
update on ml_app.accuracy_scores for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_accuracy_score_update ()
;


--
-- Name: activity_logs activity_log_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger activity_log_history_insert
after insert on ml_app.activity_logs for each row
execute function ml_app.log_activity_log_update ()
;


--
-- Name: activity_logs activity_log_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger activity_log_history_update
after
update on ml_app.activity_logs for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_activity_log_update ()
;


--
-- Name: activity_log_player_contact_phones activity_log_player_contact_phone_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger activity_log_player_contact_phone_history_insert
after insert on ml_app.activity_log_player_contact_phones for each row
execute function ml_app.log_activity_log_player_contact_phone_update ()
;


--
-- Name: activity_log_player_contact_phones activity_log_player_contact_phone_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger activity_log_player_contact_phone_history_update
after
update on ml_app.activity_log_player_contact_phones for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_activity_log_player_contact_phone_update ()
;


--
-- Name: addresses address_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger address_history_insert
after insert on ml_app.addresses for each row
execute function ml_app.log_address_update ()
;


--
-- Name: addresses address_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger address_history_update
after
update on ml_app.addresses for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_address_update ()
;


--
-- Name: addresses address_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger address_insert before insert on ml_app.addresses for each row
execute function ml_app.handle_address_update ()
;


--
-- Name: addresses address_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger address_update before
update on ml_app.addresses for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.handle_address_update ()
;


--
-- Name: admins admin_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger admin_history_insert
after insert on ml_app.admins for each row
execute function ml_app.log_admin_update ()
;


--
-- Name: admins admin_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger admin_history_update
after
update on ml_app.admins for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_admin_update ()
;


--
-- Name: app_configurations app_configuration_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger app_configuration_history_insert
after insert on ml_app.app_configurations for each row
execute function ml_app.log_app_configuration_update ()
;


--
-- Name: app_configurations app_configuration_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger app_configuration_history_update
after
update on ml_app.app_configurations for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_app_configuration_update ()
;


--
-- Name: app_types app_type_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger app_type_history_insert
after insert on ml_app.app_types for each row
execute function ml_app.log_app_type_update ()
;


--
-- Name: app_types app_type_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger app_type_history_update
after
update on ml_app.app_types for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_app_type_update ()
;


--
-- Name: colleges college_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger college_history_insert
after insert on ml_app.colleges for each row
execute function ml_app.log_college_update ()
;


--
-- Name: colleges college_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger college_history_update
after
update on ml_app.colleges for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_college_update ()
;


--
-- Name: config_libraries config_library_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger config_library_history_insert
after insert on ml_app.config_libraries for each row
execute function ml_app.log_config_library_update ()
;


--
-- Name: config_libraries config_library_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger config_library_history_update
after
update on ml_app.config_libraries for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_config_library_update ()
;


--
-- Name: dynamic_models dynamic_model_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger dynamic_model_history_insert
after insert on ml_app.dynamic_models for each row
execute function ml_app.log_dynamic_model_update ()
;


--
-- Name: dynamic_models dynamic_model_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger dynamic_model_history_update
after
update on ml_app.dynamic_models for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_dynamic_model_update ()
;


--
-- Name: external_identifiers external_identifier_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger external_identifier_history_insert
after insert on ml_app.external_identifiers for each row
execute function ml_app.log_external_identifier_update ()
;


--
-- Name: external_identifiers external_identifier_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger external_identifier_history_update
after
update on ml_app.external_identifiers for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_external_identifier_update ()
;


--
-- Name: external_links external_link_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger external_link_history_insert
after insert on ml_app.external_links for each row
execute function ml_app.log_external_link_update ()
;


--
-- Name: external_links external_link_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger external_link_history_update
after
update on ml_app.external_links for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_external_link_update ()
;


--
-- Name: general_selections general_selection_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger general_selection_history_insert
after insert on ml_app.general_selections for each row
execute function ml_app.log_general_selection_update ()
;


--
-- Name: general_selections general_selection_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger general_selection_history_update
after
update on ml_app.general_selections for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_general_selection_update ()
;


--
-- Name: grit_assignments grit_assignment_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger grit_assignment_history_insert
after insert on ml_app.grit_assignments for each row
execute function grit.log_grit_assignment_update ()
;


--
-- Name: grit_assignments grit_assignment_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger grit_assignment_history_update
after
update on ml_app.grit_assignments for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function grit.log_grit_assignment_update ()
;


--
-- Name: item_flags item_flag_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger item_flag_history_insert
after insert on ml_app.item_flags for each row
execute function ml_app.log_item_flag_update ()
;


--
-- Name: item_flags item_flag_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger item_flag_history_update
after
update on ml_app.item_flags for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_item_flag_update ()
;


--
-- Name: item_flag_names item_flag_name_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger item_flag_name_history_insert
after insert on ml_app.item_flag_names for each row
execute function ml_app.log_item_flag_name_update ()
;


--
-- Name: item_flag_names item_flag_name_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger item_flag_name_history_update
after
update on ml_app.item_flag_names for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_item_flag_name_update ()
;


--
-- Name: role_descriptions log_role_description_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger log_role_description_history_insert
after insert on ml_app.role_descriptions for each row
execute function ml_app.role_description_history_upd ()
;


--
-- Name: role_descriptions log_role_description_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger log_role_description_history_update
after
update on ml_app.role_descriptions for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.role_description_history_upd ()
;


--
-- Name: user_descriptions log_user_description_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger log_user_description_history_insert
after insert on ml_app.user_descriptions for each row
execute function ml_app.user_description_history_upd ()
;


--
-- Name: user_descriptions log_user_description_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger log_user_description_history_update
after
update on ml_app.user_descriptions for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.user_description_history_upd ()
;


--
-- Name: message_templates message_template_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger message_template_history_insert
after insert on ml_app.message_templates for each row
execute function ml_app.log_message_template_update ()
;


--
-- Name: message_templates message_template_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger message_template_history_update
after
update on ml_app.message_templates for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_message_template_update ()
;


--
-- Name: nfs_store_archived_files nfs_store_archived_file_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_archived_file_history_insert
after insert on ml_app.nfs_store_archived_files for each row
execute function ml_app.log_nfs_store_archived_file_update ()
;


--
-- Name: nfs_store_archived_files nfs_store_archived_file_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_archived_file_history_update
after
update on ml_app.nfs_store_archived_files for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_nfs_store_archived_file_update ()
;


--
-- Name: nfs_store_containers nfs_store_container_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_container_history_insert
after insert on ml_app.nfs_store_containers for each row
execute function ml_app.log_nfs_store_container_update ()
;


--
-- Name: nfs_store_containers nfs_store_container_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_container_history_update
after
update on ml_app.nfs_store_containers for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_nfs_store_container_update ()
;


--
-- Name: nfs_store_filters nfs_store_filter_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_filter_history_insert
after insert on ml_app.nfs_store_filters for each row
execute function ml_app.log_nfs_store_filter_update ()
;


--
-- Name: nfs_store_filters nfs_store_filter_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_filter_history_update
after
update on ml_app.nfs_store_filters for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_nfs_store_filter_update ()
;


--
-- Name: nfs_store_stored_files nfs_store_stored_file_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_stored_file_history_insert
after insert on ml_app.nfs_store_stored_files for each row
execute function ml_app.log_nfs_store_stored_file_update ()
;


--
-- Name: nfs_store_stored_files nfs_store_stored_file_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger nfs_store_stored_file_history_update
after
update on ml_app.nfs_store_stored_files for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_nfs_store_stored_file_update ()
;


--
-- Name: page_layouts page_layout_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger page_layout_history_insert
after insert on ml_app.page_layouts for each row
execute function ml_app.log_page_layout_update ()
;


--
-- Name: page_layouts page_layout_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger page_layout_history_update
after
update on ml_app.page_layouts for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_page_layout_update ()
;


--
-- Name: player_contacts player_contact_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_contact_history_insert
after insert on ml_app.player_contacts for each row
execute function ml_app.log_player_contact_update ()
;


--
-- Name: player_contacts player_contact_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_contact_history_update
after
update on ml_app.player_contacts for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_player_contact_update ()
;


--
-- Name: player_contacts player_contact_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_contact_insert before insert on ml_app.player_contacts for each row
execute function ml_app.handle_player_contact_update ()
;


--
-- Name: player_contacts player_contact_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_contact_update before
update on ml_app.player_contacts for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.handle_player_contact_update ()
;


--
-- Name: player_infos player_info_before_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_info_before_update before
update on ml_app.player_infos for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.handle_player_info_before_update ()
;


--
-- Name: player_infos player_info_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_info_history_insert
after insert on ml_app.player_infos for each row
execute function ml_app.log_player_info_update ()
;


--
-- Name: player_infos player_info_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_info_history_update
after
update on ml_app.player_infos for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_player_info_update ()
;


--
-- Name: player_infos player_info_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_info_insert
after insert on ml_app.player_infos for each row
execute function ml_app.update_master_with_player_info ()
;


--
-- Name: player_infos player_info_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger player_info_update
after
update on ml_app.player_infos for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.update_master_with_player_info ()
;


--
-- Name: pro_infos pro_info_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger pro_info_insert
after insert on ml_app.pro_infos for each row
execute function ml_app.update_master_with_pro_info ()
;


--
-- Name: pro_infos pro_info_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger pro_info_update
after
update on ml_app.pro_infos for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.update_master_with_pro_info ()
;


--
-- Name: protocol_events protocol_event_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger protocol_event_history_insert
after insert on ml_app.protocol_events for each row
execute function ml_app.log_protocol_event_update ()
;


--
-- Name: protocol_events protocol_event_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger protocol_event_history_update
after
update on ml_app.protocol_events for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_protocol_event_update ()
;


--
-- Name: protocols protocol_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger protocol_history_insert
after insert on ml_app.protocols for each row
execute function ml_app.log_protocol_update ()
;


--
-- Name: protocols protocol_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger protocol_history_update
after
update on ml_app.protocols for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_protocol_update ()
;


--
-- Name: rc_stage_cif_copy rc_cis_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger rc_cis_update before
update on ml_app.rc_stage_cif_copy for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.handle_rc_cis_update ()
;


--
-- Name: reports report_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger report_history_insert
after insert on ml_app.reports for each row
execute function ml_app.log_report_update ()
;


--
-- Name: reports report_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger report_history_update
after
update on ml_app.reports for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_report_update ()
;


--
-- Name: scantrons scantron_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger scantron_history_insert
after insert on ml_app.scantrons for each row
execute function ml_app.log_scantron_update ()
;


--
-- Name: scantrons scantron_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger scantron_history_update
after
update on ml_app.scantrons for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_scantron_update ()
;


--
-- Name: sub_processes sub_process_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger sub_process_history_insert
after insert on ml_app.sub_processes for each row
execute function ml_app.log_sub_process_update ()
;


--
-- Name: sub_processes sub_process_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger sub_process_history_update
after
update on ml_app.sub_processes for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_sub_process_update ()
;


--
-- Name: trackers tracker_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger tracker_history_insert
after insert on ml_app.trackers for each row
execute function ml_app.log_tracker_update ()
;


--
-- Name: tracker_history tracker_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger tracker_history_update before
update on ml_app.tracker_history for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.handle_tracker_history_update ()
;


--
-- Name: trackers tracker_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger tracker_history_update
after
update on ml_app.trackers for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_tracker_update ()
;


--
-- Name: tracker_history tracker_record_delete; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger tracker_record_delete
after delete on ml_app.tracker_history for each row
execute function ml_app.handle_delete ()
;


--
-- Name: trackers tracker_upsert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger tracker_upsert before insert on ml_app.trackers for each row
execute function ml_app.tracker_upsert ()
;


--
-- Name: masters update_master_msid_trigger; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger update_master_msid_trigger
after insert on ml_app.masters for each row
execute function ml_app.update_master_msid ()
;


--
-- Name: user_access_controls user_access_control_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_access_control_history_insert
after insert on ml_app.user_access_controls for each row
execute function ml_app.log_user_access_control_update ()
;


--
-- Name: user_access_controls user_access_control_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_access_control_history_update
after
update on ml_app.user_access_controls for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_user_access_control_update ()
;


--
-- Name: user_authorizations user_authorization_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_authorization_history_insert
after insert on ml_app.user_authorizations for each row
execute function ml_app.log_user_authorization_update ()
;


--
-- Name: user_authorizations user_authorization_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_authorization_history_update
after
update on ml_app.user_authorizations for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_user_authorization_update ()
;


--
-- Name: users user_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_history_insert
after insert on ml_app.users for each row
execute function ml_app.log_user_update ()
;


--
-- Name: users user_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_history_update
after
update on ml_app.users for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_user_update ()
;


--
-- Name: user_roles user_role_history_insert; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_role_history_insert
after insert on ml_app.user_roles for each row
execute function ml_app.log_user_role_update ()
;


--
-- Name: user_roles user_role_history_update; Type: TRIGGER; Schema: ml_app; Owner: -
--
create trigger user_role_history_update
after
update on ml_app.user_roles for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.log_user_role_update ()
;


--
-- Name: data_variable_packages log_data_variable_package_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_data_variable_package_history_insert
after insert on ref_data.data_variable_packages for each row
execute function ref_data.log_data_variable_packages_update ()
;


--
-- Name: data_variable_packages log_data_variable_package_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_data_variable_package_history_update
after
update on ref_data.data_variable_packages for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ref_data.log_data_variable_packages_update ()
;


--
-- Name: data_variable_package_vars log_data_variable_package_var_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_data_variable_package_var_history_insert
after insert on ref_data.data_variable_package_vars for each row
execute function ref_data.log_data_variable_package_vars_update ()
;


--
-- Name: data_variable_package_vars log_data_variable_package_var_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_data_variable_package_var_history_update
after
update on ref_data.data_variable_package_vars for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ref_data.log_data_variable_package_vars_update ()
;


--
-- Name: datadic_choices log_datadic_choice_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_datadic_choice_history_insert
after insert on ref_data.datadic_choices for each row
execute function ml_app.datadic_choice_history_upd ()
;


--
-- Name: datadic_choices log_datadic_choice_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_datadic_choice_history_update
after
update on ref_data.datadic_choices for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.datadic_choice_history_upd ()
;


--
-- Name: datadic_variables log_datadic_variable_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_datadic_variable_history_insert
after insert on ref_data.datadic_variables for each row
execute function ref_data.log_datadic_variables_update ()
;


--
-- Name: datadic_variables log_datadic_variable_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_datadic_variable_history_update
after
update on ref_data.datadic_variables for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ref_data.log_datadic_variables_update ()
;


--
-- Name: domain_mappings log_domain_mapping_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_domain_mapping_history_insert
after insert on ref_data.domain_mappings for each row
execute function ref_data.log_domain_mappings_update ()
;


--
-- Name: domain_mappings log_domain_mapping_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_domain_mapping_history_update
after
update on ref_data.domain_mappings for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ref_data.log_domain_mappings_update ()
;


--
-- Name: redcap_data_collection_instruments log_redcap_data_collection_instrument_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_data_collection_instrument_history_insert
after insert on ref_data.redcap_data_collection_instruments for each row
execute function ref_data.redcap_data_collection_instrument_history_upd ()
;


--
-- Name: redcap_data_collection_instruments log_redcap_data_collection_instrument_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_data_collection_instrument_history_update
after
update on ref_data.redcap_data_collection_instruments for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ref_data.redcap_data_collection_instrument_history_upd ()
;


--
-- Name: redcap_data_dictionaries log_redcap_data_dictionary_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_data_dictionary_history_insert
after insert on ref_data.redcap_data_dictionaries for each row
execute function ml_app.redcap_data_dictionary_history_upd ()
;


--
-- Name: redcap_data_dictionaries log_redcap_data_dictionary_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_data_dictionary_history_update
after
update on ref_data.redcap_data_dictionaries for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.redcap_data_dictionary_history_upd ()
;


--
-- Name: redcap_project_admins log_redcap_project_admin_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_project_admin_history_insert
after insert on ref_data.redcap_project_admins for each row
execute function ml_app.redcap_project_admin_history_upd ()
;


--
-- Name: redcap_project_admins log_redcap_project_admin_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_project_admin_history_update
after
update on ref_data.redcap_project_admins for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ml_app.redcap_project_admin_history_upd ()
;


--
-- Name: redcap_project_users log_redcap_project_user_history_insert; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_project_user_history_insert
after insert on ref_data.redcap_project_users for each row
execute function ref_data.redcap_project_user_history_upd ()
;


--
-- Name: redcap_project_users log_redcap_project_user_history_update; Type: TRIGGER; Schema: ref_data; Owner: -
--
create trigger log_redcap_project_user_history_update
after
update on ref_data.redcap_project_users for each row when (
  (
    old.* is distinct
    from
      new.*
  )
)
execute function ref_data.redcap_project_user_history_upd ()
;


--
-- Name: accuracy_score_history fk_accuracy_score_history_accuracy_scores; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.accuracy_score_history
add constraint fk_accuracy_score_history_accuracy_scores foreign key (accuracy_score_id) references ml_app.accuracy_scores (id)
;


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_activity_log_playe; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phone_history
add constraint fk_activity_log_player_contact_phone_history_activity_log_playe foreign key (activity_log_player_contact_phone_id) references ml_app.activity_log_player_contact_phones (id)
;


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phone_history
add constraint fk_activity_log_player_contact_phone_history_masters foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_player_contact_pho; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phone_history
add constraint fk_activity_log_player_contact_phone_history_player_contact_pho foreign key (player_contact_id) references ml_app.player_contacts (id)
;


--
-- Name: activity_log_player_contact_phone_history fk_activity_log_player_contact_phone_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phone_history
add constraint fk_activity_log_player_contact_phone_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: address_history fk_address_history_addresses; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.address_history
add constraint fk_address_history_addresses foreign key (address_id) references ml_app.addresses (id)
;


--
-- Name: address_history fk_address_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.address_history
add constraint fk_address_history_masters foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: address_history fk_address_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.address_history
add constraint fk_address_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: admin_history fk_admin_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_history
add constraint fk_admin_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: admin_history fk_admin_history_upd_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_history
add constraint fk_admin_history_upd_admins foreign key (updated_by_admin_id) references ml_app.admins (id)
;


--
-- Name: app_configuration_history fk_app_configuration_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configuration_history
add constraint fk_app_configuration_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: app_configuration_history fk_app_configuration_history_app_configurations; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configuration_history
add constraint fk_app_configuration_history_app_configurations foreign key (app_configuration_id) references ml_app.app_configurations (id)
;


--
-- Name: app_type_history fk_app_type_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_type_history
add constraint fk_app_type_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: app_type_history fk_app_type_history_app_types; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_type_history
add constraint fk_app_type_history_app_types foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: college_history fk_college_history_colleges; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.college_history
add constraint fk_college_history_colleges foreign key (college_id) references ml_app.colleges (id)
;


--
-- Name: dynamic_model_history fk_dynamic_model_history_dynamic_models; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.dynamic_model_history
add constraint fk_dynamic_model_history_dynamic_models foreign key (dynamic_model_id) references ml_app.dynamic_models (id)
;


--
-- Name: external_link_history fk_external_link_history_external_links; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_link_history
add constraint fk_external_link_history_external_links foreign key (external_link_id) references ml_app.external_links (id)
;


--
-- Name: general_selection_history fk_general_selection_history_general_selections; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.general_selection_history
add constraint fk_general_selection_history_general_selections foreign key (general_selection_id) references ml_app.general_selections (id)
;


--
-- Name: item_flag_history fk_item_flag_history_item_flags; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_history
add constraint fk_item_flag_history_item_flags foreign key (item_flag_id) references ml_app.item_flags (id)
;


--
-- Name: item_flag_name_history fk_item_flag_name_history_item_flag_names; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_name_history
add constraint fk_item_flag_name_history_item_flag_names foreign key (item_flag_name_id) references ml_app.item_flag_names (id)
;


--
-- Name: message_template_history fk_message_template_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_template_history
add constraint fk_message_template_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: message_template_history fk_message_template_history_message_templates; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_template_history
add constraint fk_message_template_history_message_templates foreign key (message_template_id) references ml_app.message_templates (id)
;


--
-- Name: nfs_store_archived_file_history fk_nfs_store_archived_file_history_nfs_store_archived_files; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_file_history
add constraint fk_nfs_store_archived_file_history_nfs_store_archived_files foreign key (nfs_store_archived_file_id) references ml_app.nfs_store_archived_files (id)
;


--
-- Name: nfs_store_archived_file_history fk_nfs_store_archived_file_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_file_history
add constraint fk_nfs_store_archived_file_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_container_history fk_nfs_store_container_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_container_history
add constraint fk_nfs_store_container_history_masters foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: nfs_store_container_history fk_nfs_store_container_history_nfs_store_containers; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_container_history
add constraint fk_nfs_store_container_history_nfs_store_containers foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: nfs_store_container_history fk_nfs_store_container_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_container_history
add constraint fk_nfs_store_container_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_filter_history fk_nfs_store_filter_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filter_history
add constraint fk_nfs_store_filter_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_filter_history fk_nfs_store_filter_history_nfs_store_filters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filter_history
add constraint fk_nfs_store_filter_history_nfs_store_filters foreign key (nfs_store_filter_id) references ml_app.nfs_store_filters (id)
;


--
-- Name: nfs_store_stored_file_history fk_nfs_store_stored_file_history_nfs_store_stored_files; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_file_history
add constraint fk_nfs_store_stored_file_history_nfs_store_stored_files foreign key (nfs_store_stored_file_id) references ml_app.nfs_store_stored_files (id)
;


--
-- Name: nfs_store_stored_file_history fk_nfs_store_stored_file_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_file_history
add constraint fk_nfs_store_stored_file_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: page_layout_history fk_page_layout_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layout_history
add constraint fk_page_layout_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: page_layout_history fk_page_layout_history_page_layouts; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layout_history
add constraint fk_page_layout_history_page_layouts foreign key (page_layout_id) references ml_app.page_layouts (id)
;


--
-- Name: player_contact_history fk_player_contact_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contact_history
add constraint fk_player_contact_history_masters foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: player_contact_history fk_player_contact_history_player_contacts; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contact_history
add constraint fk_player_contact_history_player_contacts foreign key (player_contact_id) references ml_app.player_contacts (id)
;


--
-- Name: player_contact_history fk_player_contact_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contact_history
add constraint fk_player_contact_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: player_info_history fk_player_info_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_info_history
add constraint fk_player_info_history_masters foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: player_info_history fk_player_info_history_player_infos; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_info_history
add constraint fk_player_info_history_player_infos foreign key (player_info_id) references ml_app.player_infos (id)
;


--
-- Name: player_info_history fk_player_info_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_info_history
add constraint fk_player_info_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: protocol_event_history fk_protocol_event_history_protocol_events; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_event_history
add constraint fk_protocol_event_history_protocol_events foreign key (protocol_event_id) references ml_app.protocol_events (id)
;


--
-- Name: protocol_history fk_protocol_history_protocols; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_history
add constraint fk_protocol_history_protocols foreign key (protocol_id) references ml_app.protocols (id)
;


--
-- Name: masters fk_rails_00b234154d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.masters
add constraint fk_rails_00b234154d foreign key (user_id) references ml_app.users (id)
;


--
-- Name: app_configurations fk_rails_00f31a00c4; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configurations
add constraint fk_rails_00f31a00c4 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_filters fk_rails_0208c3b54d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filters
add constraint fk_rails_0208c3b54d foreign key (user_id) references ml_app.users (id)
;


--
-- Name: external_identifier_history fk_rails_0210618434; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifier_history
add constraint fk_rails_0210618434 foreign key (external_identifier_id) references ml_app.external_identifiers (id)
;


--
-- Name: player_infos fk_rails_08e7f66647; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_infos
add constraint fk_rails_08e7f66647 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: user_action_logs fk_rails_08eec3f089; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_action_logs
add constraint fk_rails_08eec3f089 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: role_description_history fk_rails_0910ca20ea; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_description_history
add constraint fk_rails_0910ca20ea foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: protocol_events fk_rails_0a64e1160a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_events
add constraint fk_rails_0a64e1160a foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_imports fk_rails_0ad81c489c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_imports
add constraint fk_rails_0ad81c489c foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_containers fk_rails_0c84487284; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
add constraint fk_rails_0c84487284 foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: nfs_store_imports fk_rails_0d30944d1b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_imports
add constraint fk_rails_0d30944d1b foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: nfs_store_stored_files fk_rails_0de144234e; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_files
add constraint fk_rails_0de144234e foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: nfs_store_trash_actions fk_rails_0e2ecd8d43; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_trash_actions
add constraint fk_rails_0e2ecd8d43 foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: masters fk_rails_10869244dc; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.masters
add constraint fk_rails_10869244dc foreign key (created_by_user_id) references ml_app.users (id)
;


--
-- Name: users fk_rails_1694bfe639; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.users
add constraint fk_rails_1694bfe639 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: activity_log_history fk_rails_16d57266f7; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_history
add constraint fk_rails_16d57266f7 foreign key (activity_log_id) references ml_app.activity_logs (id)
;


--
-- Name: user_roles fk_rails_174e058eb3; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_roles
add constraint fk_rails_174e058eb3 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: scantrons fk_rails_1a7e2b01e0; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantrons
add constraint fk_rails_1a7e2b01e0 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_stored_files fk_rails_1cc4562569; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_stored_files
add constraint fk_rails_1cc4562569 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: activity_log_player_contact_phones fk_rails_1d67a3e7f2; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phones
add constraint fk_rails_1d67a3e7f2 foreign key (protocol_id) references ml_app.protocols (id)
;


--
-- Name: config_library_history fk_rails_1ec40f248c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_library_history
add constraint fk_rails_1ec40f248c foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: sub_processes fk_rails_1fc7475261; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_processes
add constraint fk_rails_1fc7475261 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: pro_infos fk_rails_20667815e3; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.pro_infos
add constraint fk_rails_20667815e3 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: item_flag_names fk_rails_22ccfd95e1; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flag_names
add constraint fk_rails_22ccfd95e1 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: player_infos fk_rails_23cd255bc6; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_infos
add constraint fk_rails_23cd255bc6 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_containers fk_rails_2708bd6a94; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
add constraint fk_rails_2708bd6a94 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: nfs_store_downloads fk_rails_272f69e6af; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_downloads
add constraint fk_rails_272f69e6af foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: role_descriptions fk_rails_291bbea3bc; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_descriptions
add constraint fk_rails_291bbea3bc foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: nfs_store_archived_files fk_rails_2b59e23148; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_files
add constraint fk_rails_2b59e23148 foreign key (nfs_store_stored_file_id) references ml_app.nfs_store_stored_files (id)
;


--
-- Name: user_description_history fk_rails_2cf2ce330f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_description_history
add constraint fk_rails_2cf2ce330f foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: model_references fk_rails_2d8072edea; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.model_references
add constraint fk_rails_2d8072edea foreign key (to_record_master_id) references ml_app.masters (id)
;


--
-- Name: activity_log_player_contact_phones fk_rails_2de1cadfad; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phones
add constraint fk_rails_2de1cadfad foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: nfs_store_archived_files fk_rails_2eab578259; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_files
add constraint fk_rails_2eab578259 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_roles fk_rails_318345354e; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_roles
add constraint fk_rails_318345354e foreign key (user_id) references ml_app.users (id)
;


--
-- Name: admin_action_logs fk_rails_3389f178f6; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admin_action_logs
add constraint fk_rails_3389f178f6 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: page_layouts fk_rails_37a2f11066; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layouts
add constraint fk_rails_37a2f11066 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: message_notifications fk_rails_3a3553e146; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_notifications
add constraint fk_rails_3a3553e146 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: nfs_store_uploads fk_rails_3f5167a964; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_uploads
add constraint fk_rails_3f5167a964 foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: trackers fk_rails_447d125f63; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint fk_rails_447d125f63 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: scantrons fk_rails_45205ed085; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantrons
add constraint fk_rails_45205ed085 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: role_description_history fk_rails_47581bba71; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_description_history
add constraint fk_rails_47581bba71 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: trackers fk_rails_47b051d356; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint fk_rails_47b051d356 foreign key (sub_process_id) references ml_app.sub_processes (id)
;


--
-- Name: addresses fk_rails_48c9e0c5a2; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.addresses
add constraint fk_rails_48c9e0c5a2 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: colleges fk_rails_49306e4f49; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.colleges
add constraint fk_rails_49306e4f49 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: model_references fk_rails_4bbf83b940; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.model_references
add constraint fk_rails_4bbf83b940 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: users_contact_infos fk_rails_4decdf690b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.users_contact_infos
add constraint fk_rails_4decdf690b foreign key (user_id) references ml_app.users (id)
;


--
-- Name: message_templates fk_rails_4fe5122ed4; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_templates
add constraint fk_rails_4fe5122ed4 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_uploads fk_rails_4ff6d28f98; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_uploads
add constraint fk_rails_4ff6d28f98 foreign key (nfs_store_stored_file_id) references ml_app.nfs_store_stored_files (id)
;


--
-- Name: exception_logs fk_rails_51ae125c4f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.exception_logs
add constraint fk_rails_51ae125c4f foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: protocol_events fk_rails_564af80fb6; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocol_events
add constraint fk_rails_564af80fb6 foreign key (sub_process_id) references ml_app.sub_processes (id)
;


--
-- Name: user_descriptions fk_rails_5a9926bbe8; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_descriptions
add constraint fk_rails_5a9926bbe8 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: external_identifier_history fk_rails_5b0628cf42; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifier_history
add constraint fk_rails_5b0628cf42 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: activity_log_player_contact_phones fk_rails_5ce1857310; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phones
add constraint fk_rails_5ce1857310 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: trackers fk_rails_623e0ca5ac; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint fk_rails_623e0ca5ac foreign key (protocol_id) references ml_app.protocols (id)
;


--
-- Name: nfs_store_user_file_actions fk_rails_639da31037; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_user_file_actions
add constraint fk_rails_639da31037 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: app_configurations fk_rails_647c63b069; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configurations
add constraint fk_rails_647c63b069 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: nfs_store_containers fk_rails_6a3d7bf39f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
add constraint fk_rails_6a3d7bf39f foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: users fk_rails_6a971dc818; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.users
add constraint fk_rails_6a971dc818 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: protocols fk_rails_6de4fd560d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocols
add constraint fk_rails_6de4fd560d foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: tracker_history fk_rails_6e050927c2; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint fk_rails_6e050927c2 foreign key (tracker_id) references ml_app.trackers (id)
;


--
-- Name: accuracy_scores fk_rails_70c17e88fd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.accuracy_scores
add constraint fk_rails_70c17e88fd foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: external_identifiers fk_rails_7218113eac; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_identifiers
add constraint fk_rails_7218113eac foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: player_contacts fk_rails_72b1afe72f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contacts
add constraint fk_rails_72b1afe72f foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_move_actions fk_rails_75138f1972; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_move_actions
add constraint fk_rails_75138f1972 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_filters fk_rails_776e17eafd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filters
add constraint fk_rails_776e17eafd foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: users_contact_infos fk_rails_7808f5fdb3; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.users_contact_infos
add constraint fk_rails_7808f5fdb3 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: sub_processes fk_rails_7c10a99849; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_processes
add constraint fk_rails_7c10a99849 foreign key (protocol_id) references ml_app.protocols (id)
;


--
-- Name: user_access_controls fk_rails_8108e25f83; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_controls
add constraint fk_rails_8108e25f83 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: tracker_history fk_rails_83aa075398; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint fk_rails_83aa075398 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: user_description_history fk_rails_864938f733; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_description_history
add constraint fk_rails_864938f733 foreign key (user_description_id) references ml_app.user_descriptions (id)
;


--
-- Name: pro_infos fk_rails_86cecb1e36; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.pro_infos
add constraint fk_rails_86cecb1e36 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: config_library_history fk_rails_88664b466b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_library_history
add constraint fk_rails_88664b466b foreign key (config_library_id) references ml_app.config_libraries (id)
;


--
-- Name: app_types fk_rails_8be93bcf4b; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_types
add constraint fk_rails_8be93bcf4b foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: user_description_history fk_rails_8f99de6d81; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_description_history
add constraint fk_rails_8f99de6d81 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: tracker_history fk_rails_9513fd1c35; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint fk_rails_9513fd1c35 foreign key (sub_process_id) references ml_app.sub_processes (id)
;


--
-- Name: sage_assignments fk_rails_971255ec2c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sage_assignments
add constraint fk_rails_971255ec2c foreign key (user_id) references ml_app.users (id)
;


--
-- Name: protocols fk_rails_990daa5f76; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.protocols
add constraint fk_rails_990daa5f76 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: role_description_history fk_rails_9d88430088; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_description_history
add constraint fk_rails_9d88430088 foreign key (role_description_id) references ml_app.role_descriptions (id)
;


--
-- Name: tracker_history fk_rails_9e92bdfe65; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint fk_rails_9e92bdfe65 foreign key (protocol_event_id) references ml_app.protocol_events (id)
;


--
-- Name: tracker_history fk_rails_9f5797d684; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint fk_rails_9f5797d684 foreign key (protocol_id) references ml_app.protocols (id)
;


--
-- Name: addresses fk_rails_a44670b00a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.addresses
add constraint fk_rails_a44670b00a foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: model_references fk_rails_a4eb981c4a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.model_references
add constraint fk_rails_a4eb981c4a foreign key (from_record_master_id) references ml_app.masters (id)
;


--
-- Name: user_preferences fk_rails_a69bfcfd81; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_preferences
add constraint fk_rails_a69bfcfd81 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_history fk_rails_af2f6ffc55; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_history
add constraint fk_rails_af2f6ffc55 foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: activity_log_player_contact_phones fk_rails_b071294797; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.activity_log_player_contact_phones
add constraint fk_rails_b071294797 foreign key (player_contact_id) references ml_app.player_contacts (id)
;


--
-- Name: colleges fk_rails_b0a6220067; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.colleges
add constraint fk_rails_b0a6220067 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: reports fk_rails_b138baacff; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.reports
add constraint fk_rails_b138baacff foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: imports fk_rails_b1e2154c26; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.imports
add constraint fk_rails_b1e2154c26 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_roles fk_rails_b345649dfe; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_roles
add constraint fk_rails_b345649dfe foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: trackers fk_rails_b822840dc1; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint fk_rails_b822840dc1 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: trackers fk_rails_bb6af37155; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint fk_rails_bb6af37155 foreign key (protocol_event_id) references ml_app.protocol_events (id)
;


--
-- Name: imports_model_generators fk_rails_bd9f10d2c7; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.imports_model_generators
add constraint fk_rails_bd9f10d2c7 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_uploads fk_rails_bdb308087e; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_uploads
add constraint fk_rails_bdb308087e foreign key (user_id) references ml_app.users (id)
;


--
-- Name: admins fk_rails_c05d151591; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.admins
add constraint fk_rails_c05d151591 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_move_actions fk_rails_c1ea9a5fd9; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_move_actions
add constraint fk_rails_c1ea9a5fd9 foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: item_flags fk_rails_c2d5bb8930; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flags
add constraint fk_rails_c2d5bb8930 foreign key (item_flag_name_id) references ml_app.item_flag_names (id)
;


--
-- Name: nfs_store_user_file_actions fk_rails_c423dc1802; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_user_file_actions
add constraint fk_rails_c423dc1802 foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: tracker_history fk_rails_c55341c576; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint fk_rails_c55341c576 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: exception_logs fk_rails_c720bf523c; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.exception_logs
add constraint fk_rails_c720bf523c foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_action_logs fk_rails_c94bae872a; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_action_logs
add constraint fk_rails_c94bae872a foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: nfs_store_downloads fk_rails_cd756b42dd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_downloads
add constraint fk_rails_cd756b42dd foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_action_logs fk_rails_cfc9dc539f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_action_logs
add constraint fk_rails_cfc9dc539f foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_descriptions fk_rails_d15f63d454; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_descriptions
add constraint fk_rails_d15f63d454 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: message_notifications fk_rails_d3566ee56d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_notifications
add constraint fk_rails_d3566ee56d foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: player_contacts fk_rails_d3c0ddde90; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.player_contacts
add constraint fk_rails_d3c0ddde90 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: nfs_store_container_history fk_rails_d6593e5c9d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_container_history
add constraint fk_rails_d6593e5c9d foreign key (created_by_user_id) references ml_app.users (id)
;


--
-- Name: config_libraries fk_rails_da3ba4f850; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.config_libraries
add constraint fk_rails_da3ba4f850 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: item_flags fk_rails_dce5169cfd; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.item_flags
add constraint fk_rails_dce5169cfd foreign key (user_id) references ml_app.users (id)
;


--
-- Name: nfs_store_trash_actions fk_rails_de41d50f67; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_trash_actions
add constraint fk_rails_de41d50f67 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: dynamic_models fk_rails_deec8fcb38; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.dynamic_models
add constraint fk_rails_deec8fcb38 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_containers fk_rails_e01d928507; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
add constraint fk_rails_e01d928507 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: sage_assignments fk_rails_e3c559b547; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sage_assignments
add constraint fk_rails_e3c559b547 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: page_layouts fk_rails_e410af4010; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.page_layouts
add constraint fk_rails_e410af4010 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: sage_assignments fk_rails_ebab73db27; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sage_assignments
add constraint fk_rails_ebab73db27 foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: external_links fk_rails_ebf3863277; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.external_links
add constraint fk_rails_ebf3863277 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_archived_files fk_rails_ecfa3cb151; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_archived_files
add constraint fk_rails_ecfa3cb151 foreign key (nfs_store_container_id) references ml_app.nfs_store_containers (id)
;


--
-- Name: nfs_store_containers fk_rails_ee25fc60fa; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_containers
add constraint fk_rails_ee25fc60fa foreign key (created_by_user_id) references ml_app.users (id)
;


--
-- Name: app_configurations fk_rails_f0ac516fff; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.app_configurations
add constraint fk_rails_f0ac516fff foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: nfs_store_filters fk_rails_f547361daa; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.nfs_store_filters
add constraint fk_rails_f547361daa foreign key (app_type_id) references ml_app.app_types (id)
;


--
-- Name: general_selections fk_rails_f62500107f; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.general_selections
add constraint fk_rails_f62500107f foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: role_descriptions fk_rails_f646dbe30d; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.role_descriptions
add constraint fk_rails_f646dbe30d foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: message_notifications fk_rails_fa6dbd15de; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.message_notifications
add constraint fk_rails_fa6dbd15de foreign key (user_id) references ml_app.users (id)
;


--
-- Name: report_history fk_report_history_reports; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.report_history
add constraint fk_report_history_reports foreign key (report_id) references ml_app.reports (id)
;


--
-- Name: scantron_history fk_scantron_history_masters; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantron_history
add constraint fk_scantron_history_masters foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: scantron_history fk_scantron_history_scantrons; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantron_history
add constraint fk_scantron_history_scantrons foreign key (scantron_table_id) references ml_app.scantrons (id)
;


--
-- Name: scantron_history fk_scantron_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.scantron_history
add constraint fk_scantron_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: sub_process_history fk_sub_process_history_sub_processes; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.sub_process_history
add constraint fk_sub_process_history_sub_processes foreign key (sub_process_id) references ml_app.sub_processes (id)
;


--
-- Name: user_access_control_history fk_user_access_control_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_control_history
add constraint fk_user_access_control_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: user_access_control_history fk_user_access_control_history_user_access_controls; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_access_control_history
add constraint fk_user_access_control_history_user_access_controls foreign key (user_access_control_id) references ml_app.user_access_controls (id)
;


--
-- Name: user_authorization_history fk_user_authorization_history_user_authorizations; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_authorization_history
add constraint fk_user_authorization_history_user_authorizations foreign key (user_authorization_id) references ml_app.user_authorizations (id)
;


--
-- Name: user_history fk_user_history_users; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_history
add constraint fk_user_history_users foreign key (user_id) references ml_app.users (id)
;


--
-- Name: user_role_history fk_user_role_history_admins; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_role_history
add constraint fk_user_role_history_admins foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: user_role_history fk_user_role_history_user_roles; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.user_role_history
add constraint fk_user_role_history_user_roles foreign key (user_role_id) references ml_app.user_roles (id)
;


--
-- Name: rc_cis rc_cis_master_id_fkey; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.rc_cis
add constraint rc_cis_master_id_fkey foreign key (master_id) references ml_app.masters (id)
;


--
-- Name: tracker_history unique_master_protocol_tracker_id; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint unique_master_protocol_tracker_id foreign key (master_id, protocol_id, tracker_id) references ml_app.trackers (master_id, protocol_id, id)
;


--
-- Name: trackers valid_protocol_sub_process; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint valid_protocol_sub_process foreign key (protocol_id, sub_process_id) references ml_app.sub_processes (protocol_id, id) match full
;


--
-- Name: tracker_history valid_protocol_sub_process; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint valid_protocol_sub_process foreign key (protocol_id, sub_process_id) references ml_app.sub_processes (protocol_id, id) match full
;


--
-- Name: trackers valid_sub_process_event; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.trackers
add constraint valid_sub_process_event foreign key (sub_process_id, protocol_event_id) references ml_app.protocol_events (sub_process_id, id)
;


--
-- Name: tracker_history valid_sub_process_event; Type: FK CONSTRAINT; Schema: ml_app; Owner: -
--
alter table only ml_app.tracker_history
add constraint valid_sub_process_event foreign key (sub_process_id, protocol_event_id) references ml_app.protocol_events (sub_process_id, id)
;


--
-- Name: datadic_variables fk_rails_029902d3e3; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variables
add constraint fk_rails_029902d3e3 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: datadic_variable_history fk_rails_143e8a7c25; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variable_history
add constraint fk_rails_143e8a7c25 foreign key (equivalent_to_id) references ref_data.datadic_variables (id)
;


--
-- Name: redcap_data_dictionaries fk_rails_16cfa46407; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionaries
add constraint fk_rails_16cfa46407 foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: redcap_data_dictionary_history fk_rails_25f366a78c; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionary_history
add constraint fk_rails_25f366a78c foreign key (redcap_data_dictionary_id) references ref_data.redcap_data_dictionaries (id)
;


--
-- Name: domain_mappings fk_rails_27e301a846; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.domain_mappings
add constraint fk_rails_27e301a846 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: redcap_data_collection_instruments fk_rails_2aa7bf926a; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instruments
add constraint fk_rails_2aa7bf926a foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: redcap_client_requests fk_rails_32285f308d; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_client_requests
add constraint fk_rails_32285f308d foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: datadic_variables fk_rails_34eadb0aee; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variables
add constraint fk_rails_34eadb0aee foreign key (equivalent_to_id) references ref_data.datadic_variables (id)
;


--
-- Name: redcap_project_users fk_rails_38d0954914; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_users
add constraint fk_rails_38d0954914 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: datadic_choice_history fk_rails_42389740a0; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choice_history
add constraint fk_rails_42389740a0 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: redcap_data_dictionaries fk_rails_4766ebe50f; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionaries
add constraint fk_rails_4766ebe50f foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: datadic_variable_history fk_rails_5302a77293; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variable_history
add constraint fk_rails_5302a77293 foreign key (datadic_variable_id) references ref_data.datadic_variables (id)
;


--
-- Name: datadic_choice_history fk_rails_63103b7cf7; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choice_history
add constraint fk_rails_63103b7cf7 foreign key (datadic_choice_id) references ref_data.datadic_choices (id)
;


--
-- Name: datadic_choices fk_rails_67ca4d7e1f; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_choices
add constraint fk_rails_67ca4d7e1f foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: redcap_data_collection_instrument_history fk_rails_6c93846f69; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instrument_history
add constraint fk_rails_6c93846f69 foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: redcap_project_user_history fk_rails_7ba2e90d7d; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_user_history
add constraint fk_rails_7ba2e90d7d foreign key (redcap_project_user_id) references ref_data.redcap_project_users (id)
;


--
-- Name: domain_mapping_history fk_rails_7c6956e2d4; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.domain_mapping_history
add constraint fk_rails_7c6956e2d4 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: redcap_project_user_history fk_rails_89af917107; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_user_history
add constraint fk_rails_89af917107 foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: datadic_variables fk_rails_8dc5a059ee; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variables
add constraint fk_rails_8dc5a059ee foreign key (user_id) references ml_app.users (id)
;


--
-- Name: redcap_data_dictionary_history fk_rails_9a6eca0fe7; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionary_history
add constraint fk_rails_9a6eca0fe7 foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: redcap_project_user_history fk_rails_a0bf0fdddb; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_user_history
add constraint fk_rails_a0bf0fdddb foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: redcap_project_users fk_rails_a6952cc0e8; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_users
add constraint fk_rails_a6952cc0e8 foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: redcap_project_admin_history fk_rails_a7610f4fec; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_project_admin_history
add constraint fk_rails_a7610f4fec foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: redcap_data_collection_instrument_history fk_rails_cb0b57b6c1; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instrument_history
add constraint fk_rails_cb0b57b6c1 foreign key (redcap_project_admin_id) references ref_data.redcap_project_admins (id)
;


--
-- Name: redcap_data_collection_instrument_history fk_rails_ce6075441d; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_collection_instrument_history
add constraint fk_rails_ce6075441d foreign key (redcap_data_collection_instrument_id) references ref_data.redcap_data_collection_instruments (id)
;


--
-- Name: datadic_variable_history fk_rails_d7e89fcbde; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variable_history
add constraint fk_rails_d7e89fcbde foreign key (admin_id) references ml_app.admins (id)
;


--
-- Name: datadic_variable_history fk_rails_ef47f37820; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.datadic_variable_history
add constraint fk_rails_ef47f37820 foreign key (user_id) references ml_app.users (id)
;


--
-- Name: redcap_data_dictionary_history fk_rails_fffede9aa7; Type: FK CONSTRAINT; Schema: ref_data; Owner: -
--
alter table only ref_data.redcap_data_dictionary_history
add constraint fk_rails_fffede9aa7 foreign key (admin_id) references ml_app.admins (id)
;


--
-- PostgreSQL database dump complete
--
set
  search_path to ml_app,
  ref_data
;


insert into
  "schema_migrations" (version)
values
  ('20150602181200'),
  ('20150602181229'),
  ('20150602181400'),
  ('20150602181925'),
  ('20150602205642'),
  ('20150603135202'),
  ('20150603153758'),
  ('20150603170429'),
  ('20150604160659'),
  ('20150609140033'),
  ('20150609150931'),
  ('20150609160545'),
  ('20150609161656'),
  ('20150609185229'),
  ('20150609185749'),
  ('20150609190556'),
  ('20150610142403'),
  ('20150610143629'),
  ('20150610155810'),
  ('20150610160257'),
  ('20150610183502'),
  ('20150610220253'),
  ('20150610220320'),
  ('20150610220451'),
  ('20150611144834'),
  ('20150611145259'),
  ('20150611180303'),
  ('20150611202453'),
  ('20150616202753'),
  ('20150616202829'),
  ('20150618143506'),
  ('20150618161857'),
  ('20150618161945'),
  ('20150619165405'),
  ('20150622144725'),
  ('20150623191520'),
  ('20150623194212'),
  ('20150625213040'),
  ('20150626190344'),
  ('20150629210656'),
  ('20150630202829'),
  ('20150702200308'),
  ('20150707142702'),
  ('20150707143233'),
  ('20150707150524'),
  ('20150707150615'),
  ('20150707150921'),
  ('20150707151004'),
  ('20150707151010'),
  ('20150707151032'),
  ('20150707151129'),
  ('20150707153720'),
  ('20150707222630'),
  ('20150710135307'),
  ('20150710135959'),
  ('20150710160209'),
  ('20150710160215'),
  ('20150715181110'),
  ('20150720141845'),
  ('20150720173900'),
  ('20150720175827'),
  ('20150721204937'),
  ('20150724165441'),
  ('20150727164955'),
  ('20150728133359'),
  ('20150728203820'),
  ('20150728213254'),
  ('20150728213551'),
  ('20150729182424'),
  ('20150730174055'),
  ('20150730181206'),
  ('20150730202422'),
  ('20150803181029'),
  ('20150803194546'),
  ('20150803194551'),
  ('20150804160523'),
  ('20150804203710'),
  ('20150805132950'),
  ('20150805161302'),
  ('20150805200932'),
  ('20150811174323'),
  ('20150812194032'),
  ('20150820151214'),
  ('20150820151728'),
  ('20150820152721'),
  ('20150820155555'),
  ('20150826145029'),
  ('20150826145125'),
  ('20150924163412'),
  ('20150924183936'),
  ('20151005143945'),
  ('20151009191559'),
  ('20151013191910'),
  ('20151015142035'),
  ('20151015150733'),
  ('20151015183136'),
  ('20151016160248'),
  ('20151019203248'),
  ('20151019204910'),
  ('20151020145339'),
  ('20151021162145'),
  ('20151021171534'),
  ('20151022142507'),
  ('20151022191658'),
  ('20151023171217'),
  ('20151026181305'),
  ('20151028145802'),
  ('20151028155426'),
  ('20151109223309'),
  ('20151120150828'),
  ('20151120151912'),
  ('20151123203524'),
  ('20151124151501'),
  ('20151125192206'),
  ('20151202180745'),
  ('20151208144918'),
  ('20151208200918'),
  ('20151208200919'),
  ('20151208200920'),
  ('20151208244916'),
  ('20151208244917'),
  ('20151208244918'),
  ('20151216102328'),
  ('20151218203119'),
  ('20160210200918'),
  ('20160210200919'),
  ('20170823145313'),
  ('20170901152707'),
  ('20170908074038'),
  ('20170922182052'),
  ('20170926144234'),
  ('20171002120537'),
  ('20171013141835'),
  ('20171013141837'),
  ('20171025095942'),
  ('20171031145807'),
  ('20171207163040'),
  ('20171207170748'),
  ('20180119173411'),
  ('20180123111956'),
  ('20180123154108'),
  ('20180126120818'),
  ('20180206173516'),
  ('20180209145336'),
  ('20180209152723'),
  ('20180209152747'),
  ('20180209171641'),
  ('20180228145731'),
  ('20180301114206'),
  ('20180302144109'),
  ('20180313091440'),
  ('20180319133539'),
  ('20180319133540'),
  ('20180319175721'),
  ('20180320105954'),
  ('20180320113757'),
  ('20180320154951'),
  ('20180320183512'),
  ('20180321082612'),
  ('20180321095805'),
  ('20180404150536'),
  ('20180405141059'),
  ('20180416145033'),
  ('20180426091838'),
  ('20180502082334'),
  ('20180504080300'),
  ('20180531091440'),
  ('20180723165621'),
  ('20180725140502'),
  ('20180814142112'),
  ('20180814142559'),
  ('20180814142560'),
  ('20180814142561'),
  ('20180814142562'),
  ('20180814142924'),
  ('20180814180843'),
  ('20180815104221'),
  ('20180817114138'),
  ('20180817114157'),
  ('20180818133205'),
  ('20180821123717'),
  ('20180822085118'),
  ('20180822093147'),
  ('20180830144523'),
  ('20180831132605'),
  ('20180911153518'),
  ('20180913142103'),
  ('20180924153547'),
  ('20181002142656'),
  ('20181002165822'),
  ('20181003182428'),
  ('20181004113953'),
  ('20181008104204'),
  ('20181030185123'),
  ('20181108115216'),
  ('20181113143210'),
  ('20181113143327'),
  ('20181113150331'),
  ('20181113150713'),
  ('20181113152652'),
  ('20181113154525'),
  ('20181113154855'),
  ('20181113154920'),
  ('20181113154942'),
  ('20181113165948'),
  ('20181113170144'),
  ('20181113172429'),
  ('20181113175031'),
  ('20181113180608'),
  ('20181113183446'),
  ('20181113184022'),
  ('20181113184516'),
  ('20181113184920'),
  ('20181113185315'),
  ('20181205103333'),
  ('20181206123849'),
  ('20181220131156'),
  ('20181220160047'),
  ('20190130152053'),
  ('20190130152208'),
  ('20190131130024'),
  ('20190201160559'),
  ('20190201160606'),
  ('20190225094021'),
  ('20190226165932'),
  ('20190226165938'),
  ('20190226173917'),
  ('20190312160404'),
  ('20190312163119'),
  ('20190416181222'),
  ('20190502142561'),
  ('20190517135351'),
  ('20190523115611'),
  ('20190528152006'),
  ('20190612140618'),
  ('20190614162317'),
  ('20190624082535'),
  ('20190628131713'),
  ('20190709174613'),
  ('20190709174638'),
  ('20190711074003'),
  ('20190711084434'),
  ('20190902123518'),
  ('20190906172361'),
  ('20191115124723'),
  ('20191115124732'),
  ('20200313160640'),
  ('20200403172361'),
  ('20200611123849'),
  ('20200723153130'),
  ('20200727081305'),
  ('20200727081306'),
  ('20200727122116'),
  ('20200727122117'),
  ('20200731121100'),
  ('20200731121144'),
  ('20200731122147'),
  ('20200731124515'),
  ('20201109114833'),
  ('20201111160935'),
  ('20201111161035'),
  ('20201111164800'),
  ('20201111165107'),
  ('20201111165109'),
  ('20201111165110'),
  ('20201112163129'),
  ('20210108085826'),
  ('20210110191022'),
  ('20210110191023'),
  ('20210110191024'),
  ('20210110191026'),
  ('20210110191028'),
  ('20210110191029'),
  ('20210110191030'),
  ('20210110191031'),
  ('20210110191033'),
  ('20210124185731'),
  ('20210124185733'),
  ('20210124185959'),
  ('20210124190000'),
  ('20210124190034'),
  ('20210124190035'),
  ('20210124190150'),
  ('20210124190152'),
  ('20210124190153'),
  ('20210124190155'),
  ('20210124190905'),
  ('20210124190907'),
  ('20210124190908'),
  ('20210124190909'),
  ('20210124190911'),
  ('20210124190912'),
  ('20210128180947'),
  ('20210129150044'),
  ('20210129154600'),
  ('20210201124324'),
  ('20210204205746'),
  ('20210209095546'),
  ('20210209154901'),
  ('20210215153201'),
  ('20210216132458'),
  ('20210216133011'),
  ('20210303164631'),
  ('20210303164632'),
  ('20210305113828'),
  ('20210308143952'),
  ('20210312143952'),
  ('20210318150132'),
  ('20210318150446'),
  ('20210330085617'),
  ('20210406154800'),
  ('20210428102016'),
  ('20210526183942'),
  ('20210712152134'),
  ('20210809151207'),
  ('20210816170804'),
  ('20211020183551'),
  ('20211031152538'),
  ('20211031183210'),
  ('20211031183429'),
  ('20211041105001'),
  ('20211115141001'),
  ('20211117180701'),
  ('20211124120038'),
  ('20211126152918'),
  ('20211206102025'),
  ('20211206102026'),
  ('20211206102028'),
  ('20211206102030'),
  ('20211206102244'),
  ('20211206102249'),
  ('20211206160502'),
  ('20211220122834'),
  ('20211220122835'),
  ('20211220122837'),
  ('20211220122840'),
  ('20211220123345'),
  ('20211220123347'),
  ('20211220123348'),
  ('20211220123518'),
  ('20211220123519'),
  ('20211220124525'),
  ('20211220124527'),
  ('20211220124611'),
  ('20211220124612'),
  ('20211220125302'),
  ('20211220125303'),
  ('20211220125327'),
  ('20211220125329'),
  ('20211220125410'),
  ('20211220125411'),
  ('20211220125452'),
  ('20211220125454'),
  ('20211220125821'),
  ('20211220125823'),
  ('20211220130316'),
  ('20211220130318'),
  ('20211220130532'),
  ('20211220130534'),
  ('20211220130655'),
  ('20211220130656'),
  ('20211220130659'),
  ('20211222111016'),
  ('20211222111721'),
  ('20211222134557'),
  ('20211222134602'),
  ('20211222135634'),
  ('20211222135957'),
  ('20211222140008'),
  ('20211222140019'),
  ('20211231113457'),
  ('20220121143719'),
  ('20220131111232'),
  ('20220131121830'),
  ('20220131121831'),
  ('20220131121833'),
  ('20220131121834'),
  ('20220131121835'),
  ('20220131123017'),
  ('20220131123100'),
  ('20220131131244'),
  ('20220131132533'),
  ('20220131135242'),
  ('20220131135349'),
  ('20220131135547'),
  ('20220131135600'),
  ('20220131140353'),
  ('20220131140521'),
  ('20220131143324'),
  ('20220131155227'),
  ('20220131155229'),
  ('20220131171632'),
  ('20220131172554'),
  ('20220131172618'),
  ('20220131182607'),
  ('20220131184011'),
  ('20220131184041'),
  ('20220131184511'),
  ('20220201102247'),
  ('20220201102549'),
  ('20220201173928'),
  ('20220201174829'),
  ('20220202175848'),
  ('20220202190849'),
  ('20220202190931'),
  ('20220202193750'),
  ('20220203193018'),
  ('20220203201903'),
  ('20220214120443'),
  ('20220214122255'),
  ('20220214124934'),
  ('20220214125216'),
  ('20220214125928'),
  ('20220214130001'),
  ('20220214140459'),
  ('20220214154149'),
  ('20220216145207'),
  ('20220217092246'),
  ('20220217144044'),
  ('20220218171203'),
  ('20220218171455'),
  ('20220221101714'),
  ('20220221102030'),
  ('20220221113950'),
  ('20220221120737'),
  ('20220221123203'),
  ('20220222112229'),
  ('20220222112301'),
  ('20220223113931'),
  ('20220223113932'),
  ('20220223113934'),
  ('20220223114443'),
  ('20220223114445'),
  ('20220223114447'),
  ('20220223114848'),
  ('20220223114849'),
  ('20220223114851'),
  ('20220223114919'),
  ('20220223114920'),
  ('20220223114922'),
  ('20220223115250'),
  ('20220223115252'),
  ('20220223115253'),
  ('20220223120331'),
  ('20220223120333'),
  ('20220223120335'),
  ('20220223121351'),
  ('20220223121353'),
  ('20220223121355'),
  ('20220223121713'),
  ('20220223121714'),
  ('20220223121716'),
  ('20220224020931'),
  ('20220224023446'),
  ('20220224114432'),
  ('20220224115009'),
  ('20220224135435'),
  ('20220224135635'),
  ('20220224141444'),
  ('20220224143222'),
  ('20220225122155'),
  ('20220301093010'),
  ('20220301093041'),
  ('20220301093304'),
  ('20220301120158'),
  ('20220301120734'),
  ('20220301120755'),
  ('20220301201512'),
  ('20220303112202'),
  ('20220304115603'),
  ('20220304115824'),
  ('20220304115826'),
  ('20220304115827'),
  ('20220304115830'),
  ('20220304115836'),
  ('20220304115838'),
  ('20220304115839'),
  ('20220304115841'),
  ('20220304120359'),
  ('20220304120401'),
  ('20220304120404'),
  ('20220304120557'),
  ('20220304120558'),
  ('20220304120600'),
  ('20220304120602'),
  ('20220304120604'),
  ('20220304120605'),
  ('20220307144639'),
  ('20220307153310'),
  ('20220307154248'),
  ('20220307162856'),
  ('20220307162929'),
  ('20220307163124'),
  ('20220307164817'),
  ('20220307164959'),
  ('20220324133938'),
  ('20220324133940'),
  ('20220324133941'),
  ('20220324133943'),
  ('20220324133945'),
  ('20220324133946'),
  ('20220324133948'),
  ('20220324133949'),
  ('20220324133951'),
  ('20220324133952'),
  ('20220324133953'),
  ('20220328115603'),
  ('20220329113632'),
  ('20220329113634'),
  ('20220329113635'),
  ('20220329113637'),
  ('20220329113640'),
  ('20220329113641'),
  ('20220329113642'),
  ('20220329130557'),
  ('20220329181503'),
  ('20220330105313'),
  ('20220330105858'),
  ('20220331110656'),
  ('20220331110717'),
  ('20220331110820'),
  ('20220421190539'),
  ('20220421190541'),
  ('20220421190542'),
  ('20220421190544'),
  ('20220421190545'),
  ('20220421190547'),
  ('20220421190549'),
  ('20220421190550'),
  ('20220421190552'),
  ('20220421190553'),
  ('20220421190555'),
  ('20220421190556'),
  ('20220421190557'),
  ('20220421203328'),
  ('20220422170048'),
  ('20220422170050'),
  ('20220422170051'),
  ('20220422170418'),
  ('20220422170420'),
  ('20220422170421'),
  ('20220422170446'),
  ('20220422170448'),
  ('20220422170449'),
  ('20220422170830'),
  ('20220422170832'),
  ('20220422170833'),
  ('20220422170919'),
  ('20220422170920'),
  ('20220422170922'),
  ('20220422171039'),
  ('20220422171041'),
  ('20220422171042'),
  ('20220422172000'),
  ('20220422172002'),
  ('20220422172003'),
  ('20220422172155'),
  ('20220422172157'),
  ('20220422172158'),
  ('20220422172305'),
  ('20220422172307'),
  ('20220422172308'),
  ('20220422172839'),
  ('20220422172841'),
  ('20220422172842'),
  ('20220422173038'),
  ('20220422173040'),
  ('20220422173041'),
  ('20220422173147'),
  ('20220422173149'),
  ('20220422173150'),
  ('20220422173153'),
  ('20220422173710'),
  ('20220422173712'),
  ('20220422173713'),
  ('20220422173857'),
  ('20220422173859'),
  ('20220422173900'),
  ('20220422173902'),
  ('20220422173904'),
  ('20220422173905'),
  ('20220422173907'),
  ('20220422173908'),
  ('20220422180358'),
  ('20220422180430'),
  ('20220422180453'),
  ('20220422180936'),
  ('20220422181037'),
  ('20220426181659'),
  ('20220427144604'),
  ('20220427144732'),
  ('20220429142550'),
  ('20220429142651'),
  ('20220503171647'),
  ('20220503172002'),
  ('20220503172112'),
  ('20220503172331'),
  ('20220503172418'),
  ('20220503172607'),
  ('20220503172620'),
  ('20220503172651'),
  ('20220503172714'),
  ('20220505095408'),
  ('20220509163510'),
  ('20220510103824'),
  ('20220510104245'),
  ('20220510104418'),
  ('20220510104623'),
  ('20220510104958'),
  ('20220510105005'),
  ('20220510105350'),
  ('20220510105624'),
  ('20220510105625'),
  ('20220510111800'),
  ('20220510111823'),
  ('20220510115936'),
  ('20220510120159'),
  ('20220510120548'),
  ('20220510134118'),
  ('20220510134159'),
  ('20220511181927'),
  ('20220511182044'),
  ('20220512131102'),
  ('20220512143846'),
  ('20220512143859'),
  ('20220512144040'),
  ('20220512144126'),
  ('20220512144303'),
  ('20220512144337'),
  ('20220512145418'),
  ('20220512145552'),
  ('20220512145818'),
  ('20220512145831'),
  ('20220512150022'),
  ('20220512150119'),
  ('20220512150230'),
  ('20220512184859'),
  ('20220512185002'),
  ('20220512191330'),
  ('20220512191711'),
  ('20220512192613'),
  ('20220512192730'),
  ('20220512192833'),
  ('20220512193005'),
  ('20220512193108'),
  ('20220512193213'),
  ('20220512193318'),
  ('20220512194008'),
  ('20220512194228'),
  ('20220512194359'),
  ('20220512194457'),
  ('20220512194611'),
  ('20220512194744'),
  ('20220512194926'),
  ('20220516092942'),
  ('20220516100849'),
  ('20220516113651'),
  ('20220516113940'),
  ('20220516122435'),
  ('20220516122623'),
  ('20220516122849'),
  ('20220516123101'),
  ('20220516123415'),
  ('20220516123459'),
  ('20220516123628'),
  ('20220517122146'),
  ('20220517122239'),
  ('20220517142648'),
  ('20220517142650'),
  ('20220517142651'),
  ('20220517142654'),
  ('20220517142655'),
  ('20220517142657'),
  ('20220517142851'),
  ('20220517142853'),
  ('20220517142854'),
  ('20220517142857'),
  ('20220517142858'),
  ('20220517142900'),
  ('20220517142902'),
  ('20220517142903'),
  ('20220517142904'),
  ('20220517143044'),
  ('20220517143124'),
  ('20220517144705'),
  ('20220517150044'),
  ('20220519170301'),
  ('20220524105006'),
  ('20220524105008'),
  ('20220524105009'),
  ('20220524105012'),
  ('20220524105013'),
  ('20220524105015'),
  ('20220524105017'),
  ('20220524105018'),
  ('20220526172521'),
  ('20220526172550'),
  ('20220526173106'),
  ('20220526173112'),
  ('20220526173244'),
  ('20220526181804'),
  ('20220526182143'),
  ('20220531121546'),
  ('20220601180701'),
  ('20220621090729'),
  ('20220621090731'),
  ('20220621090732'),
  ('20220621090734'),
  ('20220621090737'),
  ('20220621090739'),
  ('20220621091859'),
  ('20220621091900'),
  ('20220621091902'),
  ('20220621205650'),
  ('20220621205651'),
  ('20220621210030'),
  ('20220621210031'),
  ('20220621210654'),
  ('20220621210656'),
  ('20220621210923'),
  ('20220621210924'),
  ('20220621212005'),
  ('20220621212007'),
  ('20220621212454'),
  ('20220621212456'),
  ('20220621212457'),
  ('20220621212459'),
  ('20220621212500'),
  ('20220621212502'),
  ('20220621212503'),
  ('20220621212504'),
  ('20220621212506'),
  ('20220621212507'),
  ('20220621212509'),
  ('20220621212510'),
  ('20220621212626'),
  ('20220621212628'),
  ('20220621212630'),
  ('20220621212631'),
  ('20220621212632'),
  ('20220621212634'),
  ('20220621212635'),
  ('20220621212636'),
  ('20220621212638'),
  ('20220621212639'),
  ('20220621212641'),
  ('20220621212642'),
  ('20220621212644'),
  ('20220621212645'),
  ('20220621212646'),
  ('20220621212648'),
  ('20220621212650'),
  ('20220621212747'),
  ('20220621212749'),
  ('20220621212751'),
  ('20220621212752'),
  ('20220621212753'),
  ('20220621212755'),
  ('20220621212756'),
  ('20220621212757'),
  ('20220621212759'),
  ('20220621212800'),
  ('20220621212802'),
  ('20220621212803'),
  ('20220621212805'),
  ('20220621212806'),
  ('20220621212807'),
  ('20220621212810'),
  ('20220621212811'),
  ('20220621212812'),
  ('20220621212814'),
  ('20220622095513'),
  ('20220622095644'),
  ('20220624132515'),
  ('20220624150128'),
  ('20220624150155'),
  ('20220627154143'),
  ('20220627154145'),
  ('20220627154146'),
  ('20220627154148'),
  ('20220627154149'),
  ('20220627154150'),
  ('20220627154152'),
  ('20220627154153'),
  ('20220627154155'),
  ('20220627154156'),
  ('20220627154158'),
  ('20220627154159'),
  ('20220627154200'),
  ('20220627154202'),
  ('20220627154203'),
  ('20220627154206'),
  ('20220627154207'),
  ('20220627154327'),
  ('20220627154329'),
  ('20220627154330'),
  ('20220627154331'),
  ('20220627154333'),
  ('20220627154334'),
  ('20220627154335'),
  ('20220627154337'),
  ('20220627154338'),
  ('20220627154340'),
  ('20220627154341'),
  ('20220627154343'),
  ('20220627154344'),
  ('20220627154345'),
  ('20220627154347'),
  ('20220627154349'),
  ('20220627154350'),
  ('20220630082801'),
  ('20220704183420'),
  ('20220704183422'),
  ('20220704183424'),
  ('20220704183425'),
  ('20220704183426'),
  ('20220704183428'),
  ('20220704183429'),
  ('20220704183430'),
  ('20220704183432'),
  ('20220704183433'),
  ('20220704183435'),
  ('20220704183436'),
  ('20220704183437'),
  ('20220704183439'),
  ('20220704183440'),
  ('20220704183443'),
  ('20220704183444'),
  ('20220824102025'),
  ('20220824190346'),
  ('20220915144411'),
  ('20220915144413'),
  ('20220915144414'),
  ('20220915144415'),
  ('20220915144417'),
  ('20220915144418'),
  ('20220915144419'),
  ('20220915144421'),
  ('20220915144422'),
  ('20220915144424'),
  ('20220915144426'),
  ('20220915144428'),
  ('20220915144429'),
  ('20220915144430'),
  ('20220915144432'),
  ('20220915144434'),
  ('20220915144436'),
  ('20220915144444'),
  ('20220915144445'),
  ('20220916105116'),
  ('20220916105118'),
  ('20220916105119'),
  ('20220916105121'),
  ('20220916105122'),
  ('20220916105123'),
  ('20220916105125'),
  ('20220916105126'),
  ('20220916105128'),
  ('20220916105129'),
  ('20220916105131'),
  ('20220916105132'),
  ('20220916105133'),
  ('20220916105135'),
  ('20220916105137'),
  ('20220916105143'),
  ('20220916105149'),
  ('20220916105150'),
  ('20221031174109'),
  ('20221110101203'),
  ('20221110101411'),
  ('20221110101647'),
  ('20221110102412'),
  ('20221110102414'),
  ('20221110102415'),
  ('20221110102417'),
  ('20221110102419'),
  ('20221110102421'),
  ('20221110102422'),
  ('20221110102424'),
  ('20221110102426'),
  ('20221110102437'),
  ('20221110102438'),
  ('20221110102439'),
  ('20221110102441'),
  ('20221110102442'),
  ('20221110102443'),
  ('20221110102445'),
  ('20221110102446'),
  ('20221110102447'),
  ('20221110102819'),
  ('20221110102820'),
  ('20221110102822'),
  ('20221110102823'),
  ('20221110102826'),
  ('20221110102827'),
  ('20221110102830'),
  ('20221110102833'),
  ('20221110102834'),
  ('20221110103050'),
  ('20221110103052'),
  ('20221110103054'),
  ('20221110103055'),
  ('20221110103058'),
  ('20221110103059'),
  ('20221110103101'),
  ('20230104133814'),
  ('20230117115913'),
  ('20230209153019'),
  ('20230309104811'),
  ('20230309104813'),
  ('20230309104814'),
  ('20230309104817'),
  ('20230309104819'),
  ('20230309104820'),
  ('20230309104822'),
  ('20230309104824'),
  ('20230309104825'),
  ('20230309104827'),
  ('20230309104828'),
  ('20230309104829'),
  ('20230309104831'),
  ('20230309104832'),
  ('20230309105041'),
  ('20230309105042'),
  ('20230309105044'),
  ('20230309105047'),
  ('20230309105048'),
  ('20230309105050'),
  ('20230309105053'),
  ('20230309105055'),
  ('20230309105056'),
  ('20230309105057'),
  ('20230309105059'),
  ('20230309105100'),
  ('20230309105449'),
  ('20230309105450'),
  ('20230309105452'),
  ('20230309105455'),
  ('20230309105456'),
  ('20230309105457'),
  ('20230309105459'),
  ('20230309105941'),
  ('20230309105942'),
  ('20230309105943'),
  ('20230309105946'),
  ('20230309105948'),
  ('20230309105949'),
  ('20230309110022'),
  ('20230309110024'),
  ('20230309110025'),
  ('20230309110028'),
  ('20230309110029'),
  ('20230309110031'),
  ('20230309110157'),
  ('20230309110159'),
  ('20230309110200'),
  ('20230309110203'),
  ('20230309110205'),
  ('20230309110206'),
  ('20230309110556'),
  ('20230309110557'),
  ('20230309110559'),
  ('20230309110602'),
  ('20230309110603'),
  ('20230309110605'),
  ('20230309110609'),
  ('20230309110610'),
  ('20230309110612'),
  ('20230309111233'),
  ('20230309111234'),
  ('20230309111236'),
  ('20230309111239'),
  ('20230309111240'),
  ('20230309111400'),
  ('20230309111401'),
  ('20230309111403'),
  ('20230309111406'),
  ('20230309111407'),
  ('20230309111436'),
  ('20230309111437'),
  ('20230309111439'),
  ('20230309111442'),
  ('20230309111443'),
  ('20230309111447'),
  ('20230309111449'),
  ('20230309111450'),
  ('20230309111658'),
  ('20230309111724'),
  ('20230309111816'),
  ('20230420125603'),
  ('20230420125634'),
  ('20230420125603'),
  ('20230329123743'),
  ('20230329122758'),
  ('20230329111230'),
  ('20230329110438'),
  ('20230328175853'),
  ('20230328175817'),
  ('20230328175745'),
  ('20230328175220'),
  ('20230328174140'),
  ('20230328173855'),
  ('20230328172219'),
  ('20230328170404'),
  ('20230328165113'),
  ('20230328165040'),
  ('20230214164921'),
  ('20230213184027'),
  ('20230209153019'),
  ('20230117115926'),
  ('20230117115924'),
  ('20230117115922'),
  ('20230117115921'),
  ('20230117115919'),
  ('20230117115918'),
  ('20230117115916'),
  ('20230117115915'),
  ('20230117115913'),
  ('20230109160157'),
  ('20230109155918'),
  ('20230105145316'),
  ('20230105145314'),
  ('20230105145312'),
  ('20230105145310'),
  ('20230105145308'),
  ('20230104141902'),
  ('20230104133814'),
  ('20230104133255'),
  ('20230103170551'),
  ('20230103170549'),
  ('20230103170548'),
  ('20230103170546'),
  ('20230103170545'),
  ('20230103170544'),
  ('20230103170542'),
  ('20221130095920'),
  ('20221130095916'),
  ('20221130095450'),
  ('20221130095449'),
  ('20221130095445'),
  ('20221130095444'),
  ('20221110102419'),
  ('20221013111911'),
  ('20221013111909'),
  ('20221013111908'),
  ('20221013111907'),
  ('20221013111905'),
  ('20221013111904'),
  ('20221013111902'),
  ('20221013111901'),
  ('20221013111859'),
  ('20221013111858'),
  ('20221013111857'),
  ('20221013111855'),
  ('20221013111848'),
  ('20221006143131'),
  ('20221006142524'),
  ('20221006120829'),
  ('20221006120646'),
  ('20221006120346'),
  ('20221006120020'),
  ('20221006115741'),
  ('20221006115707'),
  ('20221006115502'),
  ('20221006115409'),
  ('20221006115325'),
  ('20221006112017'),
  ('20221006111937'),
  ('20221006110807'),
  ('20220916105125'),
  ('20220916105123'),
  ('20220916105122'),
  ('20220916105121'),
  ('20220916105119'),
  ('20220915144421'),
  ('20220915144419'),
  ('20220915144418'),
  ('20220915144417'),
  ('20220915144415'),
  ('20220915144414'),
  ('20220902111938'),
  ('20220902103048'),
  ('20220902103000'),
  ('20220902102732'),
  ('20220704183429'),
  ('20220704183428'),
  ('20220704183426'),
  ('20220704183425'),
  ('20220704183424'),
  ('20220627154335'),
  ('20220627154334'),
  ('20220627154333'),
  ('20220627154331'),
  ('20220627154330'),
  ('20220627154152'),
  ('20220627154150'),
  ('20220627154149'),
  ('20220627154148'),
  ('20220627154146'),
  ('20220624150155'),
  ('20220624150128'),
  ('20220624132515'),
  ('20220621212811'),
  ('20220621212756'),
  ('20220621212755'),
  ('20220621212753'),
  ('20220621212752'),
  ('20220621212751'),
  ('20220621212635'),
  ('20220621212634'),
  ('20220621212632'),
  ('20220621212631'),
  ('20220621212630'),
  ('20220621212503'),
  ('20220621212502'),
  ('20220621212500'),
  ('20220621212459'),
  ('20220621212457'),
  ('20220613152058'),
  ('20220613152056'),
  ('20220613152055'),
  ('20220613095536'),
  ('20220613095535'),
  ('20220613095534'),
  ('20220613095532'),
  ('20220613095531'),
  ('20220607175510'),
  ('20220607172657'),
  ('20220607172410'),
  ('20220607172136'),
  ('20220607171859'),
  ('20220607171857'),
  ('20220607171856'),
  ('20220607171143'),
  ('20220607171141'),
  ('20220607171140'),
  ('20220607171105'),
  ('20220607171104'),
  ('20220607171102'),
  ('20220607171012'),
  ('20220607170746'),
  ('20220607170744'),
  ('20220607170743'),
  ('20220607170741'),
  ('20220607170739'),
  ('20220602124746'),
  ('20220602124208'),
  ('20220602124206'),
  ('20220602124205'),
  ('20220602124203'),
  ('20220602124201'),
  ('20220602124145'),
  ('20220602124037'),
  ('20220602123829'),
  ('20220602122558'),
  ('20220602121405'),
  ('20220602112348'),
  ('20220602112346'),
  ('20220602111347'),
  ('20220602111344'),
  ('20220531121546'),
  ('20220519170259'),
  ('20220505095408'),
  ('20220421190552'),
  ('20220421190549'),
  ('20220421190542'),
  ('20220421190541'),
  ('20220420155908'),
  ('20220420155825'),
  ('20220420155752'),
  ('20220420155719'),
  ('20220420155546'),
  ('20220420155110'),
  ('20220324133943'),
  ('20220309140421'),
  ('20220307154248'),
  ('20220304115836'),
  ('20220301201512'),
  ('20220224143222'),
  ('20220224141444'),
  ('20220224135635'),
  ('20220224135435'),
  ('20220224115009'),
  ('20220224114432'),
  ('20220224023446'),
  ('20220224020931'),
  ('20220223154144'),
  ('20220223154138'),
  ('20220223154137'),
  ('20220223154135'),
  ('20220208183044'),
  ('20220208182910'),
  ('20220208182855'),
  ('20220202190931'),
  ('20220202190849'),
  ('20220202175848'),
  ('20220201102549'),
  ('20220201102247'),
  ('20220131184511'),
  ('20220131184041'),
  ('20220131184011'),
  ('20220131182607'),
  ('20220131172618'),
  ('20220131172554'),
  ('20220131171632'),
  ('20220131155229'),
  ('20220131155227'),
  ('20220131143324'),
  ('20220131140521'),
  ('20220131140353'),
  ('20220131135600'),
  ('20220131135547'),
  ('20220131135349'),
  ('20220131135242'),
  ('20220131132533'),
  ('20220131131244'),
  ('20220131123100'),
  ('20220131123017'),
  ('20220131121834'),
  ('20220131121833'),
  ('20220131121831'),
  ('20220131121830'),
  ('20220131111232'),
  ('20220128173739'),
  ('20220121143719'),
  ('20211231113457'),
  ('20211222140019'),
  ('20211222140008'),
  ('20211222135957'),
  ('20211222135634'),
  ('20211222134602'),
  ('20211222134557'),
  ('20211222111721'),
  ('20211222111016'),
  ('20211216181406'),
  ('20211210161534'),
  ('20211202172811'),
  ('20211202165754'),
  ('20211202104939'),
  ('20211202104628'),
  ('20211202104124'),
  ('20211202104105'),
  ('20211202104021'),
  ('20211202103557'),
  ('20211202094341'),
  ('20211201193110'),
  ('20211201191903'),
  ('20211201175056'),
  ('20211201162930'),
  ('20211201162822'),
  ('20211201162807'),
  ('20211201162655'),
  ('20211201160012'),
  ('20211201155927'),
  ('20211201155810'),
  ('20211201155632'),
  ('20211201155608'),
  ('20211201155327'),
  ('20211201155258'),
  ('20211201154230'),
  ('20211201153732'),
  ('20211130170043'),
  ('20211130165832'),
  ('20211129185048'),
  ('20211129184710'),
  ('20211129184654'),
  ('20211129183005'),
  ('20211129174514'),
  ('20211129174409'),
  ('20211129152611'),
  ('20211126152918'),
  ('20211124163246'),
  ('20211124143306'),
  ('20211124142532'),
  ('20211124141547'),
  ('20211124141512'),
  ('20211124135213'),
  ('20211124120038'),
  ('20211122210402'),
  ('20211122204834'),
  ('20211122202618'),
  ('20211122190158'),
  ('20211122190108'),
  ('20211122184842'),
  ('20211122162529'),
  ('20211122162402'),
  ('20211122154939'),
  ('20211122154543'),
  ('20211122151922'),
  ('20211122131219'),
  ('20211122130620'),
  ('20211119145821'),
  ('20211119145801'),
  ('20211118082753'),
  ('20211117180701'),
  ('20211117152250'),
  ('20211117124809'),
  ('20211117123100'),
  ('20211115152200'),
  ('20211115144103'),
  ('20211115143116'),
  ('20211115141001'),
  ('20211104105531'),
  ('20211104105307'),
  ('20211101165235'),
  ('20211101164222'),
  ('20211041105001'),
  ('20211031152538'),
  ('20211028200607'),
  ('20211028195929'),
  ('20211028195631'),
  ('20211028195545'),
  ('20211028190129'),
  ('20211028185104'),
  ('20211028185013'),
  ('20211028184708'),
  ('20211028184606'),
  ('20211028183655'),
  ('20211028183605'),
  ('20211028183352'),
  ('20211028183307'),
  ('20211028183052'),
  ('20211028183011'),
  ('20211028182620'),
  ('20211028182535'),
  ('20211028181343'),
  ('20211028181038'),
  ('20211028181009'),
  ('20211028180910'),
  ('20211028161448'),
  ('20211028160643'),
  ('20211028160454'),
  ('20211027191521'),
  ('20211027190244'),
  ('20211027184654'),
  ('20211025142128'),
  ('20211025131706'),
  ('20211025130455'),
  ('20211025130333'),
  ('20211025124250'),
  ('20211020180413'),
  ('20211020175455'),
  ('20211020172435'),
  ('20211020122426'),
  ('20211020122312'),
  ('20211020122203'),
  ('20211020121904'),
  ('20211020121731'),
  ('20211019160522'),
  ('20211019154822'),
  ('20211019154648'),
  ('20211019154403'),
  ('20211019153138'),
  ('20211019145359'),
  ('20211019144612'),
  ('20211019142850'),
  ('20211019142128'),
  ('20211013193651'),
  ('20211013192724'),
  ('20211013192451'),
  ('20211011130407'),
  ('20211011130405'),
  ('20211011123319'),
  ('20211011123318'),
  ('20211011123317'),
  ('20211011123315'),
  ('20211011123314'),
  ('20211011122908'),
  ('20211005162513'),
  ('20211005162512'),
  ('20211005162206'),
  ('20211005161717'),
  ('20211005161515'),
  ('20211005100000'),
  ('20210920165012'),
  ('20210920154843'),
  ('20210920154842'),
  ('20210920154841'),
  ('20210920154840'),
  ('20210920154838'),
  ('20210920154257'),
  ('20210920154255'),
  ('20210820162714'),
  ('20210820120501'),
  ('20210820120428'),
  ('20210820120358'),
  ('20210820120329'),
  ('20210820120259'),
  ('20210820120230'),
  ('20210820120200'),
  ('20210820115844'),
  ('20210820115817'),
  ('20210820115748'),
  ('20210820115720'),
  ('20210820115651'),
  ('20210820115621'),
  ('20210820112537'),
  ('20210820112511'),
  ('20210820112444'),
  ('20210820112417'),
  ('20210820112351'),
  ('20210820112324'),
  ('20210820111602'),
  ('20210820111536'),
  ('20210820111510'),
  ('20210820111444'),
  ('20210820111417'),
  ('20210820111341'),
  ('20210819172712'),
  ('20210819162924'),
  ('20210819145830'),
  ('20210819142214'),
  ('20210819121250'),
  ('20210819112959'),
  ('20210816170804'),
  ('20210810141801'),
  ('20210809151207'),
  ('20210804122847'),
  ('20210804115317'),
  ('20210804115107'),
  ('20210804114825'),
  ('20210804114625'),
  ('20210804113928'),
  ('20210804111741'),
  ('20210802113737'),
  ('20210802113037'),
  ('20210802112713'),
  ('20210730094243'),
  ('20210730094241'),
  ('20210730094240'),
  ('20210730094239'),
  ('20210730094238'),
  ('20210729121748'),
  ('20210729120034'),
  ('20210729115538'),
  ('20210712152134'),
  ('20210526183942'),
  ('20210511160335'),
  ('20210511160109'),
  ('20210511155831'),
  ('20210511155830'),
  ('20210511155828'),
  ('20210511154334'),
  ('20210511154017'),
  ('20210511154015'),
  ('20210507141445'),
  ('20210507140526'),
  ('20210507140002'),
  ('20210506093638'),
  ('20210505154246'),
  ('20210505153500'),
  ('20210505152307'),
  ('20210505151544'),
  ('20210505141004'),
  ('20210430161544'),
  ('20210430150839'),
  ('20210428191045'),
  ('20210428102016'),
  ('20210426160527'),
  ('20210426160502'),
  ('20210426111533'),
  ('20210426111529'),
  ('20210426110031'),
  ('20210426110029'),
  ('20210426105809'),
  ('20210426105232'),
  ('20210426105231'),
  ('20210426105230'),
  ('20210426105229'),
  ('20210426105227'),
  ('20210426105226'),
  ('20210419123853'),
  ('20210419104252'),
  ('20210419103700'),
  ('20210419103623'),
  ('20210416124846'),
  ('20210416124230'),
  ('20210416122418'),
  ('20210416115820'),
  ('20210416115129'),
  ('20210416114628'),
  ('20210415171455'),
  ('20210415153255'),
  ('20210415135520'),
  ('20210414192323'),
  ('20210414192103'),
  ('20210414192034'),
  ('20210414170935'),
  ('20210414170005'),
  ('20210409154754'),
  ('20210409154247'),
  ('20210409153417'),
  ('20210409153403'),
  ('20210409153002'),
  ('20210409151245'),
  ('20210409151227'),
  ('20210409151142'),
  ('20210409121507'),
  ('20210409121417'),
  ('20210409121215'),
  ('20210409121129'),
  ('20210409111740'),
  ('20210408191723'),
  ('20210408185624'),
  ('20210408185527'),
  ('20210408185512'),
  ('20210408184539'),
  ('20210408184517'),
  ('20210408184456'),
  ('20210408182932'),
  ('20210408182740'),
  ('20210408175134'),
  ('20210408174853'),
  ('20210408174528'),
  ('20210408172909'),
  ('20210408145937'),
  ('20210408145914'),
  ('20210408142308'),
  ('20210407112018'),
  ('20210406154800'),
  ('20210330085617'),
  ('20210318150446'),
  ('20210318150132'),
  ('20210312161907'),
  ('20210312143952'),
  ('20210311173439'),
  ('20210309175437'),
  ('20210309145849'),
  ('20210309141058'),
  ('20210309134840'),
  ('20210309132550'),
  ('20210309130529'),
  ('20210309121304'),
  ('20210309121011'),
  ('20210308143952'),
  ('20210305113828'),
  ('20210303185633'),
  ('20210303185434'),
  ('20210303164632'),
  ('20210303164631'),
  ('20210303114347'),
  ('20210219164832'),
  ('20210219154518'),
  ('20210219115851'),
  ('20210219110031'),
  ('20210219110030'),
  ('20210219102128'),
  ('20210218155345'),
  ('20210218115904'),
  ('20210216133011'),
  ('20210216132458'),
  ('20210215153201'),
  ('20210209154901'),
  ('20210209095546'),
  ('20210204205746'),
  ('20210201124324'),
  ('20210129154600'),
  ('20210129150044'),
  ('20210128180947'),
  ('20210122163753'),
  ('20210118175202'),
  ('20210118175201'),
  ('20210113190726'),
  ('20210112140918'),
  ('20210112093953'),
  ('20210111193953'),
  ('20210111193758'),
  ('20210111193757'),
  ('20210111193126'),
  ('20210111185241'),
  ('20210108085826'),
  ('20210106120035'),
  ('20210106115442'),
  ('20210105153826'),
  ('20201214120823'),
  ('20201211173803'),
  ('20201203173231'),
  ('20201202152550'),
  ('20201201135335'),
  ('20201201123431'),
  ('20201130181726'),
  ('20201130181506'),
  ('20201130171046'),
  ('20201130164615'),
  ('20201130155629'),
  ('20201130151146'),
  ('20201130145415'),
  ('20201123164901'),
  ('20201123133436'),
  ('20201123132802'),
  ('20201120172435'),
  ('20201120172431'),
  ('20201120172430'),
  ('20201120172427'),
  ('20201120172425'),
  ('20201120172424'),
  ('20201120172423'),
  ('20201120172422'),
  ('20201120172421'),
  ('20201120172419'),
  ('20201120172418'),
  ('20201120172417'),
  ('20201120172416'),
  ('20201120172411'),
  ('20201120172326'),
  ('20201120172051'),
  ('20201120172049'),
  ('20201120172047'),
  ('20201120172045'),
  ('20201120171657'),
  ('20201120171655'),
  ('20201120171654'),
  ('20201120113633'),
  ('20201120113632'),
  ('20201120113630'),
  ('20201120113629'),
  ('20201120113628'),
  ('20201120113627'),
  ('20201120113625'),
  ('20201120113624'),
  ('20201120113623'),
  ('20201120113622'),
  ('20201120113620'),
  ('20201120113619'),
  ('20201120113618'),
  ('20201120113617'),
  ('20201120113616'),
  ('20201120113614'),
  ('20201120113613'),
  ('20201120113612'),
  ('20201120113611'),
  ('20201120113610'),
  ('20201120113608'),
  ('20201120113607'),
  ('20201120113606'),
  ('20201120113605'),
  ('20201120113604'),
  ('20201120113602'),
  ('20201120113601'),
  ('20201120113600'),
  ('20201120113559'),
  ('20201120113558'),
  ('20201120113556'),
  ('20201120113555'),
  ('20201120113554'),
  ('20201120113553'),
  ('20201120113552'),
  ('20201120113550'),
  ('20201120113549'),
  ('20201120113548'),
  ('20201120113547'),
  ('20201120113545'),
  ('20201120113544'),
  ('20201120113543'),
  ('20201120113542'),
  ('20201120113541'),
  ('20201120113539'),
  ('20201120113538'),
  ('20201120113537'),
  ('20201120113536'),
  ('20201120113534'),
  ('20201120113533'),
  ('20201120113532'),
  ('20201120113531'),
  ('20201120113530'),
  ('20201120113528'),
  ('20201120113527'),
  ('20201120113526'),
  ('20201120113525'),
  ('20201120113523'),
  ('20201120113522'),
  ('20201120113521'),
  ('20201120113520'),
  ('20201120113518'),
  ('20201120113517'),
  ('20201120113516'),
  ('20201120113515'),
  ('20201120113513'),
  ('20201120113512'),
  ('20201120010636'),
  ('20201120005728'),
  ('20201120005727'),
  ('20201120005724'),
  ('20201120005722'),
  ('20201120005147'),
  ('20201120005146'),
  ('20201120005144'),
  ('20201120005143'),
  ('20201120005142'),
  ('20201120005141'),
  ('20201120005139'),
  ('20201120005138'),
  ('20201120005137'),
  ('20201120005136'),
  ('20201120005134'),
  ('20201120005132'),
  ('20201120004525'),
  ('20201120004524'),
  ('20201120004523'),
  ('20201120004521'),
  ('20201120004520'),
  ('20201120004519'),
  ('20201120004517'),
  ('20201120004516'),
  ('20201120004515'),
  ('20201120004514'),
  ('20201120004511'),
  ('20201120004509'),
  ('20201120004508'),
  ('20201120004507'),
  ('20201120004506'),
  ('20201120004504'),
  ('20201120004503'),
  ('20201120004502'),
  ('20201120004500'),
  ('20201120004459'),
  ('20201120004458'),
  ('20201120004457'),
  ('20201120004455'),
  ('20201120004454'),
  ('20201120004453'),
  ('20201120004452'),
  ('20201120004450'),
  ('20201120004449'),
  ('20201120004448'),
  ('20201120004446'),
  ('20201120004445'),
  ('20201120004444'),
  ('20201120004443'),
  ('20201120004442'),
  ('20201120004440'),
  ('20201120004439'),
  ('20201120004438'),
  ('20201120004437'),
  ('20201120004435'),
  ('20201120004433'),
  ('20201120004432'),
  ('20201120004431'),
  ('20201120004429'),
  ('20201120004428'),
  ('20201120004427'),
  ('20201120004426'),
  ('20201120004424'),
  ('20201120004423'),
  ('20201120004422'),
  ('20201120004420'),
  ('20201120004417'),
  ('20201120004416'),
  ('20201120004415'),
  ('20201120004413'),
  ('20201120004412'),
  ('20201120004411'),
  ('20201120004410'),
  ('20201120004408'),
  ('20201120004407'),
  ('20201120004406'),
  ('20201120004402'),
  ('20201120004401'),
  ('20201120004359'),
  ('20201120004358'),
  ('20201120004357'),
  ('20201120004356'),
  ('20201120004354'),
  ('20201120004353'),
  ('20201120004352'),
  ('20201120004351'),
  ('20201120004347'),
  ('20201120004346'),
  ('20201120004345'),
  ('20201120004343'),
  ('20201120004342'),
  ('20201120004341'),
  ('20201120004339'),
  ('20201120004338'),
  ('20201120004337'),
  ('20201120004335'),
  ('20201120004334'),
  ('20201120004331'),
  ('20201120004330'),
  ('20201120004328'),
  ('20201120004327'),
  ('20201120004326'),
  ('20201120004325'),
  ('20201120004323'),
  ('20201120004322'),
  ('20201120004321'),
  ('20201120004320'),
  ('20201120004315'),
  ('20201120004314'),
  ('20201120004312'),
  ('20201120004311'),
  ('20201120004310'),
  ('20201120004309'),
  ('20201120004307'),
  ('20201120004306'),
  ('20201120004305'),
  ('20201120004303'),
  ('20201120003633'),
  ('20201120003506'),
  ('20201120003505'),
  ('20201120002824'),
  ('20201120002618'),
  ('20201120002617'),
  ('20201120002615'),
  ('20201120002614'),
  ('20201120002613'),
  ('20201120002612'),
  ('20201120002608'),
  ('20201120002607'),
  ('20201120002606'),
  ('20201120002604'),
  ('20201120002603'),
  ('20201120002602'),
  ('20201120002601'),
  ('20201120002559'),
  ('20201120002557'),
  ('20201120002556'),
  ('20201120002555'),
  ('20201120002554'),
  ('20201120001433'),
  ('20201120001432'),
  ('20201120001430'),
  ('20201120001429'),
  ('20201120001428'),
  ('20201120001427'),
  ('20201120001426'),
  ('20201120001424'),
  ('20201120001423'),
  ('20201120000241'),
  ('20201119231649'),
  ('20201119221358'),
  ('20201119215607'),
  ('20201119215606'),
  ('20201119215605'),
  ('20201119215603'),
  ('20201119215602'),
  ('20201119215601'),
  ('20201119215559'),
  ('20201119215558'),
  ('20201119215557'),
  ('20201119215514'),
  ('20201119215513'),
  ('20201119215511'),
  ('20201119215510'),
  ('20201119215509'),
  ('20201119215508'),
  ('20201119215506'),
  ('20201119215505'),
  ('20201119215504'),
  ('20201119214817'),
  ('20201119214815'),
  ('20201119214814'),
  ('20201119214813'),
  ('20201119214812'),
  ('20201119214810'),
  ('20201119214809'),
  ('20201119214808'),
  ('20201119214806'),
  ('20201119214158'),
  ('20201119214156'),
  ('20201119214155'),
  ('20201119214154'),
  ('20201119214153'),
  ('20201119214151'),
  ('20201119214150'),
  ('20201119214149'),
  ('20201119214147'),
  ('20201119214105'),
  ('20201119214104'),
  ('20201119214102'),
  ('20201119214101'),
  ('20201119214100'),
  ('20201119214058'),
  ('20201119214057'),
  ('20201119214056'),
  ('20201119214054'),
  ('20201119213857'),
  ('20201119213856'),
  ('20201119213854'),
  ('20201119213849'),
  ('20201119213848'),
  ('20201119213846'),
  ('20201119213845'),
  ('20201119213843'),
  ('20201119213842'),
  ('20201119213841'),
  ('20201119213840'),
  ('20201119213838'),
  ('20201119213837'),
  ('20201119213836'),
  ('20201119213834'),
  ('20201119213833'),
  ('20201119213831'),
  ('20201119213829'),
  ('20201119213545'),
  ('20201119213105'),
  ('20201119212412'),
  ('20201119212054'),
  ('20201119211755'),
  ('20201119211642'),
  ('20201119211641'),
  ('20201119211640'),
  ('20201119211638'),
  ('20201119210104'),
  ('20201119210103'),
  ('20201119210102'),
  ('20201119210100'),
  ('20201119210059'),
  ('20201119210058'),
  ('20201119210056'),
  ('20201119210055'),
  ('20201119210054'),
  ('20201119210052'),
  ('20201119205546'),
  ('20201119205143'),
  ('20201119205016'),
  ('20201119204519'),
  ('20201119204518'),
  ('20201119204516'),
  ('20201119204515'),
  ('20201119204513'),
  ('20201119204512'),
  ('20201119141450'),
  ('20201119141134'),
  ('20201119140723'),
  ('20201119135239'),
  ('20201119135029'),
  ('20201119134745'),
  ('20201119134520'),
  ('20201119134404'),
  ('20201119131230'),
  ('20201119125920'),
  ('20201119122415'),
  ('20201119121523'),
  ('20201119121416'),
  ('20201119121123'),
  ('20201119120645'),
  ('20201119120521'),
  ('20201119120343'),
  ('20201119115023'),
  ('20201119114712'),
  ('20201119114239'),
  ('20201119113826'),
  ('20201119112211'),
  ('20201119112112'),
  ('20201119111628'),
  ('20201119111307'),
  ('20201119111111'),
  ('20201119111037'),
  ('20201119110159'),
  ('20201119110031'),
  ('20201119105629'),
  ('20201119105147'),
  ('20201119105115'),
  ('20201119104716'),
  ('20201119104640'),
  ('20201119103930'),
  ('20201119103527'),
  ('20201119103256'),
  ('20201119103206'),
  ('20201119103040'),
  ('20201119102915'),
  ('20201118185845'),
  ('20201118185134'),
  ('20201118184632'),
  ('20201118184421'),
  ('20201118184036'),
  ('20201118183451'),
  ('20201118183218'),
  ('20201118183050'),
  ('20201118182925'),
  ('20201118182833'),
  ('20201118180407'),
  ('20201118171823'),
  ('20201118171743'),
  ('20201118171355'),
  ('20201118170705'),
  ('20201118165559'),
  ('20201118164706'),
  ('20201118164209'),
  ('20201118162434'),
  ('20201117172114'),
  ('20201117165758'),
  ('20201116184553'),
  ('20201116181212'),
  ('20201116165843'),
  ('20201116165724'),
  ('20201116165548'),
  ('20201116165236'),
  ('20201116160721'),
  ('20201113171433'),
  ('20201113171138'),
  ('20201113165946'),
  ('20201113165938'),
  ('20201113165919'),
  ('20201113165911'),
  ('20201113165842'),
  ('20201113165754'),
  ('20201113165558'),
  ('20201113165116'),
  ('20201113160651'),
  ('20201113154338'),
  ('20201113153931'),
  ('20201113153724'),
  ('20201113153421'),
  ('20201113153255'),
  ('20201113153220'),
  ('20201113153051'),
  ('20201113150359'),
  ('20201113134431'),
  ('20201113134328'),
  ('20201113131147'),
  ('20201113122021'),
  ('20201113114812'),
  ('20201112190055'),
  ('20201112190054'),
  ('20201112190053'),
  ('20201112163129'),
  ('20201112141132'),
  ('20201112112019'),
  ('20201111161035'),
  ('20201111160935'),
  ('20201109190307'),
  ('20201109181444'),
  ('20201109180117'),
  ('20201109114833'),
  ('20201014172505'),
  ('20201009172744'),
  ('20201009172508'),
  ('20201009172107'),
  ('20201009171508'),
  ('20201009171251'),
  ('20201009170927'),
  ('20201009170614'),
  ('20201009165247'),
  ('20201009152535'),
  ('20201009123016'),
  ('20201009113556'),
  ('20201009113555'),
  ('20201009113553'),
  ('20201009113552'),
  ('20201009113551'),
  ('20201009113549'),
  ('20201009113548'),
  ('20201009113547'),
  ('20201009113546'),
  ('20201009113544'),
  ('20201001120642'),
  ('20200929165700'),
  ('20200929163440'),
  ('20200924121742'),
  ('20200924100402'),
  ('20200923103106'),
  ('20200921185531'),
  ('20200921184426'),
  ('20200921184247'),
  ('20200921173450'),
  ('20200921172540'),
  ('20200921110750'),
  ('20200917113300'),
  ('20200914163936'),
  ('20200914163633'),
  ('20200914143300'),
  ('20200914102627'),
  ('20200914102206'),
  ('20200914101758'),
  ('20200914101207'),
  ('20200914095348'),
  ('20200911174444'),
  ('20200911173337'),
  ('20200911172935'),
  ('20200911165448'),
  ('20200911145939'),
  ('20200911144023'),
  ('20200911143100'),
  ('20200911143042'),
  ('20200911142536'),
  ('20200911140600'),
  ('20200911140450'),
  ('20200911135706'),
  ('20200911135516'),
  ('20200911135514'),
  ('20200911135428'),
  ('20200911135257'),
  ('20200911134749'),
  ('20200911134413'),
  ('20200911134327'),
  ('20200911134237'),
  ('20200911134009'),
  ('20200911133749'),
  ('20200911133450'),
  ('20200911133300'),
  ('20200911133203'),
  ('20200911133043'),
  ('20200911132926'),
  ('20200911132442'),
  ('20200911132315'),
  ('20200911132124'),
  ('20200911131905'),
  ('20200911131637'),
  ('20200911131636'),
  ('20200911131634'),
  ('20200911131633'),
  ('20200911131631'),
  ('20200911131556'),
  ('20200911131317'),
  ('20200911131246'),
  ('20200911131237'),
  ('20200911123056'),
  ('20200911123055'),
  ('20200911123053'),
  ('20200911123052'),
  ('20200821114133'),
  ('20200818143559'),
  ('20200818140236'),
  ('20200818135756'),
  ('20200818132644'),
  ('20200818125452'),
  ('20200818124658'),
  ('20200818105216'),
  ('20200818105202'),
  ('20200818090628'),
  ('20200817152630'),
  ('20200814114646'),
  ('20200814105415'),
  ('20200814104336'),
  ('20200814103248'),
  ('20200814092900'),
  ('20200814092726'),
  ('20200813162728'),
  ('20200812180924'),
  ('20200812180350'),
  ('20200812175807'),
  ('20200812130051'),
  ('20200804150142'),
  ('20200804145940'),
  ('20200804145635'),
  ('20200804144545'),
  ('20200804125517'),
  ('20200804125500'),
  ('20200803162444'),
  ('20200803161100'),
  ('20200731130750'),
  ('20200731124908'),
  ('20200731124515'),
  ('20200731122147'),
  ('20200731121144'),
  ('20200731121100'),
  ('20200730130051'),
  ('20200730124512'),
  ('20200729193941'),
  ('20200727162041'),
  ('20200727122117'),
  ('20200727122116'),
  ('20200727111100'),
  ('20200727111057'),
  ('20200727111056'),
  ('20200727100543'),
  ('20200727100431'),
  ('20200727100429'),
  ('20200727081306'),
  ('20200727081305'),
  ('20200724181747'),
  ('20200724153400'),
  ('20200723153130'),
  ('20200723104100'),
  ('20200720161100'),
  ('20200720161000'),
  ('20200720121356'),
  ('20200720110000'),
  ('20200720100000'),
  ('20200611123849'),
  ('20200403172361'),
  ('20200313160640'),
  ('20200225115151'),
  ('20191115124732'),
  ('20191115124723'),
  ('20190906172361'),
  ('20190902123518'),
  ('20190711084434'),
  ('20190711074003'),
  ('20190709174638'),
  ('20190709174613'),
  ('20190628131713'),
  ('20190625142421'),
  ('20190624082535'),
  ('20190614162317'),
  ('20190612140618'),
  ('20190528152006'),
  ('20190523115611'),
  ('20190517135351'),
  ('20190502142561'),
  ('20190416181222'),
  ('20190312163119'),
  ('20190312160404'),
  ('20190226173917'),
  ('20190226165938'),
  ('20190226165932'),
  ('20190225094021'),
  ('20190201160606'),
  ('20190201160559'),
  ('20190131130024'),
  ('20190130152208'),
  ('20190130152053'),
  ('20181220160047'),
  ('20181220131156'),
  ('20181206123849'),
  ('20181205103333'),
  ('20181113185315'),
  ('20181113184920'),
  ('20181113184516'),
  ('20181113184022'),
  ('20181113183446'),
  ('20181113180608'),
  ('20181113175031'),
  ('20181113172429'),
  ('20181113170144'),
  ('20181113165948'),
  ('20181113154942'),
  ('20181113154920'),
  ('20181113154855'),
  ('20181113154525'),
  ('20181113152652'),
  ('20181113150713'),
  ('20181113150331'),
  ('20181113143327'),
  ('20181113143210'),
  ('20181108115216'),
  ('20181030185123'),
  ('20181008104204'),
  ('20181004113953'),
  ('20181003182428'),
  ('20181002165822'),
  ('20181002142656'),
  ('20180924153547'),
  ('20180913142103'),
  ('20180911153518'),
  ('20180831132605'),
  ('20180830144523'),
  ('20180822093147'),
  ('20180822085118'),
  ('20180821123717'),
  ('20180818133205'),
  ('20180817114157'),
  ('20180817114138'),
  ('20180815104221'),
  ('20180814180843'),
  ('20180814142924'),
  ('20180814142562'),
  ('20180814142561'),
  ('20180814142560'),
  ('20180814142559'),
  ('20180814142112'),
  ('20180725140502'),
  ('20180723165621'),
  ('20180531091440'),
  ('20180504080300'),
  ('20180502082334'),
  ('20180426091838'),
  ('20180416145033'),
  ('20180405141059'),
  ('20180404150536'),
  ('20180321095805'),
  ('20180321082612'),
  ('20180320183512'),
  ('20180320154951'),
  ('20180320113757'),
  ('20180320105954'),
  ('20180319175721'),
  ('20180319133540'),
  ('20180319133539'),
  ('20180313091440'),
  ('20180302144109'),
  ('20180301114206'),
  ('20180228145731'),
  ('20180209171641'),
  ('20180209152747'),
  ('20180209152723'),
  ('20180209145336'),
  ('20180206173516'),
  ('20180126120818'),
  ('20180123154108'),
  ('20180123111956'),
  ('20180119173411'),
  ('20171207170748'),
  ('20171207163040'),
  ('20171031145807'),
  ('20171025095942'),
  ('20171013141837'),
  ('20171013141835'),
  ('20171002120537'),
  ('20170926144234'),
  ('20170922182052'),
  ('20170908074038'),
  ('20170901152707'),
  ('20170830105123'),
  ('20170830100037'),
  ('20170823145313'),
  ('20160210200919'),
  ('20160210200918'),
  ('20160204120512'),
  ('20160203211330'),
  ('20160203151737'),
  ('20160203130714'),
  ('20160203121701'),
  ('20160203120436'),
  ('20151218203119'),
  ('20151216102328'),
  ('20151215170733'),
  ('20151215165127'),
  ('20151208244918'),
  ('20151208244917'),
  ('20151208244916'),
  ('20151208200920'),
  ('20151208200919'),
  ('20151208200918'),
  ('20151208144918'),
  ('20151202180745'),
  ('20151125192206'),
  ('20151124151501'),
  ('20151123203524'),
  ('20151120151912'),
  ('20151120150828'),
  ('20151109223309'),
  ('20151028155426'),
  ('20151028145802'),
  ('20151026181305'),
  ('20151023171217'),
  ('20151022191658'),
  ('20151022142507'),
  ('20151021171534'),
  ('20151021162145'),
  ('20151020145339'),
  ('20151019204910'),
  ('20151019203248'),
  ('20151016160248'),
  ('20151015183136'),
  ('20151015150733'),
  ('20151015142035'),
  ('20151013191910'),
  ('20151009191559'),
  ('20151005143945'),
  ('20150924183936'),
  ('20150924163412'),
  ('20150826145125'),
  ('20150826145029'),
  ('20150820155555'),
  ('20150820152721'),
  ('20150820151728'),
  ('20150820151214'),
  ('20150812194032'),
  ('20150811174323'),
  ('20150805200932'),
  ('20150805161302'),
  ('20150805132950'),
  ('20150804203710'),
  ('20150804160523'),
  ('20150803194551'),
  ('20150803194546'),
  ('20150803181029'),
  ('20150730202422'),
  ('20150730181206'),
  ('20150730174055'),
  ('20150729182424'),
  ('20150728213551'),
  ('20150728213254'),
  ('20150728203820'),
  ('20150728133359'),
  ('20150727164955'),
  ('20150724165441'),
  ('20150721204937'),
  ('20150720175827'),
  ('20150720173900'),
  ('20150720141845'),
  ('20150715181110'),
  ('20150710160215'),
  ('20150710160209'),
  ('20150710135959'),
  ('20150710135307'),
  ('20150707222630'),
  ('20150707153720'),
  ('20150707151129'),
  ('20150707151032'),
  ('20150707151010'),
  ('20150707151004'),
  ('20150707150921'),
  ('20150707150615'),
  ('20150707150524'),
  ('20150707143233'),
  ('20150707142702'),
  ('20150702200308'),
  ('20150630202829'),
  ('20150629210656'),
  ('20150626190344'),
  ('20150625213040'),
  ('20150623194212'),
  ('20150623191520'),
  ('20150622144725'),
  ('20150619165405'),
  ('20150618161945'),
  ('20150618161857'),
  ('20150618143506'),
  ('20150616202829'),
  ('20150616202753'),
  ('20150611202453'),
  ('20150611180303'),
  ('20150611145259'),
  ('20150611144834'),
  ('20150610220451'),
  ('20150610220320'),
  ('20150610220253'),
  ('20150610183502'),
  ('20150610160257'),
  ('20150610155810'),
  ('20150610143629'),
  ('20150610142403'),
  ('20150609190556'),
  ('20150609185749'),
  ('20150609185229'),
  ('20150609161656'),
  ('20150609160545'),
  ('20150609150931'),
  ('20150609140033'),
  ('20150604160659'),
  ('20150603170429'),
  ('20150603153758'),
  ('20150603135202'),
  ('20150602205642'),
  ('20150602181925'),
  ('20150602181400'),
  ('20150602181229'),
  ('20150602181200')
;