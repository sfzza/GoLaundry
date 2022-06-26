class Pricing {
  // String? id_price;

  int? price;

  Pricing({
    // this.id_price,

    this.price,
  });

  Pricing.fromJson(Map<String, dynamic> json) {
    // id_price = json['id_price'];

    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    // data['id_price'] = id_price;

    data['price'] = price;

    return data;
  }
}
