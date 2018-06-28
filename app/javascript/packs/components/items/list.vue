<template>
    <div>
        <div class="row">
            <div class="col-sm">
                <button type="button" class="btn btn-primary" @click="openItemFormModal">
                    Add Items
                </button>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-sm">
                <item-table></item-table>
            </div>
        </div>
        <item-form-modal></item-form-modal>
        
    </div>
</template>

<script>
import ItemTable from './table.vue'

export default {
    created(){
        
    },
    components: {
        'item-table': ItemTable
    },
    data(){
        return {
            items: {},
        }
    },
    methods: {
        openItemFormModal(){
            let data = {
                formType: "create"
            }
            this.$EventDispatcher.fire('OPEN_ITEM_FORM_MODAL', data);
        }
    }
}
</script>

<style scoped>

</style>
