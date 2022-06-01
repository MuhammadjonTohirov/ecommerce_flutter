import 'package:ecommerce/network/models/helpers/codables.dart';
import 'package:ecommerce/network/models/services/auth_service.dart';

class NetReqLogin extends Encodable {
  NetReqLogin({
    required this.username,
    required this.password,
  });

  String username;
  String password;

  factory NetReqLogin.fromJson(Map<String, dynamic> json) => NetReqLogin(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
      };
}

class NetReqVerifyAccessToken extends Encodable {
  String accessToken;

  NetReqVerifyAccessToken({required this.accessToken});

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
      };
}

class NetReqVerifyRefreshToken extends Codable {
  String refreshToken;

  NetReqVerifyRefreshToken({required this.refreshToken});

  Map<String, dynamic> toJson() => {
        "refresh_token": refreshToken,
      };
}

class NetReqRefreshToken extends Codable {
  String refreshToken;

  NetReqRefreshToken({required this.refreshToken});

  Map<String, dynamic> toJson() => {
        "refresh_token": refreshToken,
      };
}
