abstract class Decodable {
  Decodable();
  Decodable.fromJson(Map<String, dynamic> json);
}

abstract class Encodable {
  Map<String, dynamic> toJson();
}

abstract class Codable implements Encodable, Decodable {
  Codable();
  Codable.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
