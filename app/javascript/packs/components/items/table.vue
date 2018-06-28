<template>
    <div>
        <table class="table table-bordered">
            <thead>
                <th style="text-align: center">Item Name</th>
                <th style="text-align: center">Category</th>
                <th style="text-align: center">Subcategory</th>
                <th style="text-align: center">SRP</th>
                <th style="text-align: center">DP</th>
                <th style="text-align: center"></th>
            </thead>
            <tbody v-if="items">
                <tr v-for="(item,index) in items">
                    <td style="text-align: center">{{ item.name }}</td>
                    <td style="text-align: center">{{ item.category }}</td>
                    <td style="text-align: center">{{ item.subcategory }}</td>
                    <td style="text-align: center">{{ item.retail_price }}</td>
                    <td style="text-align: center">{{ item.dealers_price }}</td>
                    <td style="text-align: center">
                        <a href="javascript:void(0);" @click="editItem(item,index)" class="btn btn-primary">Edit</a>
                        <a href="javascript:void(0);" @click="deleteItem(item,index)" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
            </tbody>
            <tfoot>
                <tr v-if="items">
                    <td colspan="20" style="text-align: center;">
                        <h1 v-if="loading">
                            <img src="/images/loading.gif" style="height: 70px;">
                            <br> LOADING
                        </h1>
                        <h1>
                            <span v-if="!loading">NO DATA</span>
                            <span v-if="loading"></span>
                        </h1>
                    </td>
                </tr>
                <tr v-if="(items.length=0) && loading">
                    <th colspan="20"></th>
                </tr>
            </tfoot>
        </table>
    </div>
</template>

<script>
export default {
    created(){
        // this.editItem();
    },
    data(){
        return {
            items: {},
            loading: true,
        }
    },
    methods: {
        editItem(){
            // return axios.get('items/list');
        },
        deleteItem(){

        },
    }
}
</script>

<style scoped>

</style>
