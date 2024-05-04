
import 'package:dartz/dartz.dart';

import 'package:hiking_app/core/utils/Failure.dart';
import 'package:hiking_app/data/models/Group.dart';
import 'package:hiking_app/data/models/trips.dart';

abstract class Homerepo {
Future<Either<Failure, List<GroupM>>> getgroups(String token );
Future<Either<Failure, List<TripM>>> gettrips();
Future< Either<Failure, String>> gettcurrentposition();
}