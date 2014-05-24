###
eqHeight.coffee v1.2.9
http://jsliang.github.com/eqHeight.coffee

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
###

# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
    eqHeight: (column_selector, option = {equalize_interval: null}) ->
        this.each ()->
            # each row needs a timer
            timer = null

            columns = $(this).find(column_selector)

            if columns.length is 0
                columns = $(this).children(column_selector)

            # Stop if there is no column selected
            if columns.length is 0 then return
            #
            # _equalize_marked_columns: a function that equalize
            # height values of marked column elements
            #
            _equalize_marked_columns = () ->
                marked_columns = $(".eqHeight_row")

                # Get max height of marked_columns
                max_col_height = 0
                marked_columns.each () ->
                    max_col_height = Math.max($(this).height(), max_col_height)

                # Set all marked_columns to max_col_height
                marked_columns.height(max_col_height)

                # Unmark column
                $(".eqHeight_row").removeClass("eqHeight_row")

            #
            # equalizer: a function that equalizes column heights
            #

            equalizer = () ->
                # Reset column height to default
                columns.height("auto")

                # Group columns by rows
                row_top_value = columns.first().position().top
                columns.each () ->
                    current_top = $(this).position().top

                    if current_top isnt row_top_value
                        # Equalize heights of marked columns
                        _equalize_marked_columns()

                        # Update row_top_value
                        row_top_value = $(this).position().top

                    # Mark the column element
                    $(this).addClass("eqHeight_row")

                # Equalize heights of marked columns
                _equalize_marked_columns()

            # Lets prevent a repaint proces on every resize event and only
            # equalize if we are done resizing.
            start_equalizing = () ->
                clearTimeout timer
                timer = setTimeout(equalizer, 100)

            infinite_equalizing = () ->
                equalizer()
                timer = setTimeout(infinite_equalizing, option.equalize_interval)

            #
            # Call equalizer()
            #

            # Equalize column heights after all contents on the page have been loaded
            $(window).load(equalizer)

            # Equalize column heights on resize
            if typeof option.equalize_interval is "number"
                infinite_equalizing()
            else
                $(window).resize(start_equalizing)