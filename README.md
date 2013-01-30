# EqualHeight.coffee

**EqualHeight.coffee** is a jQuery plugin that stretches fluid columns to the same height. It is originally designed to be used in responsive web design.

With EqualHeight applied, floating columns in the same row container are always stretched to the height of the tallest one.
For better visual experience on mobile devices, EqualHeight does not apply when columns are stacked together on small displays.

EqualHeight currently supports [Twitter Bootstrap] and [Responsive GS]. Supports for more responsive design grid systems to be added.

[Twitter Bootstrap]: http://twitter.github.com/bootstrap
[Responsive GS]: http://responsive.gs/


## How to Use

To use EqualHeight, you have to specify a CSS3 selector for row containers, and *optionally* a CSS3 selector for columns **inside those row containers**.
EqualHeight selects the top level children of row containers as columns by default.

Say your HTML looks like this:

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
<script src="jquery.equalheight.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".row").equalHeight(".column");
});
</script>
```

You can also use
```
$(".row").equalHeight();
```
in this case.

### Using Twitter Bootstrap

If you're using [Twitter Bootstrap], the idea is the same:

```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<!-- include Bootstrap javascript files here -->
<div class="row">
    <div class="span3">
        <p>Line 1</p>
        <p>Line 2</p>
        <p>Line 3</p>
        <p>Line 4</p>
    </div>
    <div class="span4">
        <p>Line 1</p>
        <p>Line 2</p>
        <p>Line 3</p>
        <p>Line 4</p>
        <p>Line 5</p>
    </div>
    <div class="span5">
        <p>Line 1</p>
    </div>
</div>
<script src="jquery.equalheight.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".row, .row-fluid").equalHeight(".span1, .span2, .span3, .span4, .span5, .span6, .span7, .span8, .span9, .span10, .span11, .span12");
});
</script>
```

### Using Responsive GS

A sample for using [Responsive GS] with EqualHeight.coffee:

```html
<!-- include Responsive GS files here -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<div class="row">
  <div class="col span_3">
      <p>1-1</p>
      <p>1-2</p>
      <p>1-3</p>
      <p>1-4</p>
  </div>
  <div class="col span_4">
      <p>2-1</p>
      <p>2-2</p>
      <p>2-3</p>
      <p>2-4</p>
      <p>2-5</p>
  </div>
  <div class="col span_5">
      <p>3-1</p>
  </div>
</div>
<script src="jquery.equalheight.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".row").equalHeight(".col");
});
</script>
```

## Any Comments?

If you have any comments, or you found any bugs to report, please post them in [Issues](http://github.com/jsliang/EqualHeight.coffee/issues).


## Developing EqualHeight.coffee

EqualHeight.coffee is written in [CoffeeScript](http://coffeescript.org/).

If you're contributing to EqualHeight.coffee, make sure to modify `jquery.equalheight.coffee`, not `jquery.equalheight.js`.



## License

Copyright (c) 2013, Jui-Shan Liang &lt;jenny@jsliang.com&gt;

All rights reserved.

Licensed under GPL v2.
