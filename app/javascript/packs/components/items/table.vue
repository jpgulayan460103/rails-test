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
                <tbody v-if="items.length != 0 && !loading">
                    <tr v-for="(item,index) in items">
                        <td style="text-align: center">{{ item.name }}</td>
                        <td style="text-align: center">{{ item.category }}</td>
                        <td style="text-align: center">{{ item.subcategory }}</td>
                        <td style="text-align: center">{{ item.retail_price | currency("",2) }}</td>
                        <td style="text-align: center">{{ item.dealers_price | currency("",2) }}</td>
                        <td style="text-align: center">
                            <a href="javascript:void(0);" @click="editItem(item,index)" class="btn btn-primary">Edit</a>
                            <a href="javascript:void(0);" @click="deleteItem(item,index)" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr v-if="loading">
                        <td colspan="20" style="text-align: center;">
                            <h1 v-if="loading">
                                <img src="/images/loading.gif" style="height: 70px;">
                                <br> LOADING
                            </h1>
                        </td>
                    </tr>
                    <tr v-if="items.length == 0 && !loading">
                        <td colspan="20" style="text-align: center;">
                            <h1>
                                <span>NO DATA</span>
                            </h1>
                        </td>
                    </tr>
                </tfoot>
            </table>
            <b-pagination :total-rows="pagination.total_rows" :per-page="pagination.per_page" v-model="pagination.current_page" @change="handlePaginationChange" v-if="!loading && items.length != 0"></b-pagination>
        </div>
    </div>
</template>

<script>
export default {
    created(){
        this.getItemList();
        this.$EventDispatcher.listen('ITEM_CREATED', (data) => {
            this.getItemList();
        });
        this.$EventDispatcher.listen('ITEM_UPDATED', (data) => {
            this.getItemList();
        });
    },
    data(){
        return {
            items: [],
            loading: true,
            pagination: {},
            current_page: 1,
            selectedItemIndex: null,
            deleting: false
        }
    },
    methods: {
        editItem(data){
            data = {
                formType: "update",
                formData: data
            }
            this.$EventDispatcher.fire('OPEN_ITEM_FORM_MODAL', data);
        },
        deleteItem(data, index){
            if(confirm("Are you sure you want to delete "+data.name+" in the list?")){
                this.loading = true;
                this.$API.Item.delete(data)
                .then(res => {
                    this.current_page = 1;
                    this.getItemList();
                    $.notify(`Item ${data.name} has been deleted.`);
                })
                .catch(err => {

                })
                .then(() => {
                    // this.loading = true;
                });
            }
        },
        getItemList(page = 1){
            let params = {
                page: this.current_page
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
            this.current_page = page;
            this.getItemList();
        }
    }
}
</script>

<style scoped>

</style>
