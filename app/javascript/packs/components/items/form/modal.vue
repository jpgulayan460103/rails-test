<template>
    <div>
        <!-- The Modal -->
        <div class="modal fade" tabindex="-1" role="dialog" id="item-modal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">{{ formType=="create" ? "ADD ITEM" : "EDIT ITEM" }}</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="item-form" @submit="itemFormSubmit">
                            <div class="form-group">
                                <label for="name">Item Name</label>
                                <input type="text" class="form-control" id="name" aria-describedby="name" placeholder="Enter item name" v-model="formData.name">
                                <small style="color: red" class="form-text" v-if="formErrors.name">{{ formErrors.name[0] }}</small>
                            </div>
                            <div class="form-group">
                                <label for="category">Item Category</label>
                                <input type="text" class="form-control" id="category" aria-describedby="category" placeholder="Enter item category" v-model="formData.category">
                                <small style="color: red" class="form-text" v-if="formErrors.category">{{ formErrors.category[0] }}</small>
                            </div>
                            <div class="form-group">
                                <label for="subcategory">Item Subcategory</label>
                                <input type="text" class="form-control" id="subcategory" aria-describedby="subcategory" placeholder="Enter item subcategory"
                                    v-model="formData.subcategory">
                                <small style="color: red" class="form-text" v-if="formErrors.subcategory">{{ formErrors.subcategory[0] }}</small>
                            </div>
                            <div class="form-group">
                                <label for="retail_price">Suggested Retail Price</label>
                                <input type="number" step="0.01" class="form-control" id="retail_price" aria-describedby="retail_price" placeholder="Enter suggested retail price"
                                    v-model="formData.retail_price">
                                <small style="color: red" class="form-text" v-if="formErrors.retail_price">{{ formErrors.retail_price[0] }}</small>
                            </div>
                            <div class="form-group">
                                <label for="dealers_price">Dealers Price</label>
                                <input type="number" step="0.01" class="form-control" id="dealers_price" aria-describedby="dealers_price" placeholder="Enter dealers price"
                                    v-model="formData.dealers_price">
                                <small style="color: red" class="form-text" v-if="formErrors.dealers_price">{{ formErrors.dealers_price[0] }}</small>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" form="item-form">Submit</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import _cloneDeep from "lodash.clonedeep";

export default {
    created(){
        this.$EventDispatcher.listen('OPEN_ITEM_FORM_MODAL', (data) => {
            this.formType = data.formType;
            if(this.formType=="create"){
                this.formData = {};
                this.itemFormModal = true;
                $('#item-modal').modal('show');
            }else{
                this.formData = _cloneDeep(data.formData);
                $('#item-modal').modal('show');
            }
        });
    },
    data(){
        return {
            formData: {},
            formErrors: {},
            itemFormModal: false,
            formType: "create",
        }
    },
    methods: {
        itemFormSubmit(){
            if(this.formType == "create"){
                this.create();
            }else{
                this.update();
            }
        },

        create(){
            this.submit = false;
            this.$API.Item.create(this.formData)
            .then(res => {
                this.$EventDispatcher.fire('ITEM_CREATED', res.data);
                $.notify(`Item ${res.data.name} has been added.`);
                $('#item-modal').modal('hide');
            })
            .catch(err => {
                this.formErrors = err.response.data.errors;
                $.notify(err.response.data.message, "error");
            })
            .then(() => {
                this.submit = false;
            });
        },

        update() {
            this.submit = false;
            this.$API.Item.update(this.formData)
            .then(res => {
                this.$EventDispatcher.fire('ITEM_UPDATED', res.data);
                $.notify(`Item ${res.data.name} has been updated.`);
                $('#item-modal').modal('hide');
            })
            .catch(err => {
                this.formErrors = err.response.data.errors;
                $.notify(err.response.data.message, "error");
            })
            .then(() => {
                this.submit = false;
            });
        }
    }
}
</script>

<style scoped>
</style>
