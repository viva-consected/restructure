// Show a table as a tree. The attribute data-tt-tree-cols 
// defines the set of columns to use for grouping (JSON array)
// param $table - jQuery reference to table
_fpa.reports_tree = class {

  static show_table_as_tree($table) {

    console.log('jstree')
    if ($table.hasClass('jsTree')) return;

    $table.addClass('added-tree-table');

    var col_levels = $table.attr('data-tt-tree-cols');
    if (col_levels)
      col_levels = JSON.parse(col_levels);
    else
      col_levels = [];

    var num_levels = $table.attr('data-tt-tree-num-levels');
    if (num_levels)
      num_levels = parseInt(num_levels);
    else
      num_levels = 2;

    if (col_levels.length != num_levels - 1) {
      console.log("ERROR - the number of levels specified for the tree does not correspond to the column levels specified");
      return;
    }

    // Add classes and attributes to the header columns to aid styling
    $table.find('thead th[data-col-type]').each(function () {
      if (col_levels[0].indexOf($(this).attr('data-col-name')) >= 0) {
        $(this).addClass('is-parent-col')
      }
      else {
        $(this).addClass('is-not-parent-col')
      }

      for (let i = 1; i < num_levels; i++) {
        if (col_levels[i - 1] && col_levels[i - 1].indexOf($(this).attr('data-col-name')) >= 0) {
          $(this).attr('data-tt-th-col-level', i - 1)
        }
        else {
          $(this).attr('data-tt-th-col-level', i)
        }

        if ($(this).attr('data-col-name') == `id${i}`) {
          $(this).hide()
        }
      }
    });

    // Run through the rows to add an extra row above a group of rows with the same ID,
    // to act as the parent tree row for that group of data.
    // The primary columns that appear in each of these group headers are blanked in the
    // subsequent data rows to avoid repetition and provide a tree view
    var rows = $table.find('tbody tr');
    var num_cols = rows.first().find('[data-col-type]').length;

    var curr_level = 0;
    var prev_id = null;


    rows.each(function () {
      for (let curr_level = 0; curr_level < num_levels - 1; curr_level++) {
        var id = $(this).find(`[data-col-type="id${curr_level}"]`).text();
        var $tp_id = $(this).find(`[data-col-type="id${curr_level + 1}"]`).hide();
        var tp_id = $tp_id.text();
        var par_cols = col_levels[curr_level];

        var num_par_cols = par_cols.length;
        var num_child_cols = num_cols - num_par_cols;


        if (id != prev_id) {
          // A new id, so add the parent row for it
          var $par = $(this).clone();

          $par.find('[data-col-type]').each(function () {
            if (par_cols.indexOf($(this).attr('data-col-type')) < 0) {
              $(this).remove();
            }
          });

          $par.find('[data-col-type]').last().attr('colspan', num_child_cols + 1);

          $par.attr('data-tt-id', `${id}`);
          $(this).before($par);
        }

        $(this).find('[data-col-type]').each(function () {
          if (par_cols.indexOf($(this).attr('data-col-type')) >= 0) {
            $(this).addClass('is-parent-col').html('')
          }
        });


        $(this).attr('data-tt-id', `${id}-${tp_id}`);
        $(this).attr('data-tt-parent-id', id);

        prev_id = id;
      }
    });

    com_github_culmat_jsTreeTable.treeTable($table);
    $table.expandLevel(0);

  }
}