import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(double.maxFinite, 60),
  backgroundColor: Color.fromARGB(255, 83, 177, 117),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  )
);