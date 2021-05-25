class AuthUserModel {
  int id;
  String createdAt;
  String user;
  String email;
  String avatar;
  String supposedlyEncryptedPassword;
  String fakeToken;

  AuthUserModel(
      {this.id,
      this.createdAt,
      this.user,
      this.email,
      this.avatar,
      this.supposedlyEncryptedPassword,
      this.fakeToken});

  AuthUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    user = json['user'];
    email = json['email'];
    avatar = json['avatar'];
    supposedlyEncryptedPassword = json['supposedlyEncryptedPassword'];
    fakeToken = json['fakeToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['user'] = this.user;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['supposedlyEncryptedPassword'] = this.supposedlyEncryptedPassword;
    data['fakeToken'] = this.fakeToken;
    return data;
  }
}
