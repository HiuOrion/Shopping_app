import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle headerSplash = GoogleFonts.robotoSlab(
  fontSize: 25,
  fontWeight: FontWeight.w500,
  color: Colors.white
);
TextStyle header = GoogleFonts.robotoSlab(
    fontSize: 25,
    fontWeight: FontWeight.w500,
    color: Colors.black
);

TextStyle paragraph = GoogleFonts.robotoSlab(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black

);
TextStyle primaryLabel = GoogleFonts.robotoSlab(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black

);
TextStyle secondaryLabel = GoogleFonts.robotoSlab(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white

);
TextStyle textButton = GoogleFonts.robotoSlab(
  fontSize: 19,
  fontWeight: FontWeight.w600,
  color: Colors.white
);
InputDecoration customInputDecoration({required String labelText}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: primaryLabel,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
  );
}

