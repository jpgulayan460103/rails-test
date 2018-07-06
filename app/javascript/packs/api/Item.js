import axios from 'axios'

export default {

    saveItem(data) {
        return axios.post(route('api.items.save'), {
            form : data,
        });
    },

    update(formData) {
        return axios.put(route('api.items.update',[formData.id]), {
            update_form : formData
        });
    },

    delete(formData) {
        return axios.put(route('api.items.delete',[formData.id]), {
            form : formData
        });
    },

    getList(formData) {
        return axios.get('/items/list', {
            params: formData,
        });
    },

    paginate(page, count) {
        return axios.get(`/api/v1/items/list/${count}?page=${page}`);
    },

    search(searchString,searchType) {
        var searchString = encodeURIComponent(searchString);
    	return axios.get(route('api.items.search',[searchType])+`?search_string=${searchString}`);
    },

    searchItemTurnInSlip(formData){
        return axios.get(route('api.items.search',['turninslip']), {
            params: formData,
        });
    },

    searchItemInspectionAcceptance(formData){
        return axios.get(route('api.items.search',['inspectionacceptance']), {
            params: formData,
        });
    },

    searchByStockNumber(stockNumber) {
        return axios.get(route('api.item.stockNumber', { stock_number : stockNumber } ));
    },

    getPropertyList(formData) {
        return axios.get(route('api.item.property.list'), {
            params: formData,
        });
    },
    changePropertyNumber(id,property_number){
        return axios.put(route('api.item.property-number.update',[id]), {
            property_number : property_number,
            id : id,
        });
    },

    manual_add(formData) {
        return axios.post(route('api.items.manual.save'), {
            items : {'item':formData}
        });
    },

    manual_delete(id,quantity_to_delete=1,type='property') {
        if(type=='stock'){
            return axios.post(route('api.items.stock.delete',[id]), {
                id : id,
                quantity_to_delete: quantity_to_delete,
            });
        }else{
            return axios.post(route('api.items.property.delete',[id]), {
                id : id,
            });
        }
    },



}