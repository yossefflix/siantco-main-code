import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:siantko/screens/add_address_data/add_address_data_screen.dart';
import 'package:siantko/shared/global_widgets/custom_button.dart';
import 'package:siantko/shared/global_widgets/custom_dropdown.dart';
import 'package:siantko/shared/global_widgets/textformfiled.dart';
import 'package:siantko/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CompleteInfoScreen extends StatefulWidget {
  const CompleteInfoScreen({super.key});

  @override
  State<CompleteInfoScreen> createState() => _CompleteInfoScreenState();
}

class _CompleteInfoScreenState extends State<CompleteInfoScreen> {
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();
  final TextEditingController dateController = TextEditingController();

  Future<void> _showImageSourceSelector() async {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: cBlue),
                title: Text("التقاط صورة", style: GoogleFonts.tajawal()),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: cBlue),
                title: Text("اختيار من المعرض", style: GoogleFonts.tajawal()),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    if (_images.length >= 10) return;

    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  void _showDatePicker(BuildContext context) async {
    if (Platform.isAndroid) {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (pickedDate != null) {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      }
    } else if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: Text("تم"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Expanded(
                child: CupertinoDatePicker(
                  initialDateTime: DateTime.now(),
                  minimumDate: DateTime(2000),
                  maximumDate: DateTime(2100),
                  mode: CupertinoDatePickerMode.date,
                  onDateTimeChanged: (DateTime newDate) {
                    dateController.text = DateFormat(
                      'yyyy-MM-dd',
                    ).format(newDate);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

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
            "استكمال بيانات الطلب",
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
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Txtformfiled(hintText: "وصف الطلب", maxLines: 3),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300, width: 1.5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: _showImageSourceSelector,
                          child: Icon(
                            Icons.photo_library,
                            size: 30,
                            color: cBlue,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            style: GoogleFonts.tajawal(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(text: "صور المشكلة أو الطلب"),
                              TextSpan(
                                text: " (10 صور كحد أقصى)",
                                style: GoogleFonts.tajawal(color: cBlue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(_images.length, (index) {
                          return Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  _images[index],
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: -8,
                                right: -8,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                    size: 20,
                                  ),
                                  onPressed: () => _removeImage(index),
                                ),
                              ),
                            ],
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Txtformfiled(
                hintText: "حدد الموعد",
                maxLines: 1,
                controller: dateController,
                suffixIcon: Icons.calendar_today_rounded,
                onPressed: () => _showDatePicker(context),
              ),
              CustomDropdown(
                hintText: 'حدد الفترة',
                items: ['', '', ''],
                onChanged: (value) {},
              ),
              SizedBox(height: 20.h),
              CustomButton(
                text: "تأكيد وتحديد العنوان",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAddressDataScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
