// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    compatibilityDate: '2024-04-03',
    css: [
        'animate.css',
        '~/assets/css/tailwind.css',
        '~/assets/scss/main.scss',
    ],
    devtools: { enabled: true },
    modules: ['@nuxtjs/tailwindcss'],
});
