
import 'package:dartz/dartz.dart';
import 'package:hiking_app/core/utils/Failure.dart';
import 'package:hiking_app/data/models/usermodel.dart';

abstract class Authrepo {
Future<Either<Failure, UserM>> login(String email,String password);

}