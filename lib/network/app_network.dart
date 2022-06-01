import 'dart:convert';

import 'package:ecommerce/database/short_storage.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/network/app_url.dart';
import 'package:ecommerce/network/models/requests/net_req_auth.dart';
import 'package:ecommerce/network/models/responses/net_res_auth.dart';
import 'package:ecommerce/network/models/responses/net_res_product.dart';
import 'package:ecommerce/network/models/services/auth_service.dart';
import 'package:ecommerce/network/models/helpers/network_helpers.dart';
import 'package:http/http.dart' as http;

class AppNetwork {
  // create singleton
  static final AppNetwork instance = AppNetwork._internal();
  final NetworkHelpers helper = NetworkHelpers();
  AppNetwork._internal();

  void getProducts(Function(List<NetResProductItem>) completion) async {
    _get(AppURL.getProducts, (netResponse) {
      final body = netResponse.success;
      var productsList = body as List<dynamic>;
      var products =
          productsList.map((e) => NetResProductItem.fromJson(e)).toList();
      completion(products);
    });
  }

  void _get(String url, Function(NetResponse) completion,
      {bool authNeeded = false}) async {
    var headers = await NetworkHelpers().loginHeaders;

    if (authNeeded) {
      headers = await NetworkHelpers().headers;
    }

    http.get(Uri.parse(url), headers: headers).then((response) {
      final json = jsonDecode(response.body);
      final body = NetResponse.fromJson(json);
      completion(body);
    });
  }

  void _post(
      String url, Map<String, dynamic> body, Function(NetResponse) completion,
      {bool authNeeded = false}) async {
    var headers = await NetworkHelpers().loginHeaders;

    if (authNeeded) {
      headers = await NetworkHelpers().headers;
    }

    http.post(Uri.parse(url), body: body, headers: headers).then((response) {
      final json = jsonDecode(response.body);
      final body = NetResponse.fromJson(json);
      completion(body);
    });
  }
}
