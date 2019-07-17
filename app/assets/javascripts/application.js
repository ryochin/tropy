// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

function Reload(aEvent) {
  // see http://slashdot.jp/~Motohiko/journal/324775
  var e = aEvent ? aEvent : window.event;
  if( e ){
    // reject when in input fields
    var tag = (e.target || e.srcElement).tagName;
    if( tag == 'TEXTAREA' )
      return;

    switch(e.keyCode){
      case 37:    // left arrow
      case 39:    // right arrow
      case 114:    // r key
        location.href = location.pathname;    //  reload w/o query string
        break;
    }
  }
}

function onTimeout() {
  document.getElementById("navi").style.visibility = "visible";
  window.document.onkeydown = Reload;
}

document.addEventListener('DOMContentLoaded', function() {
  document.getElementById("navi").style.visibility = "hidden";
  setTimeout("onTimeout()", 3 * 1000);    // 5 sec was the original value

  window.document.onkeydown = Reload;
});
