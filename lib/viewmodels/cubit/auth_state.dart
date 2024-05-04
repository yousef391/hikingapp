part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {

}
// ignore: must_be_immutable
final class Authsucces extends AuthState {
  Authsucces(this.user);
  UserM user;
}
// ignore: must_be_immutable
final class Authfailure extends AuthState {
  String message;
  Authfailure(this.message);
}
final class Authloading extends AuthState {}
