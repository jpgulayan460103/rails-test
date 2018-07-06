/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

require('./bootstrap.js');
import Vue from 'vue/dist/vue.js'
import BootstrapVue from 'bootstrap-vue'
import axios from 'axios'
import EventDispatcher from './service/EventDispatcher'

import Api from './api/api.main.js'
import './notify.js'




Vue.prototype.$API = Api;
Vue.prototype.$EventDispatcher = new EventDispatcher();

Vue.use(BootstrapVue);

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'


axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;
} else {
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}


import './components/components.main.js'

// Vue.component('items-table', require('./components/items/table.vue'));
// Vue.component('items-table', App);

const app = new Vue({
    el: '#myApp',
})