import 'dart:ffi';

class Tags {
  List? tags;

  Tags({
    this.tags,
  });

  Tags.fromJson(Map<String, dynamic> json) {
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    data['tags'] = tags;

    return data;
  }
}
