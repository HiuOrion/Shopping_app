import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:shopping_app/common/base_button.dart';
import 'package:shopping_app/common/custom_text_field.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/font.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<LogInController>();
    // final media = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
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
                'Đăng nhập',
                style: kFontHeader,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nhập Email và mật khẩu của bạn',
                style: kFontParagraph,
              ),
            ),

            SizedBox(height: 30.h),

            Center(
              child: Form(
                  key: controller.formKeyLogIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.forgotPass);
                          },
                          child: Text("Quên mật khẩu?", style: kFontParagraph),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      BaseButton(
                          title: "Đăng nhập", onPressed: controller.logIn),

                      SizedBox(height: 10.h),

                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Bạn chưa có tài khoản?",
                                style: kFontParagraph),
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed(AppRoute.signUp);
                                },
                                child: Text(
                                  "Đăng ký",
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(255, 80, 177, 114)),
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
