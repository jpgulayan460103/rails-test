<template>
    <div>
        <!-- The Modal -->
        <b-modal v-model="itemFormModal" title="ADD ITEMS">
            <form id="item-form">
                <div class="form-group">
                    <label for="name">Item Name</label>
                    <input type="text" class="form-control" id="name" aria-describedby="name" placeholder="Enter item name" v-model="formData.name">
                    <small id="itemName" class="form-text text-muted">asdasd</small>
                </div>
                <div class="form-group">
                    <label for="category">Item Category</label>
                    <input type="text" class="form-control" id="category" aria-describedby="category" placeholder="Enter item category" v-model="formData.category">
                    <small id="category" class="form-text text-muted"></small>
                </div>
                <div class="form-group">
                    <label for="subcategory">Item Subcategory</label>
                    <input type="text" class="form-control" id="subcategory" aria-describedby="subcategory" placeholder="Enter item subcategory"
                        v-model="formData.subcategory">
                    <small id="subcategory" class="form-text text-muted"></small>
                </div>
                <div class="form-group">
                    <label for="retail_price">Suggested Retail Price</label>
                    <input type="number" step="0.01" class="form-control" id="retail_price" aria-describedby="retail_price" placeholder="Enter suggested retail price"
                        v-model="formData.retail_price">
                    <small id="retail_price" class="form-text text-muted"></small>
                </div>
                <div class="form-group">
                    <label for="dealers_price">Dealers Price</label>
                    <input type="number" step="0.01" class="form-control" id="dealers_price" aria-describedby="dealers_price" placeholder="Enter dealers price"
                        v-model="formData.dealers_price">
                    <small id="dealers_price" class="form-text text-muted"></small>
                </div>
            </form>
        </b-modal>
        <div class="modal fade" id="item-modal">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">ADD ITEMS</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
        
                    <!-- Modal body -->
                    <div class="modal-body">
                        
                    </div>
        
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" form="item-form">Submit</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
        
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    created(){
        this.$EventDispatcher.listen('OPEN_ITEM_FORM_MODAL', (data) => {
            this.formType = data.formType;
            if(this.formType=="create"){
                this.formData = {};
                this.itemFormModal = true;
            }
        });
        // $.notify('Success: The account category has been deleted');
    },
    data(){
        return {
            formData: {},
            formErros: {},
            itemFormModal: false,
        }
    }
}
</script>

<style scoped>

</style>
