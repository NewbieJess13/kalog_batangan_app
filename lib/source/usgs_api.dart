import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:kalog_batangan_app/constants/uri_const.dart';
import 'package:kalog_batangan_app/helpers/errors.dart';
import 'package:kalog_batangan_app/models/earthquake_event.dart';
import 'package:kalog_batangan_app/models/feature.dart';

class UsgsApi {
  static Future<Either<UsgsApiError, List<Feature>>>
      getEarthquakeEvents() async {
    String requestParams =
        "?format=geojson&latitude=14.014786&longitude=120.93018&maxradius=1";
    Uri usgsUri = Uri.parse(UriConst.usgsBaseUrl + requestParams);

    http.Response response = await http.get(usgsUri);

    if (response.statusCode == 200) {
      Map<String, Object?> result = jsonDecode(response.body);

      List<Feature> features =
          (result["features"] as List).map((e) => Feature.fromJson(e)).toList();

      print(features);

      return Right(features);
    }

    return Left(UsgsApiError(
        errorCode: response.statusCode, message: "Something went wrong"));
  }
}
