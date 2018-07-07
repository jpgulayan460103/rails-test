<template>
    <div>
        <el-table :data="items" style="width: 100%" height="70vh" v-loading="loading" element-loading-text="Loading..." element-loading-spinner="el-icon-loading">
            <el-table-column fixed prop="name" label="Item Name" min-width="120" align="center" sortable></el-table-column>
            <el-table-column prop="category" label="Category" min-width="120" align="center" sortable></el-table-column>
            <el-table-column prop="subcategory" label="Subcategory" min-width="120" align="center" sortable></el-table-column>
            <el-table-column label="Retail Price" min-width="120" align="center">
                <template slot-scope="scope">
                    <span> {{ scope.row.retail_price | currency("",2) }} </span>
                </template>
            </el-table-column>
            <el-table-column label="Dealers Price" min-width="150" align="center">
                <template slot-scope="scope">
                    <span> {{ scope.row.dealers_price | currency("",2) }} </span>
                </template>
            </el-table-column>
            <el-table-column label="Operations" min-width="200" align="center">
                <template slot-scope="scope">
                    <el-button-group>
                        <el-button size="mini" @click="handleEdit(scope.row,scope.$index)">Edit</el-button>
                        <el-button size="mini" type="danger" @click="handleDelete(scope.row,scope.$index)">Delete</el-button>
                    </el-button-group>
                </template>
            </el-table-column>
        </el-table>
        <el-pagination @current-change="handlePaginationChange" :current-page.sync="pagination.current_page" :page-size="pagination.per_page"
            layout="prev, pager, next, jumper" :total="pagination.total_rows">
        </el-pagination>
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
            deleting: false,
        }
    },
    methods: {
        handleEdit(data){
            data = {
                formType: "update",
                formData: data
            }
            this.$EventDispatcher.fire('OPEN_ITEM_FORM_MODAL', data);
        },
        handleDelete(data, index){
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
