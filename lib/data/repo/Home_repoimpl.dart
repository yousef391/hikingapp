import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:geocode/geocode.dart';


import 'package:geolocator/geolocator.dart';
import 'package:hiking_app/core/utils/api_service.dart';
import 'package:hiking_app/data/models/Group.dart';
import 'package:hiking_app/data/models/trips.dart';
import 'package:hiking_app/data/repo/home_repo.dart';

import '../../core/utils/Failure.dart';

class Homerepoimpl implements Homerepo {
  Homerepoimpl({required this.api_services});
  final Api_services api_services;

  @override
  Future<Either<Failure, List<GroupM>>> getgroups(String token) async {
    List<GroupM> groups_list = [];
    try {
      var response = await api_services.getservice('/Groups/');

      for (var element in response.data) {
        groups_list.add(GroupM.fromjson(element));
      }

      return right(groups_list);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future<Either<Failure, List<TripM>>> gettrips() async {
    List<TripM> trip_list = [];
    try {
      var response = await api_services.getservice('/trips/');

      for (var element in response.data) {
        print(element);
        trip_list.add(TripM.fromjson(element));
      }

      return right(trip_list);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(servicefailure.dioerror(e));
      } else {
        return Left(servicefailure('there is an error try again'));
      }
    }
  }

  @override
  Future<Either<Failure,String>> gettcurrentposition() async {

    // Check location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
      }
    }
     if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
  } 

    var pos = await Geolocator.getCurrentPosition();

    GeoCode geoCode = GeoCode();
    
    try {
      Address address = await geoCode.reverseGeocoding(
          latitude: pos.latitude, longitude: pos.longitude);
         
return right('${address.region} ');
      
    } catch (e) {
     return left(Failure('error'));
    }

    
  }
}
