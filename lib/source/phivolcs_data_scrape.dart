import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/source/database.dart';
import 'dart:io' show ContentType, Cookie, HttpClientRequest;
import 'package:universal_html/controller.dart';

class PhivolcsDataScrape {
  static Future getPhivolcsData() async {
    final eventListController = WindowController();
    String phivolcsUrl = "https://earthquake.phivolcs.dost.gov.ph/";

    await eventListController.openHttp(
      uri: Uri.parse(phivolcsUrl),
      method: 'GET',
      onResponse: (HttpClientResponse response) {
        print('Status code: ${response.statusCode}');
      },
    );
    final eventAttributes = eventListController.window.document
        .querySelector(
            'body > div > table:nth-child(4) > tbody > tr:nth-child(2) > td.auto-style91 > span.auto-style70 > a')
        ?.attributes;

    if (eventAttributes == null) {
      return;
    }

    String parsedHrefLink = eventAttributes['href']!.replaceAll(r"\", '/');
    final url = Uri.parse("$phivolcsUrl$parsedHrefLink");
    final response = await http.get(url);
    dom.Document html = dom.Document.html(response.body);
//  > td > div > table > tbody > tr > td:nth-child(1) > table > tbody > tr > td > span > font
    final eventId = html
        .querySelectorAll('body > div > table > tbody > tr')[2]
        .querySelectorAll('td > div > table > tbody > tr > td')[0]
        .querySelector('table > tbody > tr > td > span > font')!
        .text
        .trim();

    // body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(1) > td:nth-child(2) > p > b > span
    final eventDate = html
        .querySelectorAll('body > div > table > tbody > tr')[1]
        .querySelectorAll('td > table > tbody > tr')[0]
        .querySelectorAll('td')[1]
        .querySelector('p > b > span')!
        .text
        .trim();
    // body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(2) > td:nth-child(2) > p > b > span
    final location = html
        .querySelectorAll('body > div > table > tbody > tr')[1]
        .querySelectorAll('td > table > tbody > tr')[1]
        .querySelectorAll('td')[1]
        .querySelector('p > b > span')!
        .text
        .trim();
    // body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(3) > td:nth-child(2) > p > b > span
    final depthOfFocus = html
        .querySelectorAll('body > div > table > tbody > tr')[1]
        .querySelectorAll('td > table > tbody > tr')[2]
        .querySelectorAll('td')[1]
        .querySelector('p > b > span')!
        .text
        .trim();
    // body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(4) > td:nth-child(2) > p > b > span
    final origin = html
        .querySelectorAll('body > div > table > tbody > tr')[1]
        .querySelectorAll('td > table > tbody > tr')[3]
        .querySelectorAll('td')[1]
        .querySelector('p > b > span')!
        .text
        .trim();
// body > div > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(5) > td:nth-child(2) > p > font > b > span
    final magnitude = html
        .querySelectorAll('body > div > table > tbody > tr')[1]
        .querySelectorAll('td > table > tbody > tr')[4]
        .querySelectorAll('td')[1]
        .querySelector('p > font > b > span')!
        .text
        .trim();

    final EarthquakeEvent event = EarthquakeEvent(
        id: eventId,
        dateTime: eventDate,
        location: location,
        depthOfFocus: depthOfFocus,
        origin: origin,
        magnitude: magnitude);

    // print('$eventId,$eventDate,$location,$depthOfFocus,$origin,$magnitude');

    await DbFirestore.registerEvent(event);
  }
}
