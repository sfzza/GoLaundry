// ignore_for_file: non_constant_identifier_names

class Booking {
  String? id_booking;
  String? id_laundry;
  String? id_cust;
  String? laundry_name;
  int? laundry_fare;
  String? cust_email;
  String? cust_address;
  String? pickup;
  int? price;
  String? statusBook;
  int? quantity;
  String? payment;
  String? delivAddress;

  Booking(
      {this.id_booking,
      this.price,
      this.cust_address,
      this.cust_email,
      this.id_cust,
      this.id_laundry,
      this.laundry_fare,
      this.laundry_name,
      this.pickup,
      this.statusBook,
      this.quantity,
      this.payment,
      this.delivAddress});

  Booking.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    cust_email = json['cust_email'];
    cust_address = json['cust_address'];
    id_cust = json['id_cust'];
    id_laundry = json['id_laundry'];
    laundry_name = json['laundry_name'];
    laundry_fare = json['laundry_fare'];
    id_booking = json['id_booking'];
    pickup = json['pickup'];
    statusBook = json['statusBook'];
    quantity = json['quantity'];
    payment = json['payment'];
    delivAddress = json['delivAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['price'] = price;
    data['cust_email'] = cust_email;
    data['cust_address'] = cust_address;
    data['id_cust'] = id_cust;
    data['id_laundry'] = id_laundry;
    data['laundry_name'] = laundry_name;
    data['laundry_fare'] = laundry_fare;
    data['id_booking'] = id_booking;
    data['pickup'] = pickup;
    data['statusBook'] = statusBook;
    data['quantity'] = quantity;
    data['payment'] = payment;
    data['delivAddress'] = delivAddress;
    return data;
  }

  Booking.fromSnapshot(snapshot)
      : id_booking = snapshot.id,
        id_cust = snapshot.data()["id_cust"],
        id_laundry = snapshot.data()["id_laundry"],
        cust_address = snapshot.data()["cust_address"],
        laundry_fare = snapshot.data()["laundry_fare"],
        laundry_name = snapshot.data()["laundry_name"],
        cust_email = snapshot.data()["cust_email"],
        price = snapshot.data()["price"];
}
