import 'package:flutter/material.dart';


ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(double.maxFinite, 50),
  backgroundColor: Color.fromARGB(255, 83, 177, 117),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  )
);