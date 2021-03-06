// ignore_for_file: prefer_collection_literals

class Address {
  String? flatNumber;
  String? city;
  String? state;
  String? fullAddress;
  double? lat;
  double? lng;
  String? status;

  Address(
      {this.flatNumber,
      this.city,
      this.state,
      this.fullAddress,
      this.lat,
      this.lng,
      this.status});

  Address.fromJson(Map<String, dynamic> json) {
    flatNumber = json['flatNumber'];
    city = json['city'];
    state = json['state'];
    fullAddress = json['fullAddress'];
    lat = json['lat'];
    lng = json['lng'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['flatNumber'] = flatNumber;
    data['city'] = city;
    data['state'] = state;
    data['fullAddress'] = fullAddress;
    data['lat'] = lat;
    data['lng'] = lng;
    data['status'] = status;
    return data;
  }
}
