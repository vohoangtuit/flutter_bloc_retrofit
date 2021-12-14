class UserModel{
  String? id;
  String? account;
  String? name;
  String? role;
  String? createdAt;
  String? updatedAt;
  String? email;

  Position? position;

  UserModel({this.id, this.account, this.name, this.role,
      this.createdAt, this.updatedAt, this.email,this.position});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    account = json['account'];
    name = json['name'];
    role = json['role'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    email = json['email'];

    if(json['position'] !=null){
      position =Position.fromJson(json['position']);
    }

  }

}
class Position{
  double? latitude;
  double? longitude;

  Position({this.latitude, this.longitude});

  Position.fromJson(Map<String, dynamic> json) {
    latitude = json['lat'];
    longitude = json['lng'];
  }
}