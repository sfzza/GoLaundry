class Payment {
  String? payment;

  Payment({
    this.payment,
  });

  Payment.fromJson(Map<String, dynamic> json) {
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['payment'] = payment;

    return data;
  }
}
