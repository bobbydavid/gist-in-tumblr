/**
 * git-in-tumblr-partial.js
 *
 * Copyright (C) 2012 Robert Martin <rdmartin3@gmail.com>
 *
 */
$(document).ready(function(){
  $("p.gist a:only-child").replaceWith(
    function(){
    return '<div class="gist">'+this.href+'</div>';
    }
  );
  $("p.gist div.gist").each(function(){
    writeCapture.html(this,
      '<scr'+'ipt src="'+$(this).html()+'.js"></scr'+'ipt>'
    );
  });
});

