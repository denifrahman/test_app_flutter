/// username : ""
/// password : ""

class LoginDto {
  LoginDto({
      String? username, 
      String? password,}){
    _username = username;
    _password = password;
}

  LoginDto.fromJson(dynamic json) {
    _username = json['username'];
    _password = json['password'];
  }
  String? _username;
  String? _password;
LoginDto copyWith({  String? username,
  String? password,
}) => LoginDto(  username: username ?? _username,
  password: password ?? _password,
);
  String? get username => _username;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = _username;
    map['password'] = _password;
    return map;
  }

}