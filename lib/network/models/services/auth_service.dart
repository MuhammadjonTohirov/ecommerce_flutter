import 'package:ecommerce/network/app_url.dart';
import 'package:ecommerce/network/models/helpers/codables.dart';
import 'package:ecommerce/network/models/helpers/network_helpers.dart';
import 'package:ecommerce/network/models/responses/net_res_auth.dart';
import 'package:ecommerce/network/network_sender.dart';

enum AuthRouter { LOGIN, REFRESH_TOKEN, VERIFY_TOKEN }

abstract class NetworkServiceInterface {
  AuthRouter route;

  NetworkServiceInterface(this.route);

  Uri get url;

  Future<Map<String, String>> headers();

  void body(Encodable req);

  void send<M extends Decodable>(
      Function(M? success, dynamic error) completion);
}

class AuthService extends NetworkServiceInterface {
  AuthService(AuthRouter route) : super(route);

  late Map<String, dynamic> _body;

  @override
  Uri get url {
    switch (route) {
      case AuthRouter.LOGIN:
        return Uri.parse(AppURL.signIn);
      case AuthRouter.REFRESH_TOKEN:
        return Uri.parse(AppURL.refreshToken);
      case AuthRouter.VERIFY_TOKEN:
        return Uri.parse(AppURL.verifyToken);
    }
  }

  @override
  Future<Map<String, String>> headers() {
    return NetworkHelpers().loginHeaders;
  }

  @override
  void body(Encodable req) {
    this._body = req.toJson();
  }

  void _login(
    Function(Map<String, dynamic>? result, dynamic error) completion,
  ) {
    headers().then((value) {
      NetworkSender.post(url, _body, (response) {
        completion(response?.success, response?.error);
      }, value);
    });
  }

  void _refreshToken(
    Function(Map<String, dynamic>? result, dynamic error) completion,
  ) {
    headers().then((headers) {
      NetworkSender.post(url, _body, (response) {
        completion(response?.success, response?.error);
      }, headers);
    });
  }

  void _verifyToken(
    Function(Map<String, dynamic>? result, dynamic error) completion,
  ) {
    headers().then((headers) {
      NetworkSender.post(url, _body, (response) {
        completion(response?.success, response?.error);
      }, headers);
    });
  }

  @override
  void send<M extends Decodable>(
    Function(M? success, dynamic error) completion,
  ) {
    switch (route) {
      case AuthRouter.LOGIN:
        _login((result, error) {
          completion(
              result != null ? NetResAuth.fromJson(result) as M : null, error);
        });
        break;
      case AuthRouter.REFRESH_TOKEN:
        _refreshToken((result, error) {
          completion(
              result != null ? NetResRefreshToken.fromJson(result) as M : null,
              error);
        });
        break;
      case AuthRouter.VERIFY_TOKEN:
        _verifyToken((result, error) {
          completion(
              result != null ? NetResValidToken.fromJson(result) as M : null,
              error);
        });
        break;
    }
  }
}
