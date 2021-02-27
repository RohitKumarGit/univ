<template>
    <b-navbar>
        <template #brand>
            <b-navbar-item tag="router-link" :to="{ path: '/' }">
              <span class="has-text-weight-bold">UNIV</span>
            </b-navbar-item>
        </template>
        <template #start>
            <b-navbar-item href="#">
                Students
            </b-navbar-item>
            <b-navbar-item href="#">
                Sessions
            </b-navbar-item>
            
        </template>

        <template #end>
            <b-navbar-item tag="div">
                <div class="buttons">
                    <a class="button is-primary">
                        <strong>Log Out</strong>
                    </a>
                    
                </div>
            </b-navbar-item>
        </template>
    </b-navbar>
</template>