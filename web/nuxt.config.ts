// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    css: [
        '~/assets/main.scss',
    ],
    devtools: {
        enabled: true
    },
    modules: [
        'nuxt-quasar-ui',
    ],
    postcss: {
        plugins: {
            tailwindcss: {},
            autoprefixer: {},
        },
    },
    quasar: { /* */ },
});
