class Path {
  late Dev dev;
  late Dev staging;
  late Dev production;

  Path({required this.dev, required this.staging, required this.production});

  Path.fromJson(Map<String, dynamic> json) {
    dev =  Dev.fromJson(json['dev']);
    staging =  new Dev.fromJson(json['staging']);
    production =  new Dev.fromJson(json['production']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dev'] = this.dev.toJson();
    data['staging'] = this.staging.toJson();
    data['production'] = this.production.toJson();
    return data;
  }
}

class Dev {
  late String login;
  late String register;

  Dev({required this.login, required this.register});

  Dev.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    register = json['register'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = this.login;
    data['register'] = this.register;
    return data;
  }
}