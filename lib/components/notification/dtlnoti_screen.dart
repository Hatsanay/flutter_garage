import 'package:flutter/material.dart';
import 'package:flutter_garage/components/home/components/body.dart';
import 'package:flutter_garage/components/home/home_screen.dart';
import 'package:flutter_garage/components/notification/components/body.dart';
import 'package:flutter_garage/components/notification/components/detaiPage.dart';
import 'package:flutter_garage/constans.dart';
import 'package:flutter_svg/flutter_svg.dart';

//import 'package:flutter_svg/flutter_svg.dart';

class DtlNotiScreen extends StatefulWidget {
  final String username;
  final String id;
  final String proflie;

  final String garageid;
  final String garagename;
  final String garagetel;
  final String garagelattitude;
  final String garagelonggitude;
  final String garageprofile;
  final String garageonoff;
  final String ownerid;
  final String garagedeegree;
  final Map<String, dynamic> garage;

  DtlNotiScreen({
    Key? key,
    required String title,
    required this.username,
    required this.proflie,
    required this.id,
    required this.garageid,
    required this.garagename,
    required this.garagetel,
    required this.garagelattitude,
    required this.garagelonggitude,
    required this.garageprofile,
    required this.garageonoff,
    required this.ownerid,
    required this.garagedeegree,
    required this.garage,
  }) : super(key: key);
  // final String username;

  // HomeScreen({required this.username});
  @override
  State<DtlNotiScreen> createState() => _DtlNotiScreenState();
}

class _DtlNotiScreenState extends State<DtlNotiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: DetailPage(
        username: widget.username,
        id: widget.id,
        proflie: widget.proflie,
        garage: widget.garage,
        title: '',
      ),
      //backgroundColor: kappbar,
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: kNavigationBar,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -10),
              blurRadius: 35,
              color: kNavigationBar.withOpacity(0.38),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: SvgPicture.asset("assets/icons/home.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return HomeScreen(
                            username: widget.username,
                            id: widget.id,
                            proflie: widget.proflie,
                            garageid: widget.garageid,
                            garagename: widget.garagename,
                            garagetel: widget.garagetel,
                            garagelattitude: widget.garagelattitude,
                            garagelonggitude: widget.garagelonggitude,
                            garageprofile: widget.garageprofile,
                            garageonoff: widget.garageonoff,
                            ownerid: widget.ownerid,
                            garagedeegree: widget.garagedeegree,
                            title: '',
                          );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/bell.svg",
                color: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return homeBody(
                            username: widget.username,
                            id: widget.id,
                            proflie: widget.proflie,
                            garageid: widget.garageid,
                            garagename: widget.garagename,
                            garagetel: widget.garagetel,
                            garagelattitude: widget.garagelattitude,
                            garagelonggitude: widget.garagelonggitude,
                            garageprofile: widget.garageprofile,
                            garageonoff: widget.garageonoff,
                            ownerid: widget.ownerid,
                            garagedeegree: widget.garagedeegree,
                          );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/files.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return homeBody(
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
                            garageid: widget.garageid,
                            garagename: widget.garagename,
                            garagetel: widget.garagetel,
                            garagelattitude: widget.garagelattitude,
                            garagelonggitude: widget.garagelonggitude,
                            garageprofile: widget.garageprofile,
                            garageonoff: widget.garageonoff,
                            ownerid: widget.ownerid,
                            garagedeegree: widget.garagedeegree,
                          );
                          // listScreen(
                          //   title: '??????????????????',
                          //   id: widget.id,
                          //   username: widget.username,
                          //   proflie: widget.proflie,
                          // );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
            IconButton(
              icon: SvgPicture.asset("assets/icons/user.svg"),
              onPressed: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (context, Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return homeBody(
                            id: widget.id,
                            username: widget.username,
                            proflie: widget.proflie,
                            garageid: widget.garageid,
                            garagename: widget.garagename,
                            garagetel: widget.garagetel,
                            garagelattitude: widget.garagelattitude,
                            garagelonggitude: widget.garagelonggitude,
                            garageprofile: widget.garageprofile,
                            garageonoff: widget.garageonoff,
                            ownerid: widget.ownerid,
                            garagedeegree: widget.garagedeegree,
                          );
                          // profileScreen(
                          //   title: '?????????????????????',
                          //   id: widget.id,
                          //   username: widget.username,
                          //   proflie: widget.proflie,
                          // );
                        },
                        transitionsBuilder: (BuildContext context,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation,
                            Widget child) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(-2.0, 0.0),
                              end: Offset(0.0, 0.0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        transitionDuration: Duration(seconds: 0)));
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: kappbar,
      title: Text(
        '???????????????????????????',
        style: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
        ),
      ),
      actions: <Widget>[
        // IconButton(
        //   icon: SvgPicture.asset(
        //     "assets/icons/bell.svg",
        //   ),
        //   onPressed: () {},
        // ),
      ],
    );
  }
}
