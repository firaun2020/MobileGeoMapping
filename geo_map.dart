import 'dart:convert';

import 'package:flutter/main.dart';
import 'package:http/http.dart' as http;

class GeoMapping {
  String key = "Your-Key-Here";
  double latFromAd;
  double longFromAd;
  http.Response apiResponse;
  var respondedData;
  Map<String, double> cordMap = {"lat": 0, "long": 0};

  Future getNetworkData({@required address}) async {
    http.Response apiResponse = await http.get(
        "https://maps.googleapis.com/maps/api/geocode/json?address=$address&key=$key");
    respondedData = jsonDecode(apiResponse.body);
  }

  Map getNetworkData2() {
    latFromAd = respondedData["results"][0]["geometry"]["location"]["lat"];
    longFromAd = respondedData["results"][0]["geometry"]["location"]["lng"];
    cordMap["lat"] = latFromAd;
    cordMap["long"] = longFromAd;
    print(cordMap);

    return cordMap;

    /*  if (apiResponse.statusCode == 200) {
      String responseData = apiResponse.body;
      return jsonDecode(responseData);
    } else {
      print(apiResponse.statusCode);
    }*/
  }
}
