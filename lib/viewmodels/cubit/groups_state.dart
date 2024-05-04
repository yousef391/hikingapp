part of 'groups_cubit.dart';

@immutable
sealed class getgroupsstate{}

final class getgroupsInitial extends getgroupsstate{

}
// ignore: must_be_immutable
final class Getgroupssucces extends getgroupsstate{
  Getgroupssucces( this.groups_list);
  List<GroupM> groups_list;
}
// ignore: must_be_immutable
final class Getgroupsfailure extends getgroupsstate{
  String message;
  Getgroupsfailure (this.message);
}
final class Getgroupsloading extends getgroupsstate{}

