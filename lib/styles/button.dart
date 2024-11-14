import 'package:flutter/material.dart';
import 'package:shopping_app/styles/app_colors.dart';


ButtonStyle buttonPrimary = ElevatedButton.styleFrom(
  minimumSize: Size(double.maxFinite, 50),
  backgroundColor: AppColors.primary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(20))
  )
);