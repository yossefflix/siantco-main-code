import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/shared/global_widgets/textformfiled.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/utils/colors.dart';

class MyprofileScreen extends StatefulWidget {
  const MyprofileScreen({super.key});

  @override
  State<MyprofileScreen> createState() => _MyprofileScreenState();
}

class _MyprofileScreenState extends State<MyprofileScreen> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: cWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: cWhite, height: 0.2.h),
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
              child: Center(
                child: Text(
                  "صفحتى الشخصية",
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w500,
                    color: cWhite,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    "assets/images/bg-3.png",
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height: 15.h),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: cBlue, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/person-2.jpg',
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            width: 40,
                            height: 30,
                            decoration: BoxDecoration(
                              color: cBlue,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "محمد اسماعيل",
                          style: GoogleFonts.tajawal(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 3.w),
                        CircleAvatar(backgroundColor: cGreen, radius: 6),
                      ],
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ],
            ),
            Container(
              color: cGrey,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Txtformfiled(hintText: "الاسم بالكامل"),
                  Txtformfiled(hintText: "البريد الالكتروني"),
                  Txtformfiled(hintText: "رقم الهاتف", isPhoneNum: true),
                  Txtformfiled(
                    hintText: "الرقم السري",
                    maxLines: 1,
                    suffixIcon: obscureText
                        ? Icons.visibility_off
                        : Icons.visibility,
                    obscureText: obscureText,
                    onPressed: () {
                      if (obscureText) {
                        setState(() {
                          obscureText = false;
                        });
                      } else {
                        setState(() {
                          obscureText = true;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
            CustomButton(text: "حفظ التعديلات", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
