








class TripM {
   TripM({required this.id  , required this.groupid , required this.leadersids,required this.datededarrive , required this.datededepart, required this.difficulte , required this.distance , required this.duration , required this.lieuxdarrive ,
    required this.lieuxdedepart  , required this.participantsids , required this.trip_image}) ;
  int id;
  String datededepart;
  dynamic datededarrive;
  int difficulte;
  String lieuxdedepart;
  String lieuxdarrive;
  int duration;
  int distance;
  dynamic groupid;
  dynamic leadersids;
  String trip_image;

  dynamic participantsids;
 

  factory TripM.fromjson(Map<dynamic,dynamic>  json) {
    return TripM(id: json['id'] ,leadersids: json['leaders'], datededarrive: json['datededarrivé'],
     datededepart:  json['datededepart'], difficulte: json['difficulté'],
      distance: json['distance'], duration:json['duration'], lieuxdarrive: json['lieuxdarrivé'], 
      lieuxdedepart: json['lieuxdedepart'], groupid: json['organizer'], participantsids:json['Participant'] , trip_image : json['image']);
  }

}