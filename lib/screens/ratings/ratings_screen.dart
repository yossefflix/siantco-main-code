import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/screens/ratings/widgets/rating_container.dart';
import 'package:siantko/utils/colors.dart';

List<Map<String, dynamic>> ratings = [
  {"serviceName": "صحي", "initialRating": 3.0, "comment": "شغل ممتاز"},
  {"serviceName": "صحي", "initialRating": 3.0, "comment": "شغل ممتاز"},
  {"serviceName": "صحي", "initialRating": 3.0, "comment": "شغل ممتاز"},
  {"serviceName": "صحي", "initialRating": 3.0, "comment": "شغل ممتاز"},
];

class RatingsScreen extends StatefulWidget {
  const RatingsScreen({super.key});

  @override
  State<RatingsScreen> createState() => _RatingsScreenState();
}

class _RatingsScreenState extends State<RatingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite2,
      body: SingleChildScrollView(
        child: Column(
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
                  "تقييمات المزود الأخيرة",
                  style: GoogleFonts.tajawal(
                    fontWeight: FontWeight.w500,
                    color: cWhite,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            ListView.builder(
              padding: const EdgeInsets.all(8.0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ratings.length,
              itemBuilder: (context, index) {
                final rating = ratings[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingContainer(
                    comment: rating['comment'],
                    serviceName: rating['serviceName'],
                    initialRating: rating['initialRating'],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
