import 'package:flutter/material.dart';
import 'package:hiking_app/const.dart';
import 'package:hiking_app/core/utils/style.dart';
import 'package:hiking_app/data/models/Group.dart';

// ignore: must_be_immutable
class groups_list extends StatelessWidget {
   groups_list( {
    super.key, 
   required this.group
  });
  GroupM group;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 70,
           clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            
            border: Border.all(color: bordercolor, width: 3 ,strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Image.network(
            group.image_url,
            fit: BoxFit.fill
          ),
        ),
        Text(group.name, style: style1.copyWith(fontWeight: FontWeight.w400)) 
      ],
    );
  }
}
