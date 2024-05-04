
import 'package:flutter/material.dart';
import 'package:hiking_app/const.dart';

import 'package:hiking_app/core/utils/Go_router.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    debugInvertOversizedImages=true;
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      title: 'Hiking APP',
      routerConfig: routerapp.router,
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundcolor
      ),
      
    );
  }
}