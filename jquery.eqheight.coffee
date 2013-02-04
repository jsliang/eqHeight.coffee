###
eqHeight.coffee v1.2.0
http://jsliang.github.com/eqHeight.coffee

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
###

# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
    eqHeight: (column_selector) ->
        this.each ()->
            columns = $(this).children(column_selector)

            # Stop if there is no column selected
            if columns.length is 0 then return

            #
            # equalizer: a function that equalizes column heights
            #

            equalizer = () ->
                # Reset column height to default
                columns.height("")

                # Group columns by rows
                first_top_value = columns.first().position().top
                row_id = 1
                columns.each () ->
                    current_top = $(this).position().top
                    if current_top isnt first_top_value
                        row_id += 1
                        first_top_value = current_top
                    $(this).addClass("eqHeight_row_#{row_id}")

                for row_index in [1..row_id]
                    row_columns = $(".eqHeight_row_#{row_index}")

                    # Get max height of columns
                    max_col_height = 0
                    row_columns.each () ->
                        if $(this).height() > max_col_height
                            max_col_height = $(this).height()

                    # Set all columns to max_col_height
                    row_columns.height(max_col_height)

                    # Reset row info
                    row_columns.removeClass("eqHeight_row_#{row_index}")

            #
            # Call equalizer()
            #

            # Equalize column heights for the first time
            equalizer()

            # Equalize column heights after all contents on the page have been loaded
            $(window).load(equalizer)

            # Equalize column heights on resize
            $(window).resize(equalizer)
