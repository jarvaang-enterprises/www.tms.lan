jQuery(document).ready(function(){function c(a){a=d?a:event;a=d?a.which:a.button;return 2==a||3==a?!1:void 0}var b=!1;document.onkeyup=function(a){17==a.which&&(b=!1)};document.onkeydown=function(a){return 17==a.which&&(b=!0),!0===b?!1:void 0};var d="Netscape"==navigator.appName?1:0;"Netscape"==navigator.appName&&document.captureEvents(Event.MOUSEDOWN||Event.MOUSEUP);document.oncontextmenu=function(){return!1};document.onmousedown=c;document.onmouseup=c});