import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:hiking_app/const.dart';

import 'package:hiking_app/views/widgets/custom_buttombar.dart';
import 'package:hiking_app/views/widgets/home_body.dart';

class Home_View extends StatefulWidget {
  const Home_View({super.key});

  @override
  State<Home_View> createState() => _Home_ViewState();
}

class _Home_ViewState extends State<Home_View> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      appBar: AppBar(
       
       
        backgroundColor: backgroundcolor,
        surfaceTintColor: backgroundcolor,
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo2.png',
          fit: BoxFit.fill,
          width: 130,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  FontAwesomeIcons.barsStaggered,
                  size: 24,
                )),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            homebody(),
            custombottombar(
                selectedIndex: selectedindex,
                onselect: (int p) {
                  setState(() {
                    selectedindex = p;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
