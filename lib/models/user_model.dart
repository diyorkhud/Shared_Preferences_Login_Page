
class User{
  late String name;
  late String password;

  User({required this.name, required this.password});
  User.from({required this.name, required this.password,});

  User.fromJson(Map < String, dynamic > json)
      : name = json ['name'] ,
        password = json ['password'] ;


  Map<String, dynamic > toJson()=> {
    'name' : name ,
    'password' : password ,
  };

}

class Account{
  late String name;
  late String email;
  late String phone;
  late String password;
  late String confirm;

  Account({required this.name, required this.email, required this.phone, required this.password, required this.confirm,});
  factory Account.fromJson(Map<String, dynamic> parsedJson) {
    return Account(
        name: parsedJson['name'] ?? "",
        email: parsedJson['email'] ?? "",
        phone: parsedJson['phone'] ?? "",
        password: parsedJson['password'] ?? "",
        confirm: parsedJson['confirm'] ?? "",
    );

  }
        Map < String, dynamic > toJson(){
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "confirm": confirm,
    };

  }

}