
# EqualHeight.coffee

**EqualHeight.coffee** is a lightweight jQuery plugin that stretches floating columns to the same height. It is designed to be used in responsive web design, especially with grid system like Twitter Bootstrap.

With EqualHeight applied, floating columns in the same row container are always stretched to the height of the tallest one.
For better visual experience on mobile devices, EqualHeight does not apply when columns are stacked together on small displays.

EqualHeight currently supports [Twitter Bootstrap](http://twitter.github.com/bootstrap). Supports for more responsive design grid systems to be added.



## How to Use

To use EqualHeight, you have to specify a CSS3 selector for row containers, and a CSS3 selector for column containers **inside those row containers**. Say your HTML looks like this:

```html
<div class="row" style="display: block; clear: both;">
    <div class="column" style="display: block; float: left; width: 200px;">
        <p>Line 1</p>
        <p>Line 2</p>
        <p>Line 3</p>
        <p>Line 4</p>
    </div>
    <div class="column" style="display: block; float: left; width: 200px;">
        <p>Line 1</p>
        <p>Line 2</p>
        <p>Line 3</p>
        <p>Line 4</p>
        <p>Line 5</p>
    </div>
    <div class="column" style="display: block; float: left; width: 200px;">
        <p>Line 1</p>
    </div>
    <div class="column" style="display: block; float: left; width: 200px;">
        <p>Line 1</p>
        <p>Line 2</p>
        <p>Line 3</p>
    </div>
</div>
```

A simple EqualHeight setup for the above HTML would be:

```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="jquery.EqualHeight.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".row").equalHeight(".column");
});
</script>
```

### Using Twitter Bootstrap

If you're using Twitter Bootstrap, the idea is the same:

```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<!-- include Bootstrap javascript files here -->
<script src="jquery.EqualHeight.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".row .row-fluid").equalHeight(".span1 .span2 .span3 .span4 .span5 .span6 .span7 .span8 .span9 .span10 .span11 .span12");
});
</script>
```

## Developing EqualHeight.coffee

EqualHeight.coffee is written in [CoffeeScript](http://coffeescript.org/).

If you're contributing to EqualHeight.coffee, make sure to modify `jquery.equalheight.coffee`, not `jquery.equalheight.js`.



## License

Copyright (c) 2013, Jui-Shan Liang &lt;jenny@jsliang.com&gt;

All rights reserved.

Licensed under GPL v2.
