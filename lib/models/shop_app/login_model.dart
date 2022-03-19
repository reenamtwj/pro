class shopLoginModel {
  late bool status;
  late String message;
  late UserData? data;

  shopLoginModel.fromJson(Map<String, dynamic> Json) {
    status = Json['status'];
    message = Json['message'];
    if (Json['data'] != null) {
      data = UserData.formJson(Json['data']);
    } else {
      data = null;
    }
  }
}

class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData.formJson(Map<String, dynamic> Json) {
    this.id = Json['id'];
    this.name = Json['name'];
    this.email = Json['email'];
    this.phone = Json['phone'];
    this.image = Json['image'];
    this.points = Json['points'];
    this.credit = Json['credit'];
    this.token = Json['token'];
  }
}
