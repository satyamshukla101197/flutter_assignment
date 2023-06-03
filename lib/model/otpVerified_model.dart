

class OtpVerifiedModel {
  bool? status;
  bool? profileExists;
  String? jwt;

  OtpVerifiedModel({
    this.status,
    this.profileExists,
    this.jwt,
  });

  factory OtpVerifiedModel.fromJson(Map<String, dynamic> json) => OtpVerifiedModel(
    status: json["status"],
    profileExists: json["profile_exists"],
    jwt: json["jwt"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "profile_exists": profileExists,
    "jwt": jwt,
  };
}
