_fpa_admin.user_access_controls.admin_edit_form = class {

  constructor(block, data) {
    this.block = block
    this.data = data
  }

  // Provide additional admin edit form setup
  static setup(block, data) {

    var aef = new _fpa_admin.user_access_controls.admin_edit_form(block, data)

    aef.setup_selectors()
  }

  // For the selection of resource types / names in user access control form
  setup_selectors() {
    var block = this.block
    var _this = this
    this.res_type_changed($('form #admin_user_access_control_resource_type'));
    block.on('change', '#admin_user_access_control_resource_type', function () {
      _this.res_type_changed($(this))
    })
    window.setTimeout(function () {
      $('form #admin_user_access_control_resource_type').change()
    }, 1)
  }

  res_type_changed($el) {
    const val = $el.val()
    const rn_fname = 'input[name="admin_user_access_control[resource_name]"]'
    const a_fname = 'form select[name="admin_user_access_control[access]"]'
    $(rn_fname).attr('data-big-select-subtype', val)
    $(`${a_fname} optgroup[label]`).hide()
    $(`${a_fname} optgroup[label="${val}"]`).show()
    $(a_fname).trigger('chosen:updated');

  }

}