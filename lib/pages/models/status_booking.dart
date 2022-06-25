class Status {
  String? statusBook;

  Status({
    this.statusBook,
  });

  Status.fromJson(Map<String, dynamic> json) {
    statusBook = json['statusBook'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['statusBook'] = statusBook;

    return data;
  }
}
