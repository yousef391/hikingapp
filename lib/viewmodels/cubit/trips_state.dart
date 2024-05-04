part of 'trips_cubit.dart';

@immutable

sealed class getstripsstate{}

final class getstripsInitial extends getstripsstate{

}
// ignore: must_be_immutable
 class getstripssucces extends getstripsstate{
  List<TripM> groupslist;
  getstripssucces (this.groupslist);
  
}
// ignore: must_be_immutable
final class getstripsfailure extends getstripsstate{
  String message;
  getstripsfailure (this.message);
}
final class getstripsloading extends getstripsstate{}
