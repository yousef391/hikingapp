import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hiking_app/core/utils/api_service.dart';
import 'package:hiking_app/data/models/trips.dart';
import 'package:hiking_app/data/repo/Home_repoimpl.dart';
import 'package:hiking_app/data/repo/authrepo_impl.dart';
import 'package:hiking_app/viewmodels/cubit/auth_cubit.dart';
import 'package:hiking_app/viewmodels/cubit/getposition_cubit.dart';
import 'package:hiking_app/viewmodels/cubit/groups_cubit.dart';
import 'package:hiking_app/viewmodels/cubit/trips_cubit.dart';
import 'package:hiking_app/views/Home_view.dart';
import 'package:hiking_app/views/Login_view.dart';
import 'package:hiking_app/views/tripview.dart';

abstract class routerapp {
  static final Khomepath = '/home';
   static final Ktripview = '/tripview';


  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            return BlocProvider(
              create: (context) => AuthCubit(
                  authrepo:
                      Authrepoimpl(api_services: Api_services(dio: Dio()))),
              child: Login_View(),
            );
          }),
          GoRoute(
          path: Ktripview,
          builder: (context, state) {
            return Trip_view(tripinfo: state.extra as TripM ,);
          }),
      GoRoute(
        path: Khomepath,
        builder: (context, state) => MultiBlocProvider(
          providers: [
            
            BlocProvider(
              create: (context) => groupsCubit(Homerepoimpl(api_services: Api_services(dio: Dio())))..getgroups('jdfkjd') ,
            ),
            BlocProvider(create:(context) => GetpositionCubit(Homerepoimpl(api_services: Api_services(dio: Dio())))..getpostion() ) ,
           
            BlocProvider(
              create: (context) => TripsCubit(Homerepoimpl(api_services: Api_services(dio: Dio())))..getstrips()
            ),
          ],
          child: Home_View(),
        )
      ),
    ],
  );
}
