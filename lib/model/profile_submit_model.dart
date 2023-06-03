

class ProfileSubmitModel {
  bool? status;
  String? response;

  ProfileSubmitModel({
    this.status,
    this.response,
  });

  factory ProfileSubmitModel.fromJson(Map<String, dynamic> json) => ProfileSubmitModel(
    status: json["status"],
    response: json["response"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "response": response,
  };
}
