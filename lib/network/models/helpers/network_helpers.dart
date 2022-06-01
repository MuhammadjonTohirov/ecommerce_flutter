import 'package:ecommerce/database/short_storage.dart';

class NetworkHelpers {
  Future<Map<String, String>> get headers async {
    var token = await ShortStorage.get(StorageKeys.appAccessToken);

    var result = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (token?.isNotEmpty ?? false) {
      result['Authorization'] = "Bearer $token";
    }

    return result;
  }

  Future<Map<String, String>> get loginHeaders async {
    var result = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    return result;
  }
}
