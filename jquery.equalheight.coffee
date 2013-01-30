###
EqualHeight.coffee v1.0.1
http://github.com/jsliang/EqualHeight.coffee

Copyright (c) 2013, Jui-Shan Liang <jenny@jsliang.com>
All rights reserved.
Licensed under GPL v2.
###

# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
    equalHeight: (column_selector) ->

        return this.each ()->
            columns = $(this).children(column_selector)

            #
            # equalizer: a function that equalizes column heights
            #

            equalizer = () ->
                # Reset column height to default
                columns.each () ->
                    $(this).height("")

                # Stop if not all columns have the same top values
                first_top_value = columns.first().position().top
                differentTop = false
                columns.each () ->
                    if not ( $(this).position().top is first_top_value )
                        differentTop = true
                if differentTop then return

                # Get max height of columns
                max_col_height = 0
                columns.each () ->
                    if $(this).height() > max_col_height
                        max_col_height = $(this).height()

                # Set all columns to max_col_height
                columns.each () ->
                    $(this).height(max_col_height)

            #
            # Call equalizer()
            #

            # Equalize column heights for the first time
            equalizer()

            # Equalize column heights after all contents on the page have been loaded
            $(window).load(equalizer)

            # Equalize column heights on resize
            $(window).resize(equalizer)
