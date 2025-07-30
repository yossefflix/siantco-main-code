import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';

class Txtformfiled extends StatefulWidget {
  const Txtformfiled({
    super.key,
    this.hintText,
    this.isPhoneNum = false,
    this.suffixIcon,
    this.onPressed,
    this.obscureText = false,
    this.keyboardType,
    this.maxLines,
    this.controller,
  });
  final String? hintText;
  final bool? isPhoneNum;
  final IconData? suffixIcon;
  final void Function()? onPressed;
  final bool obscureText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final TextEditingController? controller;
  @override
  State<Txtformfiled> createState() => _TxtformfiledState();
}

class _TxtformfiledState extends State<Txtformfiled> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: widget.controller,
        style: GoogleFonts.tajawal(color: Colors.black),
        obscureText: widget.obscureText,
        cursorColor: cBlue,
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: cWhite,
          hintText: widget.hintText!,
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: cWhite2, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: cWhite2, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: cBlue, width: 1),
          ),
          suffixIcon: widget.isPhoneNum!
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '966+ ',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/flag.png',
                          height: 20.h,
                          width: 30.w,
                        ),
                      ],
                    ),
                  ),
                )
              : IconButton(
                  onPressed: widget.onPressed,
                  icon: Icon(widget.suffixIcon),
                ),
        ),
      ),
    );
  }
}
