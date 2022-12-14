class ServicesModel {
  int? categoryId;
  String? imageBase64;
  String? location;
  String? phoneNumber;

  ServicesModel(
      {this.categoryId, this.imageBase64, this.location, this.phoneNumber});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    imageBase64 = json['imageBase64'];
    location = json['location'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['imageBase64'] = this.imageBase64;
    data['location'] = this.location;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}