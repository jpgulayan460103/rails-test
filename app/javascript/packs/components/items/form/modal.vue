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
                        <form id="item-form" @submit.prevent="itemFormSubmit">
                            <div class="form-group">
                                <label for="name">Item Name</label>
                                <input type="text" class="form-control" id="name" aria-describedby="name" placeholder="Enter item name" v-model="formData.name" :class="{'is-invalid':formErrors.name}">
                                <div class="invalid-feedback" v-if="formErrors.name">
                                    Item Name {{ formErrors.name[0] }}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="category">Item Category</label>
                                <input type="text" class="form-control" id="category" aria-describedby="category" placeholder="Enter item category" v-model="formData.category" :class="{'is-invalid':formErrors.category}">
                                <div class="invalid-feedback" v-if="formErrors.category">
                                    Item Category {{ formErrors.category[0] }}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="subcategory">Item Subcategory</label>
                                <input type="text" class="form-control" id="subcategory" aria-describedby="subcategory" placeholder="Enter item subcategory"
                                    v-model="formData.subcategory" :class="{'is-invalid':formErrors.subcategory}">
                                <div class="invalid-feedback" v-if="formErrors.subcategory">
                                    Item Subcategory {{ formErrors.subcategory[0] }}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="unit_of_measure">Unit of Measure</label>
                                <input type="text" class="form-control" id="unit_of_measure" aria-describedby="unit_of_measure" placeholder="Unit of Measure"
                                    v-model="formData.unit_of_measure" :class="{'is-invalid':formErrors.unit_of_measure}">
                                <div class="invalid-feedback" v-if="formErrors.unit_of_measure">
                                    Unit of Measure {{ formErrors.unit_of_measure[0] }}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="reorder_level">Reorder Level
                                    <span data-balloon="If the remaining quantity of the item is on this level, the system will warn you to restock/resupply this item."
                                        data-balloon-length="medium" data-balloon-pos="right">
                                        <i class="fas fa-question-circle"></i>
                                    </span>
                                </label>
                                <input type="number" class="form-control" id="reorder_level" aria-describedby="reorder_level" placeholder="Reorder Level" v-model="formData.reorder_level" :class="{'is-invalid':formErrors.reorder_level}">
                                <div class="invalid-feedback" v-if="formErrors.reorder_level">
                                    Reorder Level {{ formErrors.reorder_level[0] }}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="retail_price">Suggested Retail Price</label>
                                <input type="number" step="0.01" class="form-control" id="retail_price" aria-describedby="retail_price" placeholder="Enter suggested retail price"
                                    v-model="formData.retail_price" :class="{'is-invalid':formErrors.retail_price}">
                                <div class="invalid-feedback" v-if="formErrors.retail_price">
                                    Suggested Retail Price {{ formErrors.retail_price[0] }}
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="dealers_price">Dealers Price</label>
                                <input type="number" step="0.01" class="form-control" id="dealers_price" aria-describedby="dealers_price" placeholder="Enter dealers price"
                                    v-model="formData.dealers_price" :class="{'is-invalid':formErrors.dealers_price}">
                                <div class="invalid-feedback" v-if="formErrors.dealers_price">
                                    Dealers Price {{ formErrors.dealers_price[0] }}
                                </div>
                            </div>
                            <div class="form-group" v-show="formType=='create'">
                                <label for="beginning_quantity">Beginning Quantity</label>
                                <input type="number" class="form-control" id="beginning_quantity" aria-describedby="beginning_quantity" placeholder="Beginning Quantity"
                                    v-model="formData.beginning_quantity" :class="{'is-invalid':formErrors.beginning_quantity}">
                                <div class="invalid-feedback" v-if="formErrors.beginning_quantity">
                                    Beginning Quantity {{ formErrors.beginning_quantity[0] }}
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" form="item-form" :disabled="submit"><i class="el-icon-loading" v-show="submit"></i> Submit</button>
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
                this.formErrors = {};
                this.itemFormModal = true;
                $('#item-modal').modal('show');
            }else{
                this.formErrors = {};
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
            submit: false,
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
            this.submit = true;
            this.$API.Item.create(this.formData)
            .then(res => {
                this.$EventDispatcher.fire('ITEM_CREATED', res.data);
                $.notify(`${res.data.name} has been added.`);
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
            this.submit = true;
            this.$API.Item.update(this.formData)
            .then(res => {
                this.$EventDispatcher.fire('ITEM_UPDATED', res.data);
                $.notify(`${res.data.name} has been updated.`);
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
