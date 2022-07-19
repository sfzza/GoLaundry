// ignore_for_file: prefer_collection_literals

class DelivAddress {
  String? delivFlatNumber;
  String? delivCity;
  String? delivState;
  String? delivAddress;
  double? delivLat;
  double? delivLng;

  DelivAddress({
    this.delivFlatNumber,
    this.delivCity,
    this.delivState,
    this.delivAddress,
    this.delivLat,
    this.delivLng,
  });

  DelivAddress.fromJson(Map<String, dynamic> json) {
    delivFlatNumber = json['delivFlatNumber'];
    delivCity = json['delivCity'];
    delivState = json['delivState'];
    delivAddress = json['delivAddress'];
    delivLat = json['delivLat'];
    delivLng = json['delivLng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['delivFlatNumber'] = delivFlatNumber;
    data['delivCity'] = delivCity;
    data['delivState'] = delivState;
    data['delivAddress'] = delivAddress;
    data['delivLat'] = delivLat;
    data['delivLng'] = delivLng;

    return data;
  }
}
