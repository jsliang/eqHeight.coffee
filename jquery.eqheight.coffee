###
eqHeight.coffee v1.1.5
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

        return this.each ()->
            columns = $(this).children(column_selector)

            # Stop if there is no column selected
            if columns.length is 0 then return

            #
            # equalizer: a function that equalizes column heights
            #

            equalizer = () ->
                # Reset column height to default
                columns.height("")

                # Stop if not all columns have the same top values
                first_top_value = columns.first().position().top
                differentTop = false
                columns.each () ->
                    if $(this).position().top isnt first_top_value
                        differentTop = true
                if differentTop then return

                # Get max height of columns
                max_col_height = 0
                columns.each () ->
                    if $(this).height() > max_col_height
                        max_col_height = $(this).height()

                # Set all columns to max_col_height
                columns.height(max_col_height)

            #
            # Call equalizer()
            #

            # Equalize column heights for the first time
            equalizer()

            # Equalize column heights after all contents on the page have been loaded
            $(window).load(equalizer)

            # Equalize column heights on resize
            $(window).resize(equalizer)
