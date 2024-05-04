



class UserM {
   UserM({required this.id , required this.email ,required this.group_owner, required this.phone ,required this.address ,required this.username ,}) ;
  int id;
  String phone;
  bool group_owner;
  String address;
  String email;
  String username;
  late String _token;

  String get token => _token;
 
 set token(String value) {
 if (value.isNotEmpty) {
 _token = value;
 }
 }

  factory UserM.fromjson(Map<String,dynamic>  json) {
    return UserM(id: json['id'], email: json['email'], username: json['username'], phone: json['phone'] ,address: json['address'] ,group_owner: json['Group_owner']);
  }

}