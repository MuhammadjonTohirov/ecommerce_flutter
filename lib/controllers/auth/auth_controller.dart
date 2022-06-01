// Create class AuthController
import 'package:ecommerce/database/short_storage.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/network/models/requests/net_req_auth.dart';
import 'package:ecommerce/network/models/responses/net_res_auth.dart';
import 'package:ecommerce/network/models/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthController {
  var loginController = TextEditingController();
  var passwordController = TextEditingController();

  // Create method signIn
  void signIn(Function(bool) completion) {
    final username = loginController.text;
    final password = passwordController.text;
    AuthService(AuthRouter.LOGIN)
      ..body(NetReqLogin(username: username, password: password))
      ..send<NetResAuth>((success, error) {
        if (success != null) {
          ShortStorage.set(StorageKeys.appAccessToken, success.accessToken);
          ShortStorage.set(StorageKeys.appRefreshToken, success.refreshToken);

          appLog("Login success new access token: ${success.accessToken}");
          appLog("Login success new refresh token: ${success.refreshToken}");
          completion(true);
        } else {
          appLog("Login failure: ${error.toString()}");
          completion(false);
        }
      });
  }

  // Create method signOut
  void signOut() {}
}
