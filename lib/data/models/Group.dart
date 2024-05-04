







class GroupM {
   GroupM({required this.id  ,required this.owner,required this.wilaya , required this.name , required this.image_url}) ;
  int id;
  String name;
  List owner;
  String wilaya;
  String image_url;
 
 
  factory GroupM.fromjson(Map<String,dynamic>  json) {
    return GroupM(id: json['id'] ,wilaya: json['wilaya'] ,owner: json['owner'] , name: json['name'] , image_url :json['image']);
  }

}