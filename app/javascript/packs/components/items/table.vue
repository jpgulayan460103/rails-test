<template>
    <div>
        <div class="table-responsive">
            <table class="table table-bordered">
                <thead>
                    <th style="text-align: center">Item Name</th>
                    <th style="text-align: center">Category</th>
                    <th style="text-align: center">Subcategory</th>
                    <th style="text-align: center">SRP</th>
                    <th style="text-align: center">DP</th>
                    <th style="text-align: center"></th>
                </thead>
                <tbody v-if="items.length != 0">
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
                    <tr v-if="items.length == 0">
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
                </tfoot>
            </table>
            <b-pagination :total-rows="pagination.total_rows" :per-page="pagination.per_page" v-model="pagination.current_page" @change="handlePaginationChange" v-if="!loading"></b-pagination>
        </div>
    </div>
</template>

<script>
export default {
    created(){
        this.getItemList();
    },
    data(){
        return {
            items: [],
            loading: true,
            pagination: {}
        }
    },
    methods: {
        editItem(){
            
        },
        deleteItem(){
            
        },
        getItemList(page = 1){
            let params = {
                page: page
            }
            this.items = [];
            this.loading = true;
            this.$API.Item.getList(params)
            .then(res => {
                this.items = res.data.results
                this.pagination = res.data.pagination;
            })
            .catch(err => {

            })
            .then(() => {
                this.loading = false;
            });
        },
        handlePaginationChange(page) {
            this.getItemList(page);
        }
    }
}
</script>

<style scoped>

</style>
