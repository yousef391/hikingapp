import 'package:flutter/material.dart';
import 'package:hiking_app/core/utils/style.dart';
class customuserinfotail extends StatelessWidget {
  customuserinfotail({
    super.key,
    required this.img , 
    required this.subtitle , 
    required this.title
  });
String title;
String subtitle;
String img;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: style1.copyWith(fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: style2,
      ),
      leading: Container(
        height: 48,
        width: 48,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        child: Image.asset(
          img,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}