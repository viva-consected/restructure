# frozen_string_literal: true

require 'rails_helper'

# Static analysis tests for the NFS Store Browser JavaScript
#
# These tests verify that the JavaScript source code contains the expected
# patterns to prevent regressions for issues #878 and #884.
#
# Issue #884: Filestore "send to trash" opens response as JSON in new tab
#   The fix requires:
#   1. Click handlers for filestore actions must call e.preventDefault()
#   2. submit_action_form must use form.trigger('submit') instead of btn.click()
#   3. The commit parameter must be manually added as a hidden field
#
# These static checks ensure the patterns remain in place even if runtime behavior
# differs between test environments and production.

RSpec.describe 'NFS Store Browser JavaScript source code' do
  let(:js_source_path) { Rails.root.join('app/assets/javascripts/app/nfs_store/_nfs_store_browser.js') }
  let(:js_source) { File.read(js_source_path) }

  describe 'click handlers must call e.preventDefault() (regression for issue #884)' do
    it 'trash submit click handler calls e.preventDefault()' do
      # The pattern: on('click', '.container-browse-trash-submit', function (e) { e.preventDefault();
      pattern = /\.on\(\s*['"]click['"]\s*,\s*['"][^'"]*container-browse-trash-submit[^'"]*['"]\s*,\s*function\s*\(\s*e\s*\)\s*\{\s*e\.preventDefault\(\)/
      expect(js_source).to match(pattern),
                           'Click handler for .container-browse-trash-submit must call e.preventDefault() - issue #884'
    end

    it 'trigger file action click handler calls e.preventDefault()' do
      pattern = /\.on\(\s*['"]click['"]\s*,\s*['"][^'"]*container-browse-trigger-file-action[^'"]*['"]\s*,\s*function\s*\(\s*e\s*\)\s*\{\s*e\.preventDefault\(\)/
      expect(js_source).to match(pattern),
                           'Click handler for .container-browse-trigger-file-action must call e.preventDefault() - issue #884'
    end

    it 'move files click handler calls e.preventDefault()' do
      pattern = /\.on\(\s*['"]click['"]\s*,\s*['"][^'"]*container-browse-move-files[^'"]*['"]\s*,\s*function\s*\(\s*e\s*\)\s*\{[^}]*e\.preventDefault\(\)/m
      expect(js_source).to match(pattern),
                           'Click handler for .container-browse-move-files must call e.preventDefault() - issue #884'
    end

    it 'rename file click handler calls e.preventDefault()' do
      pattern = /\.on\(\s*['"]click['"]\s*,\s*['"][^'"]*container-browse-rename-file['"]\s*,\s*function\s*\(\s*e\s*\)\s*\{\s*e\.preventDefault\(\)/
      expect(js_source).to match(pattern),
                           'Click handler for .container-browse-rename-file must call e.preventDefault() - issue #884'
    end
  end

  describe 'submit_action_form must use proper form submission (regression for issue #884)' do
    it 'adds commit parameter as hidden field before submission' do
      # The fix adds: form.append('<input type="hidden" name="commit"
      pattern = /form\.append\([^)]*name="commit"/
      expect(js_source).to match(pattern),
                           'submit_action_form must add commit parameter as hidden field - issue #884'
    end

    it 'uses form.trigger(\'submit\') instead of btn.click()' do
      # Extract the submit_action_form function body
      func_match = js_source.match(/var submit_action_form\s*=\s*function[^{]*\{(.*?)^\s*\};/m)
      expect(func_match).to be_present, 'Could not find submit_action_form function'

      func_body = func_match[1]

      # Should NOT contain btn.click() as the submission method
      expect(func_body).not_to match(/btn\.click\(\)/),
                               'submit_action_form must not use btn.click() for form submission - issue #884'

      # SHOULD contain form.trigger('submit')
      expect(func_body).to match(/form\.trigger\(['"]submit['"]\)/),
                           "submit_action_form must use form.trigger('submit') for proper Rails UJS handling - issue #884"
    end
  end
end
