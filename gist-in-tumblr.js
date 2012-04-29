$(document).ready(function(){
  $('a.gist').writeCapture().html(
    '<scr'+'ipt src="'+$(this).text()+'.js"></scr'+'ipt>'
  );
});

