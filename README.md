# eqHeight.coffee

**eqHeight.coffee** is a jQuery plugin that stretches fluid columns to equal height. It is originally designed to be used in responsive web design.

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

Download `jquery.eqheight.js` from [Github](http://github.com/jsliang/eqHeight.coffee).

### Put eqHeight in your page

Please note that you have to include eqHeight after jQuery.

```html
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

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

You can use
```javascript
$(".row").eqHeight();
```
in this case because &lt;div class="column"&gt; elements are top level children of &lt;div class="row"&gt; elements.

You can also use it with existing responsive grid systems that have similar structure.
We'll demonstrate some of them here.

#### Using Twitter Bootstrap

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

#### Using Responsive GS

A sample for using [Responsive GS] with eqHeight.coffee:

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
<script type="text/javascript">
$(document).ready(function() {
    $(".row").eqHeight(".col");
});
</script>
```

## Any Comments?

If you have any comments, or you found any bugs to report, please post them in [Issues](http://github.com/jsliang/eqHeight.coffee/issues).


## Developing eqHeight.coffee

eqHeight.coffee is written in [CoffeeScript](http://coffeescript.org/).

If you're contributing to eqHeight.coffee, make sure to modify `jquery.eqheight.coffee`, not `jquery.eqheight.js`.



## License

Copyright (c) 2013, Jui-Shan Liang &lt;jenny@jsliang.com&gt;

All rights reserved.

Licensed under GPL v2.
