import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:siantko/screens/orders/widgets/custom_progress_bar.dart';
import 'package:siantko/utils/colors.dart';

class OderDetailsScreen extends StatefulWidget {
  const OderDetailsScreen({
    super.key,
    this.technicalName,
    this.initialRating,
    this.serviceName,
    this.date,
    this.location,
    this.image,
    this.orderStatus,
    this.note,
    required this.images,
    this.percentageStatus,
    this.lat,
    this.lng,
  });
  final String? technicalName;
  final double? initialRating;
  final String? serviceName;
  final String? date;
  final String? location;
  final String? image;
  final String? orderStatus;
  final double? percentageStatus;
  final String? note;
  final List<String> images;
  final double? lat;
  final double? lng;
  @override
  State<OderDetailsScreen> createState() => _OderDetailsScreenState();
}

class _OderDetailsScreenState extends State<OderDetailsScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite2,
      appBar: AppBar(
        backgroundColor: cBlue,
        toolbarHeight: 80.h,
        leadingWidth: 45,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 25, color: cWhite),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 9.0),
          child: Text(
            "تفاصيل الطلب",
            style: GoogleFonts.tajawal(
              color: cWhite,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomProgressBar(
                percentage: widget.percentageStatus!,
                label: widget.orderStatus!,
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: cWhite,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: cWhite2,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.asset(widget.image!),
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.technicalName == null
                                    ? "لم يتم التحديد بعد"
                                    : widget.technicalName!,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                widget.serviceName!,
                                style: GoogleFonts.tajawal(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: 3,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemSize: 11.0,
                                itemPadding: const EdgeInsets.symmetric(
                                  horizontal: 2.0,
                                ),
                                itemBuilder: (context, _) =>
                                    const Icon(Icons.star, color: Colors.amber),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.settings, color: cBlue),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        widget.note!,
                        style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                        ),
                      ),
                      SizedBox(height: 3.h),
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
                            widget.date!,
                            maxLines: 1,
                            style: GoogleFonts.tajawal(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: cBlue,
                            size: 14,
                          ),
                          SizedBox(width: 4.sp),
                          Text(
                            widget.location!,
                            maxLines: 1,
                            style: GoogleFonts.tajawal(fontSize: 12.sp),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 90.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.images.length,
                          itemBuilder: (context, index) {
                            final image = widget.images[index];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: 10.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                    image: AssetImage(image),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(widget.lat!, widget.lng!),
                            zoom: 14,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            mapController = controller;
                          },
                          markers: {
                            Marker(
                              markerId: const MarkerId("marker_1"),
                              position: LatLng(widget.lat!, widget.lng!),
                            ),
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
