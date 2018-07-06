<template>
    <div>
        <div class="row">
            <div class="col-sm-12 col-md-8 col-lg-6 offset-md-3 offset-lg-3">
                <form action="/login" method="POST">
                    <input name="authenticity_token" type="hidden" :value="authenticityToken" />
                    <img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">
                    <h1 class="h3 mb-3 font-weight-normal">Sign in</h1>
                    <label for="username" class="sr-only">Username</label>
                    <input type="text" name="form[username]" class="form-control" value="<%= flash[:username] %>" placeholder="Username" required autofocus>
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="form[password]" class="form-control" placeholder="Password" required>
                    <br>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
                    <p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>
                </form>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props: ['authenticityToken'],
    data(){
        return {
        
        }
    }
}
</script>

<style scoped>

</style>
