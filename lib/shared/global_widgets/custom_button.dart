import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.onPressed});
  final String? text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MaterialButton(
        color: cBlue,
        height: 45.h,
        minWidth: double.infinity,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: onPressed,
        child: Text(
          text!,
          style: GoogleFonts.tajawal(
            color: cWhite,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
