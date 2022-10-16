class Server {
  String name;
  String url;
  String username;
  String password;
  String key;

  Server({
    required this.name,
    required this.url,
    required this.password,
    required this.username,
    required this.key,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
        name: json['name'] as String,
        url: json['url'] as String,
        username: json['username'] as String,
        password: json['password'] as String,
        key: json['key'] as String);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name.toString();
    data['url'] = url.toString();
    data['username'] = username.toString();
    data['password'] = password.toString();
    data['key'] = key.toString();
    return data;
  }
}
