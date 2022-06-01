import 'package:ecommerce/database/short_storage.dart';
import 'package:ecommerce/helpers/global_methods.dart';
import 'package:ecommerce/network/models/requests/net_req_auth.dart';
import 'package:ecommerce/network/models/responses/net_res_auth.dart';
import 'package:ecommerce/network/models/services/auth_service.dart';

class LauncherInteractor {
  LauncherInteractor();

  void hasValidAccssToken(Function(bool isValid) callback) async {
    final accessToken = await ShortStorage.get(StorageKeys.appAccessToken);
    final refreshToken = await ShortStorage.get(StorageKeys.appRefreshToken);

    appLog("stored access token is $accessToken");
    appLog("stored refresh token is $refreshToken");
    if (accessToken == null) {
      callback(false);
      return;
    }

    AuthService(AuthRouter.VERIFY_TOKEN)
      ..body(NetReqVerifyAccessToken(accessToken: accessToken))
      ..send<NetResValidToken>((success, error) {
        if (success?.isValid == true) {
          callback(true);
        } else {
          callback(false);
        }
      });
  }

  void renewAccessToken(Function(bool isRenewed) callback) async {
    final refreshToken = await ShortStorage.get(StorageKeys.appRefreshToken);
    if (refreshToken == null) {
      callback(false);
      return;
    }

    AuthService(AuthRouter.REFRESH_TOKEN)
      ..body(NetReqRefreshToken(refreshToken: refreshToken))
      ..send<NetResRefreshToken>((success, error) {
        if (success?.accessToken != null) {
          ShortStorage.set(StorageKeys.appAccessToken, success!.accessToken);
          appLog("New access Token is: ${success.accessToken}");
          callback(true);
        } else {
          callback(false);
        }
      });
  }
}
