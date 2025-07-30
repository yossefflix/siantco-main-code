import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/screens/home/home_screen.dart';
import 'package:siantko/screens/myprofile/myprofile_screen.dart';
import 'package:siantko/screens/notifications/notification_screen.dart';
import 'package:siantko/screens/orders/orders_screen.dart' show OrdersScreen;
import 'package:siantko/screens/ratings/ratings_screen.dart';
import 'package:siantko/screens/ratings/technical_evaluation_screen.dart';
import 'package:siantko/utils/colors.dart';

const screens = [
  HomeScreen(),
  TechnicalEvaluationScreen(),
  RatingsScreen(),
  MyprofileScreen(),
  OrdersScreen(),
  NotificationScreen(),
  Text("1"),
];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: cWhite,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/person.png'),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("محمد اسماعيل", style: GoogleFonts.tajawal()),
                        Text(
                          "mohamedahmedat@gmail.com",
                          style: GoogleFonts.tajawal(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.home_filled,
                  color: selectedIndex == 0 ? cBlue : cBlack,
                ),
                title: Text(
                  'الصفحة الرئيسية',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 0 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 0,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login_outlined,
                  color: selectedIndex == 1 ? cBlue : cBlack,
                ),
                title: Text(
                  'تسجيل زائر',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 1 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 1,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.language,
                  color: selectedIndex == 2 ? cBlue : cBlack,
                ),
                title: Text(
                  'تغيير اللغة',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 2 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 2,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 2;
                  });
                  Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.person_outline_sharp,
                  color: selectedIndex == 3 ? cBlue : cBlack,
                ),
                title: Text(
                  'الملف الشخصي',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 3 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 3,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 3;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.cable_sharp,
                  color: selectedIndex == 4 ? cBlue : cBlack,
                ),
                title: Text(
                  'الطلبات',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 4 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 4,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.notifications_none,
                  color: selectedIndex == 5 ? cBlue : cBlack,
                ),
                title: Text(
                  'الاشعارات',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 5 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 5,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 5;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.login_outlined,
                  color: selectedIndex == 6 ? cBlue : cBlack,
                ),
                title: Text(
                  'تسجيل الخروج',
                  style: GoogleFonts.tajawal(
                    color: selectedIndex == 6 ? cBlue : cBlack,
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
                selected: selectedIndex == 6,
                selectedTileColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    selectedIndex = 6;
                  });
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 40.h),
              Center(
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: cBlue,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      "assets/images/logo-white.png",
                      height: 50.h,
                      width: 50.h,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: cBlue,
        toolbarHeight: 60.h,
        leadingWidth: 40,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Row(
            children: [
              SizedBox(width: 5.w),
              SvgPicture.asset(
                'assets/images/menuicon.svg',
                height: 27.h,
                width: 27.w,
              ),
            ],
          ),
        ),
        title: Text(
          "صيانتكو",
          style: GoogleFonts.changa(
            color: cWhite,
            fontSize: 26.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/person.png'),
            ),
          ),
        ],
      ),
      body: screens[selectedIndex],
    );
  }
}
