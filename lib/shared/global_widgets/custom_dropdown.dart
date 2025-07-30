import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:siantko/utils/colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    this.hintText,
    required this.items,
    this.onChanged,
    this.value,
  });

  final String? hintText;
  final List<String> items;
  final String? value;
  final void Function(String?)? onChanged;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
          if (widget.onChanged != null) {
            widget.onChanged!(value);
          }
        },
        items: widget.items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: GoogleFonts.tajawal(color: Colors.black)),
          );
        }).toList(),
        style: GoogleFonts.tajawal(color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: cWhite,
          hintText: widget.hintText ?? '',
          hintStyle: GoogleFonts.tajawal(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
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
        ),
        icon: const Icon(Icons.arrow_drop_down),
        dropdownColor: Colors.white,
      ),
    );
  }
}
