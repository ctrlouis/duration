<template>
    
    <div class="flex flex-col items-center text-center">
        <!-- <q-btn class="fixed-top-right mt-4 mr-4 " flat round icon="settings" @click="parameters = true" /> -->
        <div class="grow flex items-center">
            <div class="flex flex-col">
                <h1 class="text-4xl font-bold md:text-6xl drop-shadow-lg">{{  timeDiffToString }}</h1>
                <p class="mt-5 text-xl">Depuis le {{ startTime.toLocaleString(DateTime.DATETIME_SHORT_WITH_SECONDS) }}</p>
            </div>
        </div>

        <!-- <q-dialog v-model="parameters" transition-show="scale" transition-hide="scale">
            <q-card class="w-50">

                <q-card-section class="bg-purple-800">
                    <h2 class="text-h6">Paramètres</h2>
                </q-card-section>

                <q-card-section class="py-2">
                    <q-select
                        color="purple"
                        outlined
                        v-model="durationUnits"
                        multiple
                        :options="optionsUnits"
                        label="Unités"
                    />
                </q-card-section>

                <q-card-actions align="right" class="bg-white text-teal">
                    <q-btn flat color="purple" label="OK" v-close-popup />
                </q-card-actions>
            </q-card>
        </q-dialog> -->
    </div>

</template>

<script setup lang="ts">
import { DateTime } from 'luxon';
import type { DurationUnits } from 'luxon';

const initialTime = useCookie('initialTime', { default: () => '2013-02-13T16:55:00.000' });
const durationUnits = useCookie('durationUnits', { default: (): DurationUnits => ['years', 'months', 'days', 'hours', 'minutes', 'seconds'] });

const optionsUnits = ref(['years', 'months', 'days', 'hours', 'minutes', 'seconds']);
const startTime = ref<DateTime>(DateTime.fromISO(initialTime.value));
const endTime = ref<DateTime>(DateTime.fromISO(initialTime.value));
const parameters = ref(false);

const timeDiff = computed(() => {
  return endTime.value.diff(startTime.value, durationUnits.value, { conversionAccuracy: 'casual' }).toObject();
});

const timeDiffToString = computed(() => {
    let string = "";
    if (durationUnits.value.includes('seconds')) {
        string = `${timeDiff.value.seconds} secondes`;
    }
    if (durationUnits.value.includes('minutes')) {
        string = `${timeDiff.value.minutes} minutes`;
    }
    if (durationUnits.value.includes('hours')) {
        string = `${timeDiff.value.hours} heures ${string}`;
    }
    if (durationUnits.value.includes('days')) {
        string = `${timeDiff.value.days} jours ${string}`;
    }
    if (durationUnits.value.includes('months')) {
        string = `${timeDiff.value.months} mois ${string}`;
    }
    if (durationUnits.value.includes('years')) {
        string = `${timeDiff.value.years} ans ${string}`;
    }
    return string;
});

onMounted(() => {
    var local = DateTime.local(2017);
    console.log(local.zoneName); //=> 'America/New_York'
    window.setInterval(() => {
        endTime.value = DateTime.now();
    }, 1000);
});
</script>