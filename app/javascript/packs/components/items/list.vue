<template>
    <div>
        <item-table></item-table>
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
    }
}
</script>

<style scoped>

</style>
