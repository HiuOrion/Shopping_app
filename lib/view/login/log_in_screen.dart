import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/controller/login_controller.dart';
import 'package:shopping_app/route/app_route.dart';
import 'package:shopping_app/styles/button.dart';
import 'package:shopping_app/styles/font.dart';
import 'package:regexpattern/regexpattern.dart';
import 'package:get/get.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.find<LogInController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 60),
            Container(
              width: 60,
              height: 65,
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/images/logo.svg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Đăng nhập',
                style: header,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nhập Email và mật khẩu của bạn',
                style: paragraph,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Form(
                  key: controller.formKeyLogIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: customInputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || !RegExp(r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$")
                              .hasMatch(value)) {
                            return "Nhập lại Email";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          controller.enteredEmail.value = value!;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(() => Stack(
                        children: [TextFormField(
                            decoration: customInputDecoration(labelText: "Mật khẩu"),
                            obscureText: controller.isSecurePass.value,
                            validator: (value) {
                              if (value == null || !value.isPasswordEasy() ) {
                                return "Nhập lại Mật khẩu ít nhất 8 kí tự ";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.enteredPassword.value = value!;
                            },
                          ),
                          Positioned(
                            right: 8,
                            top: 8,
                            child:  IconButton(
                                alignment: Alignment.bottomRight,
                                onPressed: controller.togglePasswordVisibility,
                                icon: Icon(controller.isSecurePass.value
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ),
                        ],
                      ),),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            Get.toNamed(AppRoute.forgotPass);
                          },
                          child: Text("Quên mật khẩu?", style: paragraph),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.logIn,
                            style: buttonPrimary,
                            child: Text("Đăng nhập", style: textButton),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Bạn chưa có tài khoản?", style: paragraph),
                            TextButton(
                                onPressed: () {
                                  Get.offAllNamed(AppRoute.signUp);
                                },
                                child: Text(
                                  "Đăng ký",
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
