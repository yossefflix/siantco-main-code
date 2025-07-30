import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/generated/l10n.dart';
import 'package:siantko/shared/global_widgets/textformfiled.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/utils/colors.dart';

class TechnicianLoginScreen extends StatefulWidget {
  const TechnicianLoginScreen({super.key});

  @override
  State<TechnicianLoginScreen> createState() => _TechnicianLoginScreenState();
}

class _TechnicianLoginScreenState extends State<TechnicianLoginScreen> {
  bool obscureText = true;
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
                          "تسجيل فنى",
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
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back, size: 21, color: cWhite),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Image.asset("assets/images/logo.png", height: 100, width: 100),
            SizedBox(height: 10.h),
            Text(
              "يمكنك ملء المعلومات لتتمكن من الدخول",
              style: GoogleFonts.tajawal(
                color: cGrey2,
                fontWeight: FontWeight.w500,
              ),
            ),
            Txtformfiled(
              hintText: S.of(context).phoneNumber,
              isPhoneNum: true,
              keyboardType: TextInputType.phone,
            ),
            Txtformfiled(
              hintText: S.of(context).password,
              isPhoneNum: false,
              suffixIcon: obscureText ? Icons.visibility_off : Icons.visibility,
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
            SizedBox(height: 20.h),
            CustomButton(text: "تسجيل دخول", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
