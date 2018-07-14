import axios from 'axios'

export default {

    create(formData) {
        return axios.post('/items', {
            formData : formData,
        });
    },

    update(formData) {
        return axios.put('/items/'+ formData.id, {
            formData: formData,
        });
    },

    delete(formData) {
        return axios.delete('/items/' + formData.id);
    },

    getList(formData) {
        return axios.get('/items/list', {
            params: formData,
        });
    },
}