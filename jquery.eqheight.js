(function() {
  /*
  eqHeight.coffee v1.1.5
  http://jsliang.github.com/eqHeight.coffee
  
  Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
  All rights reserved.
  Licensed under GPL v2.
  */  var $;
  $ = jQuery;
  $.fn.extend({
    eqHeight: function(column_selector) {
      return this.each(function() {
        var columns, equalizer;
        columns = $(this).children(column_selector);
        if (columns.length === 0) {
          return;
        }
        equalizer = function() {
          var first_top_value, max_col_height, row_columns, row_id, row_index, _results;
          columns.height("");
          first_top_value = columns.first().position().top;
          row_id = 1;
          columns.each(function() {
            var current_top;
            current_top = $(this).position().top;
            if (current_top !== first_top_value) {
              row_id += 1;
              first_top_value = current_top;
            }
            return $(this).addClass("eqHeight_row_" + row_id);
          });
          _results = [];
          for (row_index = 1; 1 <= row_id ? row_index <= row_id : row_index >= row_id; 1 <= row_id ? row_index++ : row_index--) {
            row_columns = $(".eqHeight_row_" + row_index);
            max_col_height = 0;
            row_columns.each(function() {
              if ($(this).height() > max_col_height) {
                return max_col_height = $(this).height();
              }
            });
            row_columns.height(max_col_height);
            _results.push(row_columns.removeClass("eqHeight_row_" + row_index));
          }
          return _results;
        };
        equalizer();
        $(window).load(equalizer);
        return $(window).resize(equalizer);
      });
    }
  });
}).call(this);
