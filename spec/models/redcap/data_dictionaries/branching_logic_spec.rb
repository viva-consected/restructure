# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Redcap::DataDictionaries::BranchingLogic', type: :model do
  include ModelSupport
  include Redcap::RedcapSupport

  describe 'simple conversion to show_if structure' do
    it 'converts variables to real field names' do
      test = <<~ENDSTR.strip
        [test_var] = "0"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%% = "0"
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var']

      test = <<~ENDSTR.strip
        [yesno(1)] = "1"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%% = "1"
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['yesno___1']

      test = <<~ENDSTR.strip
        [some_var]='sadf' and [yesno(1)] = "1"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%%='sadf' and %%VAR1%% = "1"
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      expect(@bl.vars).to eq ['some_var', 'yesno___1']

      expect(@bl.condition_string).to eq exp
    end

    it 'tokenizes literals' do
      test = <<~ENDSTR.strip
        [yesno(1)] = "1"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%% = %%LIT0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['yesno___1']
      expect(@bl.literals).to eq ['1']
      expect(@bl.numbers).to eq []

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> 'some "value"')
      ENDSTR

      exp = <<~ENDSTR.strip
        (%%VAR1%% = %%LIT0%% and %%VAR0%% <> %%LIT1%%)
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)
      @bl.tokenize_vars

      @bl.tokenize_literals

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'yesno___1']
      expect(@bl.literals).to eq ['1', 'some "value"']
      expect(@bl.numbers).to eq []

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some (other) 'value'") or [ants] > 10
      ENDSTR

      exp = <<~ENDSTR.strip
        (%%VAR2%% = %%LIT0%% and %%VAR0%% <> %%LIT1%%) or %%VAR1%% > %%NUM0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars

      @bl.tokenize_literals

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'ants', 'yesno___1']
      expect(@bl.literals).to eq ['1', "some (other) 'value'"]
      expect(@bl.numbers).to eq [10]
    end

    it 'tokenizes operators' do
      test = <<~ENDSTR.strip
        [yesno(1)] = "1"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%% = %%LIT0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['yesno___1']
      expect(@bl.literals).to eq ['1']
      expect(@bl.operators).to eq []

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some value")
      ENDSTR

      exp = <<~ENDSTR.strip
        (%%VAR1%% = %%LIT0%% %%OP0%% %%VAR0%% <> %%LIT1%%)
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'yesno___1']
      expect(@bl.literals).to eq ['1', 'some value']
      expect(@bl.operators).to eq ['and']

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some (other) 'value'") or [ants] = 'many'
      ENDSTR

      exp = <<~ENDSTR.strip
        (%%VAR2%% = %%LIT0%% %%OP0%% %%VAR0%% <> %%LIT1%%) %%OP1%% %%VAR1%% = %%LIT2%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'ants', 'yesno___1']
      expect(@bl.literals).to eq ['1', "some (other) 'value'", 'many']
      expect(@bl.operators).to eq ['and', 'or']
    end

    it 'tokenizes comparisons' do
      test = <<~ENDSTR.strip
        [yesno(1)] = "1"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%% %%COMP0%% %%LIT0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['yesno___1']
      expect(@bl.literals).to eq ['1']
      expect(@bl.operators).to eq []
      expect(@bl.comps).to eq ['=']

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some value")
      ENDSTR

      exp = <<~ENDSTR.strip
        (%%VAR1%% %%COMP0%% %%LIT0%% %%OP0%% %%VAR0%% %%COMP1%% %%LIT1%%)
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'yesno___1']
      expect(@bl.literals).to eq ['1', 'some value']
      expect(@bl.operators).to eq ['and']
      expect(@bl.comps).to eq ['=', '<>']

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some (other) 'value'") or [ants] > 10
      ENDSTR

      exp = <<~ENDSTR.strip
        (%%VAR2%% %%COMP0%% %%LIT0%% %%OP0%% %%VAR0%% %%COMP1%% %%LIT1%%) %%OP1%% %%VAR1%% %%COMP2%% %%NUM0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'ants', 'yesno___1']
      expect(@bl.literals).to eq ['1', "some (other) 'value'"]
      expect(@bl.numbers).to eq [10]
      expect(@bl.operators).to eq ['and', 'or']
      expect(@bl.comps).to eq ['=', '<>', '>']
    end

    it 'converts parentheses to blocks' do
      test = <<~ENDSTR.strip
        [yesno(1)] = "1"
      ENDSTR

      exp = <<~ENDSTR.strip
        %%VAR0%% %%COMP0%% %%LIT0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps
      @bl.tokenize_blocks

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['yesno___1']
      expect(@bl.literals).to eq ['1']
      expect(@bl.operators).to eq []
      expect(@bl.comps).to eq ['=']
      expect(@bl.blocks).to eq []

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some value")
      ENDSTR

      exp = <<~ENDSTR.strip
        %%BLOCK0%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps
      @bl.tokenize_blocks

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'yesno___1']
      expect(@bl.literals).to eq ['1', 'some value']
      expect(@bl.operators).to eq ['and']
      expect(@bl.comps).to eq ['=', '<>']
      expect(@bl.blocks).to eq ['%%VAR1%% %%COMP0%% %%LIT0%% %%OP0%% %%VAR0%% %%COMP1%% %%LIT1%%']

      test = <<~ENDSTR.strip
        ([yesno(1)] = "1" and [test_var] <> "some (other) 'value'") or [ants] = 'many'
      ENDSTR

      exp = <<~ENDSTR.strip
        %%BLOCK0%% %%OP1%% %%VAR1%% %%COMP2%% %%LIT2%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps
      @bl.tokenize_blocks

      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['test_var', 'ants', 'yesno___1']
      expect(@bl.literals).to eq ['1', "some (other) 'value'", 'many']
      expect(@bl.numbers).to eq []
      expect(@bl.operators).to eq ['and', 'or']
      expect(@bl.comps).to eq ['=', '<>', '=']
      expect(@bl.blocks).to eq [
        '%%VAR2%% %%COMP0%% %%LIT0%% %%OP0%% %%VAR0%% %%COMP1%% %%LIT1%%'
      ]

      test = <<~ENDSTR.strip
        ([aaa] = 1 or [bbb] >= 3) and (([yesno(1)] = "1" and [test_var] <> "some (other) 'value'") or [ants] = 'many')
      ENDSTR

      exp = <<~ENDSTR.strip
        %%BLOCK0%% %%OP1%% %%BLOCK2%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.tokenize_vars
      @bl.tokenize_literals
      @bl.tokenize_operators
      @bl.tokenize_comps
      @bl.tokenize_blocks
      # (%%VAR0%% %%COMP0%% %%NUM0%% %%OP0%% %%VAR1%% %%COMP1%% %%NUM1%%) %%OP1%% ((%%VAR4%% %%COMP2%% %%LIT0%% %%OP2%% %%VAR2%% %%COMP3%% %%LIT1%%) %%OP3%% %%VAR3%% %%COMP4%% %%LIT2%%)
      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['aaa', 'bbb', 'test_var', 'ants', 'yesno___1']
      expect(@bl.literals).to eq ['1', "some (other) 'value'", 'many']
      expect(@bl.numbers).to eq [1, 3]
      expect(@bl.operators).to eq ['or', 'and', 'and', 'or']
      expect(@bl.comps).to eq ['=', '>=', '=', '<>', '=']
      expect(@bl.blocks).to eq [
        '%%VAR0%% %%COMP0%% %%NUM0%% %%OP0%% %%VAR1%% %%COMP1%% %%NUM1%%',
        '%%VAR4%% %%COMP2%% %%LIT0%% %%OP2%% %%VAR2%% %%COMP3%% %%LIT1%%',
        '%%BLOCK1%% %%OP3%% %%VAR3%% %%COMP4%% %%LIT2%%'
      ]
    end

    it "generates a hash of blocks" do
      test = <<~ENDSTR.strip
        ([aaa] = 1 or [bbb] >= 3) and (([yesno(1)] = "1" and [test_var] <> "some (other) 'value'") or [ants] = 'many')
      ENDSTR

      exp = <<~ENDSTR.strip
        %%BLOCK0%% %%OP1%% %%BLOCK2%%
      ENDSTR

      @bl = Redcap::DataDictionaries::BranchingLogic.new(test)

      @bl.hash_of_blocks
      # (%%VAR0%% %%COMP0%% %%NUM0%% %%OP0%% %%VAR1%% %%COMP1%% %%NUM1%%) %%OP1%% ((%%VAR4%% %%COMP2%% %%LIT0%% %%OP2%% %%VAR2%% %%COMP3%% %%LIT1%%) %%OP3%% %%VAR3%% %%COMP4%% %%LIT2%%)
      expect(@bl.condition_string).to eq exp
      expect(@bl.vars).to eq ['aaa', 'bbb', 'test_var', 'ants', 'yesno___1']
      expect(@bl.literals).to eq ['1', "some (other) 'value'", 'many']
      expect(@bl.numbers).to eq [1, 3]
      expect(@bl.operators).to eq ['or', 'and', 'and', 'or']
      expect(@bl.comps).to eq ['=', '>=', '=', '<>', '=']
      expect(@bl.blocks).to eq [
        '%%VAR0%% %%COMP0%% %%NUM0%% %%OP0%% %%VAR1%% %%COMP1%% %%NUM1%%',
        '%%VAR4%% %%COMP2%% %%LIT0%% %%OP2%% %%VAR2%% %%COMP3%% %%LIT1%%',
        '%%BLOCK1%% %%OP3%% %%VAR3%% %%COMP4%% %%LIT2%%'
      ]
    end      
    end
  end
end
