import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/generated/l10n.dart';
import 'package:siantko/screens/auth/users_login_screen.dart';
import 'package:siantko/utils/colors.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    "assets/images/bg-3.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 30.h),
                Opacity(
                  opacity: 0.15,
                  child: Image.asset(
                    "assets/images/bg-3.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/Rectangle-3.png",
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              "assets/images/img.png",
              fit: BoxFit.fill,
              height: 400.h,
              width: 300.w,
            ),
          ),

          Column(
            children: [
              SizedBox(height: 100.h),
              Image.asset("assets/images/logo.png", height: 100, width: 80),
              SizedBox(height: 20.h),
              Text(
                S.of(context).all_maintenance_services,
                style: GoogleFonts.tajawal(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                S.of(context).all_Professionals_In_OneApp,
                style: GoogleFonts.tajawal(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersLoginScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      S.of(context).start_Now,
                      style: GoogleFonts.tajawal(
                        color: cBlue2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ],
      ),
    );
  }
}
