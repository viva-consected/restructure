# frozen_string_literal: true

module Redcap
  module DataDictionaries
    #
    # Categorical selection choices for a field
    class BranchingLogic
      attr_accessor :condition_string, :orig_condition_string, :vars, :literals, :blocks, :operators, :comps, :numbers,
                    :block_hash

      def self.clean_string(str)
        str.gsub("[\n\s]+", ' ').strip
      end

      def self.get_token_num(tok, str)
        str.match(/%%#{tok}([0-9]+)%%/)[0].to_i
      end

      #
      # Initialize a new branching logic condition, with optional *condition_string*
      # @param [<Type>] condition_string <description>
      def initialize(condition_string = nil)
        reset_scan

        self.condition_string = condition_string.dup
        self.orig_condition_string = condition_string.dup
      end

      def reset_scan
        self.vars = []
        self.literals = []
        self.numbers = []
        self.blocks = []
        self.operators = []
        self.comps = []
        self.block_hash = {}
      end

      def clean_condition_string
        self.class.clean_string condition_string
      end

      def tokenize_vars
        pos = 0

        re = /\[([a-zA-Z0-9_]+)\]/
        condition_string.scan(re).each do |match|
          vars << match[0]
          condition_string.sub!(re, "%%VAR#{pos}%%")
          pos += 1
        end

        re = /\[([a-zA-Z0-9_]+)\(([0-9+])\)\]/
        # checkbox choice varname abc(1) -> abc___1
        condition_string.scan(re).each do |match|
          vars << match.join('___')
          condition_string.sub!(re, "%%VAR#{pos}%%")
          pos += 1
        end

        self.condition_string = condition_string
      end

      def tokenize_literals
        pos = 0

        re = /"([^"]+?)"|'([^']+?)'/
        condition_string.scan(re).each do |match|
          literals << match.compact[0]
          condition_string.sub!(re, "%%LIT#{pos}%%")
          pos += 1
        end

        pos = 0
        re = /([^A-Z])(-?[0-9]+)/
        condition_string.scan(re).each do |match|
          str = match[1]
          num = if str.include?('.')
                  str.to_f
                else
                  str.to_i
                end
          numbers << num
          condition_string.sub!(re, "#{match[0]}%%NUM#{pos}%%")
          pos += 1
        end
      end

      def tokenize_operators
        pos = 0

        re = /\s(or|and|OR|AND)\s/
        condition_string.scan(re).each do |match|
          operators << match[0]
          condition_string.sub!(re, " %%OP#{pos}%% ")
          pos += 1
        end
      end

      def tokenize_comps
        pos = 0

        re = /\s?(<=|>=|<>|<|>|=)\s?/
        condition_string.scan(re).each do |match|
          comps << match[0]
          condition_string.sub!(re, " %%COMP#{pos}%% ")
          pos += 1
        end
      end

      def tokenize_blocks
        pos ||= 0
        got = -1
        self.condition_string = clean_condition_string

        until got == 0
          got = 0
          re = /\(([^()]+)\)/
          condition_string.scan(re).each do |match|
            blocks << match[0]
            condition_string.sub!(re, "%%BLOCK#{pos}%%")
            pos += 1
            got += 1
          end
        end
      end

      def hash_of_blocks
        tokenize_vars
        tokenize_literals
        tokenize_operators
        tokenize_comps
        tokenize_blocks

        block_num = 0
        blocks.each do |block|
          block = block.dup
          re = /(.+) (%%OP[0-9]+%%) (.+)/
          prev_op = nil
          sub_hash = {}
          block.scan(re).each do |match|
            opstr = match[1]
            num = self.class.get_token_num('OP', opstr)
            op = ops[num]

            if op != prev_op
              all_any = if op.downcase == 'or'
                          'any'
                        else
                          'all'
                        end
              sub_hash["#{all_any}_#{block_num}"] = [match[0], match[2]]
            end

            block_num += 1
          end
        end
      end
    end
  end
end
