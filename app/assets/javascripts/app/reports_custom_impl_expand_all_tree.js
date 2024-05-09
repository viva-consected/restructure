_fpa.reports_custom_handling.add_handler_implementation('expand_all_tree', function () {
  const $new = $('<a href="#">expand all</a>');
  $('th[data-col-name="id0"] p.table-header-col-type').html($new);
  $new.on('click', function (ev) {
    const $a = $('th[data-col-name="id0"] p.table-header-col-type a');
    const orig_text = $a.text();
    $a.text('...');

    window.setTimeout(function () {
      $('td[data-col-type="id0"] img[id="state"], td[data-col-type="id1"] img[id="state"]').click()
      if (orig_text == 'expand all') {
        $a.text('shrink all')
      }
      else {
        $a.text('expand all')
      }
    });

    ev.preventDefault();
  })
});