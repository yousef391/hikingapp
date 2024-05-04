

class RequestM {
   RequestM({required this.id  ,required this.user,required this.trip ,}) ;
  int id;
  String user;
  String trip;
 

  factory RequestM.fromjson(Map<String,dynamic>  json) {
    return RequestM(id: json['id'] ,user: json['wilaya'] ,trip: json['trip']);
  }

}