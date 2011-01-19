// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

Event.observe(window, 'load', function() {

  $$('.account').invoke('observe', 'mouseover', function(event) {
    $(this).select('.meishi .ohai').invoke('hide');
    $(this).select('.meishi .details').invoke('show');
  });

  $$('.account').invoke('observe', 'mouseout', function(event) {
    var that = $(this);
    $(that).select('.meishi .ohai').invoke('show');
    $(that).select('.meishi .details').invoke('hide');
  });

  $$('.details').each(function(list) {
    if ($(list).select('ul.navigation li').first() != undefined) {
      $(list).select('ul.navigation li').first().addClassName('active');
    }
    if ($(list).select('.content ul').first() != undefined) {
      $(list).select('.content ul').first().show();
    }
  });

});

// Opens the feedback form
var Navigation = {
  tab: function(elm) {
    clazz = $(elm).readAttribute('rel');
    $(elm).up().up().select('li').each(function(e) { e.removeClassName('active')});
    $(elm).up().addClassName('active');
    $(elm).up().up().up().select('.content ul').invoke('hide');
    $(elm).up().up().up().select('.content .' + clazz).invoke('show');
    return false;
  }
}