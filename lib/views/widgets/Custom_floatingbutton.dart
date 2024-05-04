import 'package:flutter/material.dart';
import 'package:hiking_app/const.dart';
import 'package:hiking_app/core/utils/style.dart';
class customfloatingactionbutton extends StatelessWidget {
  const customfloatingactionbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: FloatingActionButton.extended(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.transparent)),
        onPressed: () {},
        label: Text(
          'Reserve your spot',
          style: stylebutton,
        ),
        backgroundColor: primaryColot,
      ),
    );
  }
}