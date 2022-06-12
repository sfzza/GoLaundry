class Pricing {
  // String? id_price;
  String? id_laundry;
  int? tshirt;
  int? dress;
  int? bottom;
  int? underclothes;
  int? jeans;
  int? bag;
  int? shoes;
  int? bedsheet;
  int? blanket;

  Pricing(
      {
      // this.id_price,
      this.id_laundry,
      this.tshirt,
      this.dress,
      this.bottom,
      this.underclothes,
      this.jeans,
      this.bag,
      this.shoes,
      this.bedsheet,
      this.blanket});

  Pricing.fromJson(Map<String, dynamic> json) {
    // id_price = json['id_price'];
    id_laundry = json['id_laundry'];
    tshirt = json['tshirt'];
    dress = json['dress'];
    bottom = json['bottom'];
    underclothes = json['underclothes'];
    jeans = json['jeans'];
    bag = json['bag'];
    shoes = json['shoes'];
    bedsheet = json['bedsheet'];
    blanket = json['blanket'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['id_price'] = id_price;
    data['id_laundry'] = id_laundry;
    data['tshirt'] = tshirt;
    data['dress'] = dress;
    data['bottom'] = bottom;
    data['underclothes'] = underclothes;
    data['jeans'] = jeans;
    data['bag'] = bag;
    data['shoes'] = shoes;
    data['bedsheet'] = bedsheet;
    data['blanket'] = blanket;
    return data;
  }
}
