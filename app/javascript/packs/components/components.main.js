import Vue from 'vue/dist/vue.js'

import ItemsList from './items/list.vue'
import ItemsFormModal from './items/form/modal.vue'
import Login from './authentication/login'

Vue.component('item-list', ItemsList);
Vue.component('item-form-modal', ItemsFormModal);
Vue.component('login', Login);