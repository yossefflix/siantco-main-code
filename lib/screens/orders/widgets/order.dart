import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Order extends StatelessWidget {
  const Order({
    super.key,
    this.initialRating = 3,
    this.serviceName,
    this.date,
    this.location,
    this.image,
    this.orderStatus,
    this.onPressed,
  });
  final double? initialRating;
  final String? serviceName;
  final String? date;
  final String? location;
  final String? image;
  final String? orderStatus;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: cWhite,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        serviceName!,
                        maxLines: 1,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w500,
                          color: cBlack,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            color: cBlue,
                            size: 14,
                          ),
                          SizedBox(width: 4.sp),
                          Text(
                            date!,
                            maxLines: 1,
                            style: GoogleFonts.tajawal(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: cBlue,
                            size: 14,
                          ),
                          SizedBox(width: 4.sp),
                          Text(
                            location!,
                            maxLines: 1,
                            style: GoogleFonts.tajawal(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Flexible(
                    child: RatingBar.builder(
                      initialRating: initialRating!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 11.0,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, _) =>
                          const Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {},
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    orderStatus!,
                    style: GoogleFonts.tajawal(
                      color: orderStatus == "تحت المراجعة" ? cRed : cGreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: cBlue),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 24,
                      ),
                    ),
                    onPressed: onPressed,
                    child: Text(
                      "تفاصيل الطلب",
                      style: GoogleFonts.tajawal(
                        color: cBlue,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
