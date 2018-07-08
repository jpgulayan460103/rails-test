/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue/dist/vue.js'
import ElementUI from 'element-ui'
import locale from 'element-ui/lib/locale/lang/en'
import Vue2Filters from 'vue2-filters'
import axios from 'axios'
import EventDispatcher from './service/EventDispatcher'

import Api from './api/api.main.js'
import './notify.js'
import './components/components.main.js'
import '@fortawesome/fontawesome-free/js/all.js'





Vue.prototype.$API = Api;
Vue.prototype.$EventDispatcher = new EventDispatcher();

Vue.use(Vue2Filters)
Vue.use(ElementUI, { locale });



axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
} else {
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}

const app = new Vue({
    el: '#myApp',
});

// Add a response interceptor
axios.interceptors.response.use((response) => {
    return response;
}, (error) => {
    if (error.response.status == 401) {
        app.$alert('Opss! Your session may have been expired. Please login.', 'UNAUTHENTICATED', {
            confirmButtonText: 'OK',
            callback: action => {
                location.reload()
            }
        });
    } else if (error.response.status == 403) {
        app.$alert('Opss! You are not authorize', 'FORBIDDEN', {
            confirmButtonText: 'OK',
            callback: action => {
            }
        });
    } else if (error.response.status >= 500) {
        app.$alert('Opss! Something went wrong. Please report this to your technical support', 'SERVER ERROR', {
            confirmButtonText: 'OK',
            callback: action => {
            }
        });
    }
    return Promise.reject(error);
});



$.notify.defaults(

    {
        // whether to hide the notification on click
        clickToHide: true,
        // whether to auto-hide the notification
        autoHide: true,
        // if autoHide, hide after milliseconds
        autoHideDelay: 5000,
        // show the arrow pointing at the element
        arrowShow: true,
        // arrow size in pixels
        arrowSize: 5,
        // position defines the notification position though uses the defaults below
        position: 'bottom left',
        // default positions
        elementPosition: 'top right',
        globalPosition: 'top right',
        // default style
        style: 'bootstrap',
        // default class (string or [string])
        className: 'success',
        // show animation
        showAnimation: 'slideDown',
        // show animation duration
        showDuration: 400,
        // hide animation
        hideAnimation: 'slideUp',
        // hide animation duration
        hideDuration: 200,
        // padding between element and notification
        gap: 2
    }
);