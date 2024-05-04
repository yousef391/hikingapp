import 'package:bloc/bloc.dart';
import 'package:hiking_app/data/repo/Home_repoimpl.dart';

import 'package:meta/meta.dart';

part 'getposition_state.dart';

class GetpositionCubit extends Cubit<GetpositionState> {
  GetpositionCubit(this.homerepoimpl) : super(GetpositionInitial());
    Homerepoimpl homerepoimpl;
  Future<void> getpostion() async {
    
    emit(Getpositionloading());
    
  var position = await homerepoimpl.gettcurrentposition();

position.fold((l) => emit(Getpositionfailure()), (r) {
  
  emit(Getpositionsucces(location: r)) ;} );

    

  
  }
}
