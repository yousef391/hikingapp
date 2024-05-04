import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hiking_app/core/utils/style.dart';
import 'package:hiking_app/viewmodels/cubit/getposition_cubit.dart';
import 'package:hiking_app/viewmodels/cubit/groups_cubit.dart';
import 'package:hiking_app/viewmodels/cubit/trips_cubit.dart';

import 'package:hiking_app/views/widgets/Groups_list.dart';
import 'package:hiking_app/views/widgets/shimmer.dart';
import 'package:hiking_app/views/widgets/triplistitem.dart';
import 'package:iconly/iconly.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class homebody extends StatelessWidget {
  const homebody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetpositionCubit, GetpositionState>(
      listener: (context, state) {
        
      },
      builder: (context, statepostion) {
        return BlocConsumer<groupsCubit, getgroupsstate>(
          listener: (context, state) {
            print(state);
          },
          builder: (context, state) {
            return BlocConsumer<TripsCubit, getstripsstate>(
              listener: (context, statetrips) {
                if (statetrips is getstripsfailure ||
                    state is Getgroupsfailure || statepostion is Getpositionfailure) {
                  QuickAlert.show(
                      context: context,
                      type: QuickAlertType.error,
                      title: 'error try again',
                      confirmBtnText: 'Ok',
                      confirmBtnColor: Color(0xff2185D5),
                      borderRadius: 8);
                }
              },
              builder: (context, statetrips) {
                if (statetrips is getstripssucces && state is Getgroupssucces && statepostion is Getpositionsucces) {
                  
                  return CustomScrollView(slivers: <Widget>[
                    SliverToBoxAdapter(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const  SizedBox(
                          height: 16,
                        ),
                        first_title(location: statepostion.location,),
                       const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.groups_list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 14),
                                    child: groups_list(
                                        group: state.groups_list[index]));
                              },
                            )),
                      const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.only(left: 14, bottom: 14),
                          child: Text(
                            'Trips of the week',
                            style: style1.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    )),
                    SliverList.builder(
                        itemCount: statetrips.groupslist.length   ,
                        itemBuilder: (BuildContext context, int index) {
                          return triplistitem(trip: statetrips.groupslist[index],);
                        })
                        ,
                        SliverToBoxAdapter(child: SizedBox(height: 80,))
                        
                  ]);
                } else {
                  return shimmer();
                }
              },
            );
          },
        );
      },
    );
  }
}

// ignore: must_be_immutable
class first_title extends StatelessWidget {
   first_title({
    super.key,
   required this.location
  });
String location;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Groupes',
              style:
                  style1.copyWith(fontSize: 16, fontWeight: FontWeight.w700)),
          Row(
            children: [
              Icon(IconlyLight.location),
              Text(location,
                  style: style1.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w700 , overflow: TextOverflow.clip)),
            ],
          )
        ],
      ),
    );
  }
}
