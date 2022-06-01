import 'dart:convert';

import 'package:ecommerce/helpers/global_methods.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/network/models/helpers/network_helpers.dart';
import 'package:ecommerce/network/models/responses/net_res_product.dart';

class NetworkSender {
  static void get(Uri url, Function(NetResponse response) completion,
      {bool authNeeded = false}) async {
    var headers = await NetworkHelpers().loginHeaders;

    if (authNeeded) {
      headers = await NetworkHelpers().headers;
    }
    http.get(url, headers: headers).then((response) {
      final json = jsonDecode(response.body);
      final body = NetResponse.fromJson(json);
      completion(body);
    });
  }

  static void post(
      Uri url,
      Map<String, dynamic> body,
      Function(NetResponse? response) completion,
      Map<String, String> headers) async {
    try {
      appLog("---- ---- ---- REQUEST ---- ---- ----");
      appLog("$url");
      appLog("$body");
      appLog("$headers");
      appLog("---- ---- ---- REQUEST END ---- ---- ----");
      http.post(url, headers: headers, body: jsonEncode(body)).then((response) {
        final json = jsonDecode(response.body);
        final body = NetResponse.fromJson(json);

        appLog("---- ---- ---- RESPONSE ---- ---- ----");
        appLog(json);
        appLog("---- ---- ---- RESPONSE END ---- ---- ----");
        completion(body);
      });
    } catch (e) {
      completion(null);
    }
  }
}
