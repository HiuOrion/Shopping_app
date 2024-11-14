import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shopping_app/common/base_button.dart';
import 'package:shopping_app/controller/signup_controller.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/custom_text_field.dart';
import '../../styles/font.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Lấy SignUpController từ Binding
    final SignUpController controller = Get.find<SignUpController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
             SizedBox(height: 28.2.h),
            Container(
              width: 60,
              height: 65,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 60.h),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Đăng ký',
                style: kFontHeader,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nhập thông tin xác thực của bạn',
                style: kFontParagraph,
              ),
            ),

            SizedBox(height: 30.h),

            Center(
              child: Form(
                  key: controller.formKeySignUp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                        hintText: "Tên người dùng ",
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              value.length < 4) {
                            return "Nhập lại tên người dùng trên 4 kí tự";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.enteredUsername.value = value!;
                        },
                        keyboardType: TextInputType.text,
                      ),

                      SizedBox(height: 10.h),

                      CustomTextField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          // Chỉ cho phép nhập số
                          LengthLimitingTextInputFormatter(10),
                          // Giới hạn độ dài số điện thoại
                        ],
                        hintText: "Số điện thoại",
                        onSaved: (value) {
                          controller.enteredPhoneNumber.value = value!;
                        },
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !RegExp(r'^\d{9,10}$').hasMatch(value)) {
                            return "Số điện thoại không hợp lệ";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      CustomTextField(
                        hintText: "Email",
                        onSaved: (value) {
                          controller.enteredEmail.value = value!;
                        },
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              !RegExp(r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$")
                                  .hasMatch(value)) {
                            return "Nhập lại Email";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      Obx(
                        () => Stack(
                          children: [
                            CustomTextField(
                              onSaved: (value) {
                                controller.enteredPassword.value = value!;
                              },
                              isSecurePass: controller.isSecurePass.value,
                              validator: (value) {
                                if (value == null || !value.isPasswordEasy()) {
                                  return "Nhập lại Mật khẩu ít nhất 8 kí tự ";
                                }
                                return null;
                              },
                              hintText: "Mật khẩu",
                              keyboardType: TextInputType.text,
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: IconButton(
                                  alignment: Alignment.bottomRight,
                                  onPressed:
                                      controller.togglePasswordVisibility,
                                  icon: Icon(controller.isSecurePass.value
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10.h),

                      BaseButton(
                          title: "Đăng ký", onPressed: controller.signUp),

                      SizedBox(height: 10.h),


                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Bạn đã có tài khoản?", style: kFontParagraph),
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed(AppRoute.logIn);
                                },
                                child: Text(
                                  "Đăng nhập",
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromARGB(255, 80, 177, 114)),
                                ))
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

