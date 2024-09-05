import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/controller/signup_controller.dart';
import 'package:shopping_app/route/app_route.dart';
import '../../styles/button.dart';
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
                'Đăng ký',
                style: header,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nhập thông tin xác thực của bạn',
                style: paragraph,
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Form(
                  key: controller.formKeySignUp,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        maxLength: 50,
                        decoration: customInputDecoration(labelText: 'Tên người dùng'),
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
                      ),
                      TextFormField(
                        decoration: customInputDecoration(labelText: 'Số điện thoại'),
                        keyboardType: TextInputType.number,

                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                          LengthLimitingTextInputFormatter(10), // Giới hạn độ dài số điện thoại
                        ],
                        validator: (value) {
                          if (value == null || value.isEmpty || !RegExp(r'^\d{9,10}$').hasMatch(value)) {
                            return "Số điện thoại không hợp lệ";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          // Lưu số điện thoại vào controller
                          controller.enteredPhoneNumber.value = value!;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: customInputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              !RegExp(r"^[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$")
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
                      Stack(
                        children: [
                          Obx(() => TextFormField(
                            decoration: customInputDecoration(labelText: 'Mật khẩu'),
                            obscureText: controller.isSecurePass.value,
                            validator: (value) {
                              if (value == null || value.length < 8) {
                                return "Nhập lại Mật khẩu trên 8 kí tự";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              controller.enteredPassword.value = value!;
                            },
                          )),
                          Positioned(
                            right: 8,
                            top: 8,
                            child: IconButton(
                              alignment: Alignment.bottomRight,
                              onPressed: controller.togglePasswordVisibility,
                              icon: Obx(() => Icon(controller.isSecurePass.value
                                  ? Icons.visibility_off
                                  : Icons.visibility)),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: controller.signUp,
                            style: buttonPrimary,
                            child: Text("Đăng ký", style: textButton),
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
                            Text("Bạn đã có tài khoản?", style: paragraph),
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

