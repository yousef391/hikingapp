import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';



class custom_appBar extends StatelessWidget {
  const custom_appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
                    'assets/images/logo2.png',
                    fit: BoxFit.fill,
                    width: 130,
                    height: 30,
                  ),
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.barsStaggered ,
                  size: 24,
                )),
          )
        ],
      ),
    );
  }
}
