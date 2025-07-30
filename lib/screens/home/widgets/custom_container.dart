import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    this.title,
    this.description,
    this.image,
    this.onTap,
  });
  final String? title;
  final String? description;
  final String? image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: cGrey,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Image.asset(image!),
                    ),
                  ),

                  SizedBox(width: 6.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title!,
                          style: GoogleFonts.tajawal(
                            fontWeight: FontWeight.bold,
                            color: cBlack,
                            fontSize: 13.sp,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: cBlue,
                              size: 20.sp,
                            ),
                            SizedBox(width: 2.w),
                            Expanded(
                              child: Text(
                                description!,
                                style: GoogleFonts.tajawal(fontSize: 11.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(height: 2.h),
              RichText(
                text: TextSpan(
                  style: GoogleFonts.tajawal(fontSize: 12.sp),
                  children: [
                    TextSpan(
                      text: "ملاحظات",
                      style: GoogleFonts.tajawal(color: cRed),
                    ),
                    TextSpan(
                      text: " : نحن غير مسؤلين عن الخدمة بدون فاتورة إلكترونية",
                      style: GoogleFonts.tajawal(color: cBlack),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
