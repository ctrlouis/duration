<template>
    <main class="h-screen w-screen flex flex-col items-center bg-yellow-400 text-center text-purple-800">
            <div class="p-2 shrink">
                <p class="text-xl">Date de début</p>
                <h2 class="text-2xl">{{ startTime.toLocaleString(DateTime.DATETIME_HUGE_WITH_SECONDS) }}</h2>
            </div>
            <div class="grow flex items-center">
                <h1 class="text-6xl drop-shadow-lg">{{  timeDiffToString }}</h1>
            </div>
    </main>
</template>

<script setup lang="ts">
useSeoMeta({
    title: 'Since When ?',
    ogTitle: 'Since When ?',
    description: 'A simple page to calculate the time spent with my partner.',
    ogDescription: 'A simple page to calculate the time spent with my partner.',
});

import { DateTime } from "luxon";

const initialTime = '2013-02-13T16:55:00.000';
const startTime = ref<DateTime>(DateTime.fromISO(initialTime));
const currentTime = ref<DateTime>(DateTime.fromISO(initialTime));

const timeDiff = computed(() => {
    return currentTime.value.diff(startTime.value, ['years', 'months', 'days', 'hours', 'minutes', 'seconds'], { conversionAccuracy: 'casual' }).toObject();
});

const timeDiffToString = computed(() => {
    const string = `${timeDiff.value.years} ans ${timeDiff.value.months} mois ${timeDiff.value.days} jours ${timeDiff.value.hours} heures ${timeDiff.value.minutes} minutes`;
    return string;
});

onMounted(() => {
    window.setInterval(() => {
        currentTime.value = DateTime.now();
    }, 1000);
});
</script>