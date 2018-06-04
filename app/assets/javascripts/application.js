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
//= require jquery3
//= require popper
//= require bootstrap
//= require angular
//= require angular-sanitize
//= require lodash
//= require moment
//= require_tree .
var app = angular.module('myApp', ['ngSanitize']);
app.config(['$httpProvider', function ($httpProvider) {

    let token = document.head.querySelector('meta[name="csrf-token"]');
    if (token) {
        $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
    } else {
        console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
    }
    $httpProvider.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
    $httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';
    $httpProvider.defaults.headers.put['Content-Type'] = 'application/x-www-form-urlencoded';
}]);
request_error = function (error_code) {
    if (error_code == 401) {
        alertify.alert('Error', 'Session has expired. Please login again.');
        setTimeout(function () {
            location.reload();
        }, 3000);
    } else if (error_code == 401) {
        $.notify("Server Error Try Again.", 'warn');
    } else if (error_code >= 500) {
        $.notify("Server Error Try Again.", 'error');
    }
}