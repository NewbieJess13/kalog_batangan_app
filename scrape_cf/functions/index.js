

// const functions = require('firebase-functions');
const { onSchedule } = require("firebase-functions/v2/scheduler");
const firebase = require("firebase-admin");
const puppeteer = require("puppeteer");
const chromium = require("@sparticuz/chromium");
const https = require('https');

firebase.initializeApp();

var firestore = firebase.firestore();

let username = 'toni_13';
let password = 'Just@Once13';

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


    const eventData = await page.evaluate(() => {
        var eventId = document.querySelector("body > div > table > tbody > tr:nth-child(3) > td > div > table > tbody > tr > td:nth-child(1) > table > tbody > tr > td > span > font").textContent.trim();
        var dateTime = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(1) > td:nth-child(2) > p > b > span").textContent.trim();
        var location = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > p > b > span").textContent.trim();
        var depth = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(3) > td:nth-child(2) > p > b > span").textContent.trim();
        var origin = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(4) > td:nth-child(2) > p > b > span").textContent.trim();
        var magnitude = document.querySelector("body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(5) > td:nth-child(2) > p > font > b > span").textContent.trim();
        var expectDamage = document.querySelector("body > div > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(1) > td:nth-child(2) > p > b > span").textContent.trim();
        var expectAftershocks = document.querySelector("body > div > table > tbody > tr:nth-child(4) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > p > b > span").textContent.trim();
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
            if (expectDamage == "YES") {
                var contacts = [];
                firestore.collection("numbers").get().then(snapshot => {
                    snapshot.forEach(doc => {
                        contacts.push(doc["phone_num"]);
                    });
                });
                let message = `From: Kalog Batangan,\nAn earthquake has been recorded in ${eventData["location"]} with a magnitude of ${eventData[magnitude]} today ${eventData[dateTime]}.\n\nPlease be alert and contact the local PDRRMO office at (043) 786 0693, Keep safe mga Kabayan. `;
                let messageData = JSON.stringify({
                    'to': contacts,
                    'body': message
                });

                let options = {
                    hostname: 'api.bulksms.com',
                    port: 443,
                    path: '/v1/messages',
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'Content-Length': messageData.length,
                        'Authorization': 'Basic ' + Buffer.from(username + ':' + password).toString('base64')
                    }
                };

                let req = https.request(options, (resp) => {
                    console.log('statusCode:', resp.statusCode);
                    let data = '';
                    resp.on('data', (chunk) => {
                        data += chunk;
                    });
                    resp.on('end', () => {
                        console.log("Response:", data);
                    });
                });

                req.on('error', (e) => {
                    console.error(e);
                });

                req.write(messageData);
                req.end();
            }
        }
    }

    await browser.close();

});

