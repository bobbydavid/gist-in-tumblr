/**
 * git-in-tumblr-partial.js
 *
 * Copyright (C) 2012 Robert Martin <rdmartin3@gmail.com>
 *
 */
$(document).ready(function(){
  var bp='<div class="gist-in-tumblr" style="font-size:10px;text-align:right">'
        +  'Embedded with '
        +  '<a href="https://github.com/bobbydavid/gist-in-tumblr">'
        +    'gist-in-tumblr'
        +  '</a>.'
        +'</div>';
  $("p.gist a:only-child").replaceWith(
    function(){
      return ('<div class="gist">'
             +  '<div class="inner-gist">'
             +    this.href
             +  '</div>'
             +'</div>');
    }
  );
  $("p.gist div.gist div.inner-gist").each(function(){
    var $el = $(this);
    var url = $el.html().replace(/(gist\.github\.com\/[0-9]+)/, '$1.js');;
    $el.writeCapture().html(
      '<scr'+'ipt src="'+url+'"></scr'+'ipt>'
    ).after(bp);
  });
});

