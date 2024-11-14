import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_app/styles/app_colors.dart';
import 'package:shopping_app/styles/font.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final String? errorText; // Lưu trữ thông báo lỗi nếu có
  final FormFieldSetter<String> onSaved;
  final bool isSecurePass;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.isSecurePass = false,
    required this.hintText,
    this.validator,
    this.errorText,
    required this.onSaved,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);

    return TextFormField(
      inputFormatters: [],
      obscureText: isSecurePass,
      onSaved: onSaved,
      validator: validator,
      // Sử dụng hàm validator để xác thực
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: kStyleTextField(Colors.grey, 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorText: errorText,
        // Hiển thị thông báo lỗi nếu có
        contentPadding: EdgeInsets.symmetric(
          vertical: media.height * 0.03,
          horizontal: media.width * 0.05,
        ),
      ),
    );
  }
}
