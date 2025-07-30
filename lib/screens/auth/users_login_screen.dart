import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/generated/l10n.dart';
import 'package:siantko/screens/auth/technician_login_screen.dart';
import 'package:siantko/screens/home/home.dart';
import 'package:siantko/shared/global_widgets/textformfiled.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/utils/colors.dart';

class UsersLoginScreen extends StatefulWidget {
  const UsersLoginScreen({super.key});

  @override
  State<UsersLoginScreen> createState() => _UsersLoginScreenState();
}

class _UsersLoginScreenState extends State<UsersLoginScreen> {
  bool obscureText = true;
  int _tapCount = 0;
  Timer? _tapTimer;

  void _handleTap() {
    _tapCount++;

    _tapTimer?.cancel();
    _tapTimer = Timer(Duration(seconds: 2), () {
      _tapCount = 0;
    });

    if (_tapCount == 3) {
      _tapCount = 0;
      _tapTimer?.cancel();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => TechnicianLoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
      appBar: AppBar(
        backgroundColor: cBlue,
        toolbarHeight: 60.h,
        leadingWidth: 40,
        leading: InkWell(
          onTap: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(color: cWhite, height: 0.2.h),
            Stack(
              children: [
                Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: cBlue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 6,
                        child: Text(
                          "تسجيل الدخول",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.w500,
                            color: cWhite,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 16,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: cBlue2,
                    child: IconButton(
                      onPressed: () {
                        // Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 21, color: cWhite),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: _handleTap,
              child: Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 100,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "يمكنك ملء المعلومات لتتمكن من الدخول",
              style: GoogleFonts.tajawal(
                color: cGrey2,
                fontWeight: FontWeight.w500,
              ),
            ),
            Txtformfiled(hintText: S.of(context).fullname, isPhoneNum: false),
            Txtformfiled(
              hintText: S.of(context).phoneNumber,
              isPhoneNum: true,
              keyboardType: TextInputType.phone,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Checkbox(
                    fillColor: WidgetStatePropertyAll(cBlue),
                    value: true,
                    onChanged: (value) {},
                  ),
                  Text(
                    "تذكرنى",
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "نسيت كلمة المرور ؟",
                    style: GoogleFonts.tajawal(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            CustomButton(
              text: "تسجيل الدخول",
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                  (route) => false,
                );
              },
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'يمكنك التسجيل عبر',
                      style: GoogleFonts.tajawal(color: Colors.black),
                    ),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/apple.svg',
                          height: 24.h,
                          width: 24.w,
                          // ignore: deprecated_member_use
                          color: Colors.black,
                        ),
                        label: Text('Apple'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/images/google.svg',
                          height: 24.h,
                          width: 24.w,
                        ),
                        label: Text('Google'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.black,
                          side: BorderSide(color: Colors.grey),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 14),
                          elevation: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "لن نشارك معلوماتك مع اى جهة",
              style: GoogleFonts.tajawal(
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
