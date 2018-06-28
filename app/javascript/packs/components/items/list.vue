<template>
    <div>
        <item-table></item-table>
        <b-pagination :total-rows="3" :per-page="1"></b-pagination>
    </div>
</template>

<script>
import ItemTable from './table.vue'

export default {
    components: {
        'item-table': ItemTable
    },
    data(){
        return {
            items: {},
            loading: true,
            currentPage: 1,
        }
    },
    methods: {
        
    }
}
</script>

<style scoped>

</style>
