import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hiking_app/core/utils/api_service.dart';
import 'package:hiking_app/data/models/usermodel.dart';
import 'package:hiking_app/data/repo/Auth_repo.dart';


import '../../core/utils/Failure.dart';

class Authrepoimpl implements Authrepo {
  Authrepoimpl({required this.api_services});
  final Api_services api_services;

  Future<Either<Failure, UserM>> login(String email, String password) async {
    try {
   

      var response = await api_services
          .postservice('/login/', {'email': email, 'password': password});
      String token = response.data['access'];
      var getresponse = await api_services.getservice('/users/$email/');
      UserM user = UserM.fromjson(getresponse.data);
      user.token = token;
      return right(user);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }
}
