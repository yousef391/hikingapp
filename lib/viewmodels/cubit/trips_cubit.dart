import 'package:bloc/bloc.dart';
import 'package:hiking_app/data/models/trips.dart';
import 'package:hiking_app/data/repo/Home_repoimpl.dart';
import 'package:meta/meta.dart';

part 'trips_state.dart';

class TripsCubit extends Cubit<getstripsstate> {
  TripsCubit(this.homerepoimpl) : super(getstripsInitial());

   Homerepoimpl homerepoimpl;
  Future<void> getstrips() async {
    emit(getstripsloading());

    var groupsresult = await homerepoimpl.gettrips();

    groupsresult.fold((l) => emit(getstripsfailure(l.message)), (r) {
      emit(getstripssucces(r));
    });
  }
}
