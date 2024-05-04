import 'package:bloc/bloc.dart';
import 'package:hiking_app/data/models/usermodel.dart';
import 'package:hiking_app/data/repo/authrepo_impl.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';




class AuthCubit extends Cubit<AuthState> {
  AuthCubit({ required this.authrepo}) : super(AuthInitial());
Authrepoimpl authrepo;
 Future<void> login(String email , String password) async{
emit(Authloading()) ;

var result= await authrepo.login(email,password) ;

result.fold((l) => emit(Authfailure(l.message)), (r) => emit(Authsucces(r)));



 }
}




