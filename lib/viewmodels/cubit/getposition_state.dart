part of 'getposition_cubit.dart';

@immutable
sealed class GetpositionState {}

final class GetpositionInitial extends GetpositionState {}
// ignore: must_be_immutable
final class Getpositionsucces extends GetpositionState {
  String location;
  Getpositionsucces({required this.location});
}
final class Getpositionfailure extends GetpositionState {}
final class Getpositionloading extends GetpositionState {}
