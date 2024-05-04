
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:hiking_app/const.dart';
import 'package:hiking_app/core/utils/style.dart';
import 'package:hiking_app/data/models/trips.dart';
import 'package:hiking_app/views/widgets/Custom_floatingbutton.dart';
import 'package:hiking_app/views/widgets/customuserinfotail.dart';

import 'package:iconly/iconly.dart';

class Trip_view extends StatefulWidget {
  Trip_view({super.key , required this.tripinfo});
 TripM tripinfo;
  @override
  State<Trip_view> createState() => _Trip_viewState();
}

class _Trip_viewState extends State<Trip_view> {
  PageController controller = PageController();
  int imagenum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const  customfloatingactionbutton(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: PageView(
                  controller: controller,
                  onPageChanged: (value) {
                    imagenum = value;
                    setState(() {});
                  },
                  children: [
                    Image.network(
                      widget.tripinfo.trip_image,
                      height: 350,
                      cacheHeight: 350,
                      fit: BoxFit.fill,
                    ),
                    Image.network(
                       widget.tripinfo.trip_image,
                      height: 350,
                      cacheHeight: 350,
                      fit: BoxFit.fill,
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            if (imagenum >= 0) {
                              controller.animateToPage(
                                imagenum - 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                            imagenum = imagenum - 1;
                            ;
                          },
                          icon: const Icon(
                            IconlyLight.arrow_left_2,
                          ),
                        ),
                        Text(
                          '${imagenum + 1} Of 5',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            if (imagenum >= 0) {
                              controller.animateToPage(
                                imagenum + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                            }
                            imagenum = imagenum + 1;
                          },
                          icon: const Icon(
                            IconlyLight.arrow_right_2,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    '${widget.tripinfo.lieuxdedepart}-- ${widget.tripinfo.lieuxdarrive }' ,
                    style: style1.copyWith(fontSize: 17),
                  ),
               const    SizedBox(
                    height: 10,
                  ),
                 SizedBox(
                    height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                        
                        
                             
                          customcard(text:'${widget.tripinfo.datededepart} - ${widget.tripinfo.datededarrive }' ,  icon: IconlyLight.calendar,),
                        const  SizedBox(
                            width: 10,
                          ),
                          customcard(text:'Seats' ,  icon: IconlyLight.user_1,),
                         
                         const  SizedBox(
                            width: 10,
                          ),
                          customcard(text:'2000 DA' ,  icon: IconlyLight.wallet,),
                      
                      ],)
                    ),
                 
               const    SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    title: Text(
                      '${widget.tripinfo.groupid}',
                      style: style1.copyWith(fontSize: 16),
                    ),
                    subtitle: Text(
                      widget.tripinfo.lieuxdarrive,
                      style: style2,
                    ),
                    trailing: const Icon(FontAwesomeIcons.ellipsis),
                    leading: Container(
                      height: 48,
                      width: 48,
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        border: Border.all(color: bordercolor, width: 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset(
                        'assets/images/card1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                 const  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Text(
                    'Guides',
                    style: style1.copyWith(fontSize: 15),
                  ),
                  customuserinfotail(title:'Yousef Ouddane' , subtitle:  'yf.ouddane@gmail.com', img: 'assets/images/yousef1.jpg',),
                  customuserinfotail(title:'Islem Ourred' , subtitle:  'ic.ourred@gmail.com', img: 'assets/images/islem1.jpg',),
                  Text(
                    'Activities',
                    style: style1.copyWith(fontSize: 15),
                  ),
                const   SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      activitiescard(
                        title: 'Hike',
                        icon: FontAwesomeIcons.personHiking,
                      ),
                      activitiescard(
                        title: 'Food',
                        icon: FontAwesomeIcons.utensils,
                      ),
                      activitiescard(
                        title: 'Games',
                        icon: FontAwesomeIcons.dice,
                      ),
                      activitiescard(
                        title: 'Camp',
                        icon: FontAwesomeIcons.tents,
                      )
                    ],
                  ),
                 const  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Description ',
                    style: style1.copyWith(fontSize: 15),
                  ),
                const   SizedBox(
                    height: 20,
                  ),
               const    Text(
                      'sd,sdksdjksdjsdjsdjdksjksdjksjkjkdsjkdsjksjkjskdjkkjfdjkfjkdjfkjkdfjkfdjkfdjkdfkjfdjkkjdfjkf '),
                const   SizedBox(
                    height: 80,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



class customcard extends StatelessWidget {
  customcard({
    super.key,
    required this.icon , 
    required this.text
  });
IconData icon;
String text; 
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xffC4C4C4)),
                                  borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Icon(
            icon,
            color: iconcolor,
          ),
          Text(
            text,
            style: style1,
          )
        ],
      ),
    );
  }
}



class activitiescard extends StatelessWidget {
  activitiescard({super.key, required this.title, required this.icon});
  IconData icon;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Color(0xffD19657),
                borderRadius: BorderRadius.circular(15)),
            child: Icon(
              icon,
              weight: 20,
              size: 20,
            ),
          ),
          Text(
            title,
            style: style1,
          )
        ],
      ),
    );
  }
}
