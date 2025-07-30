import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/shared/global_widgets/textformfiled.dart';
import 'package:siantko/utils/colors.dart';

class TechnicalEvaluationScreen extends StatefulWidget {
  const TechnicalEvaluationScreen({super.key});

  @override
  State<TechnicalEvaluationScreen> createState() =>
      _TechnicalEvaluationScreenState();
}

class _TechnicalEvaluationScreenState extends State<TechnicalEvaluationScreen> {
  final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite2,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(color: cWhite, height: 0.2.h),
            Container(
              height: 80.h,
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
                  "تقييم الفنى",
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w500,
                    color: cWhite,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 90,
                height: 100,
                decoration: BoxDecoration(shape: BoxShape.circle, color: cGrey),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset("assets/images/d1.png"),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Center(
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15.0,
                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                itemBuilder: (context, _) =>
                    const Icon(Icons.star, color: Colors.amber),
                onRatingUpdate: (rating) {},
              ),
            ),
            SizedBox(height: 20.h),
            Txtformfiled(hintText: "اكتب تعليقك ", maxLines: 5,controller: commentController,),
            SizedBox(height: 20.h),
            CustomButton(text: "إرسال التقييم", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
