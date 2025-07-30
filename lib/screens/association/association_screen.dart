import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/screens/association/widgets/association_service.dart';
import 'package:siantko/screens/map/map_screen.dart';
import 'package:siantko/utils/colors.dart';

class AssociationScreen extends StatelessWidget {
  const AssociationScreen({
    super.key,
    this.associationName,
    this.associationServices,
  });
  final String? associationName;
  final List<Map<String, String>>? associationServices;
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
            associationName!,
            style: GoogleFonts.tajawal(
              color: cWhite,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          itemCount: associationServices!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return AssociationService(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      seviceName: associationServices![index]['title'],
                    ),
                  ),
                );
              },
              title: associationServices![index]['title'],
              image: associationServices![index]['image'],
            );
          },
        ),
      ),
    );
  }
}
