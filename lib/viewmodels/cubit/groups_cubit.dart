import 'package:bloc/bloc.dart';
import 'package:hiking_app/data/models/Group.dart';
import 'package:hiking_app/data/repo/Home_repoimpl.dart';
import 'package:meta/meta.dart';

part 'groups_state.dart';

class groupsCubit extends Cubit<getgroupsstate> {
  groupsCubit(this.homerepoimpl) : super(getgroupsInitial());

  Homerepoimpl homerepoimpl;
  Future<void> getgroups(String token) async {
    emit(Getgroupsloading());

    var groupsresult = await homerepoimpl.getgroups(token);

    groupsresult.fold((l) => emit(Getgroupsfailure(l.message)), (r) {
      
      emit(Getgroupssucces(r));
    });
  }


}
