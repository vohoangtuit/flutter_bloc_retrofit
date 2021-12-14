class ResponseModel {
  String? status;
  dynamic payload;

  ResponseModel({this.status, this.payload});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    payload = json['payload'];

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['payload'] = payload;

    return data;
  }

  @override
  String toString() {
    return 'ResponseModel{status: $status, payload: $payload}';
  }
}