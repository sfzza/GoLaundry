// ignore_for_file: non_constant_identifier_names

class Customers {
  String? id_cust;
  String? cust_email;
  String? cust_name;
  String? cust_password;
  String? cust_phone;
  String? status;

  Customers({
    this.id_cust,
    this.cust_email,
    this.cust_name,
    this.cust_password,
    this.cust_phone,
  });
  Customers.fromJson(Map<String, dynamic> json) {
    id_cust = json['id_cust'];
    cust_email = json['cust_email'];
    cust_name = json['cust_name'];
    cust_password = json['cust_password'];
    cust_phone = json['cust_phone'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_cust'] = id_cust;
    data['cust_email'] = cust_email;
    data['cust_email'] = cust_email;
    data['cust_password'] = cust_password;
    data['cust_phone'] = cust_phone;
    data['status'] = status;
    return data;
  }
}
