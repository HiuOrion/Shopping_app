import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kFontHeaderSplash = GoogleFonts.robotoSlab(
  fontSize: 25,
  fontWeight: FontWeight.w500,
  color: Colors.white
);
TextStyle kFontHeader = GoogleFonts.robotoSlab(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black
);

TextStyle kStyleTextField(Color color, double fontSize){
  return GoogleFonts.robotoSlab(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color
  );
}

TextStyle kFontParagraph = GoogleFonts.robotoSlab(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.black

);
TextStyle kFontPrimaryLabel = GoogleFonts.robotoSlab(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black

);
TextStyle kFontSecondLabel({required double fontSize, required Color color}){
  return GoogleFonts.robotoSlab(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color);
}


TextStyle kFontTextButton = GoogleFonts.robotoSlab(
  fontSize: 19,
  fontWeight: FontWeight.w600,
  color: Colors.white
);

InputDecoration customInputDecoration({required String labelText}) {
  return InputDecoration(
    labelText: labelText,
    labelStyle: kFontPrimaryLabel,
    // OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    // ),
    contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
  );
}

TextStyle kFontSubTitle({required double fontSize}){
  return GoogleFonts.robotoSlab(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: Colors.grey.shade900
  );
}
TextStyle kFontTitle({required double fontSize}){
  return GoogleFonts.robotoSlab(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: Colors.black
  );
}
TextStyle kFontPrice({required double fontSize}){
  return GoogleFonts.robotoSlab(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: Colors.black
  );
}

