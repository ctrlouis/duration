<template>
    <div class="h-screen w-screen flex flex-col">
        <header>
        </header>

        <main class="flex-grow flex p-2">
            <NuxtPage />
        </main>

        <footer>
            <div class="font-bold text-center">
                <p>Made with ❤️ by <a href="https://github.com/ctrlouis">ctrlouis</a></p>
            </div>
        </footer>
    </div>
</template>


<script setup lang="ts">
useSeoMeta({
    title: 'Duration App',
    ogTitle: 'Duration App',
    description: 'Simple duration calculator',
    ogDescription: 'Simple duration calculator',
});
</script>