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
//
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require 'jquery'
//= require 'jquery_ujs'
jQuery(document).ready(function() {
      setTimeout(function() {
        var source = new EventSource("/speaks");
        source.addEventListener('spoken', function(e) {
          console.log("refresh")
        });
          document.getElementById("purses").innerHTML = x.data;

          var xhttp3 = new XMLHttpRequest();
          xhttp3.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
              document.getElementById("info").innerHTML = this.responseText;
            }
          };
          xhttp3.open("GET", "/spoken/");
          xhttp3.send();

      }, 1000);
    });

