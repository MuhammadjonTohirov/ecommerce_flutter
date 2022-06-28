import 'package:ecommerce/network/models/helpers/codables.dart';
import 'package:ecommerce/network/models/services/auth_service.dart';

class NetResAuth extends Decodable {
  NetResAuth({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.user,
  });

  String accessToken;
  String refreshToken;
  DateTime expiresIn;
  NetResAuthUser user;

  factory NetResAuth.fromJson(Map<String, dynamic> json) {
    return NetResAuth(
      accessToken: json["access_token"],
      refreshToken: json["refresh_token"],
      expiresIn: DateTime.parse(json["expires_in"]),
      user: NetResAuthUser.fromJson(json["user"]),
    );
  }
}

class NetResAuthUser extends Decodable {
  NetResAuthUser({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isActive,
  });

  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  bool isActive;

  factory NetResAuthUser.fromJson(Map<String, dynamic> json) => NetResAuthUser(
        id: json["id"],
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        isActive: json["is_active"] ?? false,
      );
}

class NetResValidToken extends Decodable {
  NetResValidToken({
    required this.isValid,
  });

  bool isValid;

  factory NetResValidToken.fromJson(Map<String, dynamic> json) =>
      NetResValidToken(
        isValid: json["token_validity"],
      );
}

class NetResRefreshToken extends Decodable {
  String accessToken;

  NetResRefreshToken({
    required this.accessToken,
  });

  factory NetResRefreshToken.fromJson(Map<String, dynamic> json) =>
      NetResRefreshToken(
        accessToken: json["access_token"],
      );
}
