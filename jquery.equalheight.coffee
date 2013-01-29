###
HeightEqualizer.coffee v1.0.0
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
            children = $(this).children(column_selector)

            equalizer = () ->
                # reset column height to default
                children.each () ->
                    $(this).height("")

                # stop if not all columns have the same top values
                first_top_value = children.first().position().top
                differentTop = false
                children.each () ->
                    if not ( $(this).position().top is first_top_value )
                        differentTop = true
                if differentTop then return

                # get max height
                max_col_height = 0
                children.each () ->
                    if $(this).height() > max_col_height
                        max_col_height = $(this).height()

                # set all columns to max_col_height
                children.each () ->
                    $(this).height(max_col_height)

            # call first time
            equalizer()

            # call on resize
            $(window).resize(equalizer)