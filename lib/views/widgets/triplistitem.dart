import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:go_router/go_router.dart';
import 'package:hiking_app/const.dart';
import 'package:hiking_app/core/utils/Go_router.dart';
import 'package:hiking_app/core/utils/style.dart';
import 'package:hiking_app/data/models/trips.dart';

class triplistitem extends StatelessWidget {
   triplistitem({
   required this.trip,
    super.key,
  });

 TripM trip;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).push(routerapp.Ktripview , extra: trip) ,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10 ,  vertical: 6),
        child: IntrinsicHeight(
          child: Container(
            
            decoration: BoxDecoration(
               boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(12),
                color: cardbackgroundcolor),
            
            child: Column(
              
              children: [
                Padding(
                 padding: const EdgeInsets.all(16),
                  child: Container(
                    height: 250,
                    child: Image.network(trip.trip_image , fit: BoxFit.fill,),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: cardbackgroundcolor),
                  ),
                ), 
                
                grouptile(trip: trip)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class grouptile extends StatelessWidget {
  const grouptile({
    super.key,
    required this.trip,
  });

  final TripM trip;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:Text('${trip.groupid}' , style: style1.copyWith(fontSize: 16),),
      subtitle: Text(trip.lieuxdarrive, style: style2,) ,
      trailing: Icon(FontAwesomeIcons.ellipsis),
      leading: Container(
        height: 48,
        width: 48,
        padding: EdgeInsets.all(7),
         decoration: BoxDecoration(
          border: Border.all(color:bordercolor  ,width: 1),
          borderRadius: BorderRadius.circular(100),
          ),
        child:Image.asset('assets/images/card1.jpg' , fit: BoxFit.fill,) ,),
    );
  }
}