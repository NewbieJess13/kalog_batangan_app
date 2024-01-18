const { onSchedule } = require("firebase-functions/v2/scheduler");
const firebase = require("firebase-admin");
const puppeteer = require("puppeteer");

const chromium = require("@sparticuz/chromium");

firebase.initializeApp();

var firestore = firebase.firestore();


exports.fetchLatestPhivolcsEvent = onSchedule({
    memory: "4GiB",
    timeoutSeconds: 60,
    schedule: "*/1 * * * *"
}, async (event) => {
    const baseUrl = "https://earthquake.phivolcs.dost.gov.ph/";

    chromium.setHeadlessMode = true;

    const browser = await puppeteer.launch({ args: chromium.args, headless: chromium.headless, executablePath: await chromium.executablePath() });
    const page = await browser.newPage();

    await page.goto(baseUrl, { waitUntil: "domcontentloaded" });


    await page.click("body > div > table:nth-child(4) > tbody > tr:nth-child(2) > td.auto-style91 > span.auto-style70 > a");

    // test = await page.$eval("body > div > table > tbody > tr:nth-child(3) > td > div > table > tbody > tr > td:nth-child(1) > table > tbody > tr > td > span > font",el => el.)

    const eventData = await page.evaluate(() => {
        const eventId = document.querySelector("body > div > table > tbody > tr:nth-child(3) > td > div > table > tbody > tr > td:nth-child(1) > table > tbody > tr > td > span > font").textContent.trim();
        const dateTime = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(1) > td:nth-child(2) > p > b > span").textContent.trim();
        const location = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > p > b > span").textContent.trim();
        const depth = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(3) > td:nth-child(2) > p > b > span").textContent.trim();
        const origin = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(4) > td:nth-child(2) > p > b > span").textContent.trim();
        const magnitude = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(5) > td:nth-child(2) > p > font > b > span").textContent.trim();
        const expectDamage = document.querySelector("body > div > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(1) > td:nth-child(2) > p > b > span").textContent.trim();
        const expectAftershocks = document.querySelector("body > div > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > p > b > span").textContent.trim();


        var splitDateTime = dateTime.split("-");
        let eventMap = {
            "event_id": eventId,
            "date": splitDateTime[0].trim(),
            "time": splitDateTime[1].trim(),
            "timestamp": Date.now(),
            "location": location,
            "depth": depth,
            "origin": origin,
            "magnitude": magnitude,
            "expect_damage": expectDamage,
            "expect_aftershocks": expectAftershocks,
        };

        return eventMap;
    });
    console.log(eventData);
    const eventRef = firestore.collection("events").doc(eventData["event_id"]);
    if (JSON.stringify(eventData) != "{}") {
        if (eventData["location"].includes("Batangas")) {
            const eventSnapshot = await eventRef.get();
            if (!eventSnapshot.exists) {
                await eventRef.set(eventData);
            }
        }
    }

    await browser.close();

});

