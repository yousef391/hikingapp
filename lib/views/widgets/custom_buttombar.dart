import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hiking_app/const.dart';
import 'package:iconly/iconly.dart';


// ignore: must_be_immutable
class custombottombar extends StatelessWidget {
  custombottombar(
      {super.key, required this.selectedIndex, required this.onselect});
  int selectedIndex;
  void Function(int) onselect;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 15,
      right: 10,
      left: 10,
      child: CustomNavigationBar(
       strokeColor: Colors.white,
       

        backgroundColor: primaryColot.withOpacity(0.9),
        borderRadius: Radius.circular(30),
        currentIndex: selectedIndex,
        onTap: onselect,
        items: [
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.message ,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.message,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'request',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.home,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.home,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'Home',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
          
         
          CustomNavigationBarItem(
              icon: Icon(
                IconlyLight.document,
                color: Colors.white,
              ),
              selectedIcon: Icon(
                IconlyBold.document,
                color: Colors.white,
              ),
              selectedTitle: Text(
                'my trips',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 8),
              )),
        ],
      ),
    );
  }
}
