(function() {
  /*
  eqHeight.coffee v1.1.3
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
          var differentTop, first_top_value, max_col_height;
          columns.height("");
          first_top_value = columns.first().position().top;
          differentTop = false;
          columns.each(function() {
            if ($(this).position().top !== first_top_value) {
              return differentTop = true;
            }
          });
          if (differentTop) {
            return;
          }
          max_col_height = 0;
          columns.each(function() {
            if ($(this).height() > max_col_height) {
              return max_col_height = $(this).height();
            }
          });
          return columns.height(max_col_height);
        };
        equalizer();
        $(window).load(equalizer);
        return $(window).resize(equalizer);
      });
    }
  });
}).call(this);
