import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';

class CustomProgressBar extends StatelessWidget {
  final double percentage;
  final String label;

  const CustomProgressBar({
    super.key,
    required this.percentage,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 40.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              height: 40.h,
              width: constraints.maxWidth * percentage.clamp(0, 1),
              decoration: BoxDecoration(
                color: cGreen2,
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              label,
              style: GoogleFonts.tajawal(
                fontWeight: FontWeight.w500,
                color: cBlack,
                fontSize: 15.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
