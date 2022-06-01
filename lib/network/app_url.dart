class AppURL {
  static const String baseUrl = 'http://192.168.1.64:8000/';
  static const String getProducts = '$baseUrl' + 'sales/products';
  static const String signIn = '$baseUrl' + 'crm/api/login/';
  static const String verifyToken = '$baseUrl' + 'crm/api/token/verify/';
  static const String refreshToken = '$baseUrl' 'crm/api/token/refresh/';

  static const String randomImage = 'https://dog.ceo/api/breeds/image/random';
}
