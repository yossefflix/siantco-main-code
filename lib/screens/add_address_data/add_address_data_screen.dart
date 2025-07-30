import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/shared/global_widgets/textformfiled.dart';
import 'package:siantko/utils/colors.dart';

class AddAddressDataScreen extends StatefulWidget {
  const AddAddressDataScreen({super.key});

  @override
  State<AddAddressDataScreen> createState() => _AddAddressDataScreenState();
}

class _AddAddressDataScreenState extends State<AddAddressDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cGrey,
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
            "اضافة بيانات العنوان",
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
            children: [
              Txtformfiled(hintText: "القطعة"),
              Txtformfiled(hintText: "الشارع"),
              Txtformfiled(hintText: "الجادة"),
              Txtformfiled(hintText: "المبنى"),
              Txtformfiled(
                hintText: "رقم الهاتف",
                isPhoneNum: true,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10.h),
              CustomButton(text: "ارسال الطلب", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
