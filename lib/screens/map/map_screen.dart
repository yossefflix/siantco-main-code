import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:siantko/screens/complete_info/complete_info_screen.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/utils/colors.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.seviceName = "كهرباء"});
  final String? seviceName;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  LatLng? currentPosition;

  @override
  void initState() {
    super.initState();
    _getPermissionAndLocation();
  }

  Future<void> _getPermissionAndLocation() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = LatLng(position.latitude, position.longitude);
      });
    } else {
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
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
            "بيانات الطلب (${widget.seviceName})",
            style: GoogleFonts.tajawal(
              color: cWhite,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: currentPosition == null
          ? const Center(child: CircularProgressIndicator(color:cBlue))
          : Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentPosition!,
                    zoom: 16,
                  ),
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    mapController = controller;
                  },
                ),
                Positioned(
                  bottom: 20.h,
                  left: 5.w,
                  right: 30.w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                    child: CustomButton(
                      text: "تأكيد الموقع",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompleteInfoScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
