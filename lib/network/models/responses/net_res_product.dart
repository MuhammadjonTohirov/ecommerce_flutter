class NetResponse {
  NetResponse({
    required this.success,
    required this.code,
    required this.error,
  });

  dynamic success;
  dynamic error;
  int code;

  factory NetResponse.fromJson(Map<String, dynamic> json) => NetResponse(
        success: json["success"],
        code: json["code"],
        error: json['error'],
      );
}

class NetResProductItem {
  NetResProductItem({
    required this.id,
    required this.product,
    required this.count,
    required this.incomePrice,
    required this.wholePrice,
    required this.singlePrice,
    required this.session,
    required this.images,
    required this.fields,
  });

  int id;
  NetResProductDetails product;
  int count;
  double incomePrice;
  double wholePrice;
  double singlePrice;
  String session;
  List<NetResImage> images;
  List<NetResProductField> fields;

  factory NetResProductItem.fromJson(Map<String, dynamic> json) =>
      NetResProductItem(
        id: json["id"],
        product: NetResProductDetails.fromJson(json["product"]),
        count: json["count"],
        incomePrice: json["income_price"],
        wholePrice: json["whole_price"],
        singlePrice: json["single_price"],
        session: json["session"],
        images: List<NetResImage>.from(
            json["images"].map((x) => NetResImage.fromJson(x))),
        fields: List<NetResProductField>.from(
            json["fields"].map((x) => NetResProductField.fromJson(x))),
      );
}

class NetResProductDetails {
  NetResProductDetails({
    required this.id,
    required this.title,
    required this.barQrCode,
    required this.unit,
    required this.description,
  });

  int id;
  String title;
  String barQrCode;
  NetResUnit unit;
  String description;

  factory NetResProductDetails.fromJson(Map<String, dynamic> json) =>
      NetResProductDetails(
        id: json["id"],
        title: json["title"],
        barQrCode: json["bar_qr_code"],
        unit: NetResUnit.fromJson(json["unit"]),
        description: json["description"],
      );
}

class NetResUnit {
  NetResUnit({
    required this.title,
  });

  String title;

  factory NetResUnit.fromJson(Map<String, dynamic> json) => NetResUnit(
        title: json["title"],
      );
}

class NetResProductField {
  NetResProductField({
    required this.title,
    required this.type,
    required this.value,
  });

  String title;
  NetResProductType type;
  String value;

  factory NetResProductField.fromJson(Map<String, dynamic> json) =>
      NetResProductField(
        title: json["title"],
        type: NetResProductType.fromJson(json["type"]),
        value: json["value"],
      );
}

class NetResProductType {
  NetResProductType({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory NetResProductType.fromJson(Map<String, dynamic> json) =>
      NetResProductType(
        id: json["id"],
        name: json["name"],
      );
}

class NetResImage {
  NetResImage({
    required this.image,
    required this.hint,
    required this.description,
  });

  String image;
  String hint;
  String description;

  factory NetResImage.fromJson(Map<String, dynamic> json) => NetResImage(
        image: json["image"],
        hint: json["hint"],
        description: json["description"],
      );
}
