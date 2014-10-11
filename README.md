# eqHeight.coffee

**eqHeight.coffee** is a jQuery plugin that stretches fluid columns to equal height. It is originally designed to be used in responsive web design.
A [live demo](http://jsliang.github.com/eqHeight.coffee/demo.html) is available.

With eqHeight applied, floating columns in the same row container are always stretched to the height of the tallest one.
For better visual experience on mobile devices, eqHeight adjusts column heights as window resizes.
Furthurmore, eqHeight resets columns to their default height values when columns are stacked together on small displays.

eqHeight currently supports [Twitter Bootstrap] and [Responsive GS]. Supports for more responsive design grid systems to be added.

[Twitter Bootstrap]:  http://twitter.github.com/bootstrap
[Responsive GS]:      http://responsive.gs/

Find us on our [Github Repository] & [Github Pages].

[Github Repository]:  http://github.com/jsliang/eqHeight.coffee
[Github Pages]:       http://jsliang.github.com/eqHeight.coffee


## How to Use

### Download eqHeight

Download `jquery.eqheight.js` from [Github](http://github.com/jsliang/eqHeight.coffee) or [jQuery Plugins Registry](http://plugins.jquery.com/eqHeight/).

You can install via [Bower](http://bower.io/) as well:

```
bower install eqheight-coffee
```

### Put eqHeight in your page

Please note that you have to include eqHeight after jQuery.

```html
<script src="http://code.jquery.com/jquery.min.js"></script>

<!-- put eqHeight after jQuery -->
<script src="jquery.eqheight.js"></script>
```

### Use eqHeight in your page

Using eqHeight is simple.
You have to specify a CSS3 selector for row containers, and *optionally* a CSS3 selector for columns **inside those row containers**.
eqHeight selects the top level children of row containers as columns by default.

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

A simple eqHeight setup for the above HTML would be:

```html
<script type="text/javascript">
$(document).ready(function() {
    $(".row").eqHeight(".column");
});
</script>
```

You can also use
```javascript
$(".row").eqHeight();
```
in this case because &lt;div class="column"&gt; elements are top level children of &lt;div class="row"&gt; elements.

#### Options

##### equalize_interval
By default, the equalizing function is called only on window resize.
You can change this default behavior by setting the `equalize_interval` option.
If `equalize_interval` is specified with a number value, for example, `500`, then the equalizing function is called every 500ms:

```javascript
/* call the equalizing function every 500ms*/
$(".row").eqHeight(".column", {
    equalize_interval: 500
});
```

##### break_point
You can set minimum width under which the plug-in will be ignored with the `break_point` option.

This is useful for responsive designs, in which floating element should be the same height side by side, but for smaller screens the elements are stacked and should have auto height.

```javascript
/* do not call the equalizing function when display width is under 568px*/
$(".row").eqHeight(".column", {
    break_point: 568
});
```

### Use with existing responsive grid systems

You can use eqHeight with existing responsive grid systems that have similar structures.
We'll demonstrate some of them here.

#### Twitter Bootstrap

If you're using [Twitter Bootstrap], the idea is the same:

```html
<!-- include Bootstrap javascript files first -->
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
<script type="text/javascript">
$(document).ready(function() {
    $(".row, .row-fluid").eqHeight(".span1, .span2, .span3, .span4, .span5, .span6, .span7, .span8, .span9, .span10, .span11, .span12");
});
</script>
```

#### Responsive GS

A sample for using [Responsive GS] with eqHeight.coffee:

```html
<!-- include Responsive GS files here -->
<script src="http://code.jquery.com/jquery.min.js"></script>
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
<script type="text/javascript">
$(document).ready(function() {
    $(".row").eqHeight(".col");
});
</script>
```

#### Responsive-SASS-Grid

A live demo using [carlopogus/Responsive-SASS-Grid](https://github.com/carlopogus/Responsive-SASS-Grid) with eqHeight.coffee can be found [here](http://jsliang.com/Responsive-SASS-Grid/).
See [issue #2](https://github.com/jsliang/eqHeight.coffee/issues/2) for more details.


## Any Comments?

If you have any comments, or you found any bugs to report, please post them in [Issues](http://github.com/jsliang/eqHeight.coffee/issues).


## Developing eqHeight.coffee

eqHeight.coffee is written in [CoffeeScript](http://coffeescript.org/).

If you're contributing to eqHeight.coffee, make sure to modify `jquery.eqheight.coffee`, not `jquery.eqheight.js`.



## License

Copyright (c) 2013-2014, Jui-Shan Liang &lt;jenny@jsliang.com&gt;

All rights reserved.

Licensed under GPL v2.
