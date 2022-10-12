// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, prefer_const_declarations, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_parking_app/service/api_service.dart';
import 'package:simple_parking_app/utils/colors_theme.dart';
import 'package:simple_parking_app/view/auth/login_page.dart';

class SignupPage extends StatelessWidget {
  static final String TAG = '/SignupPage';

  final _tfEmail = TextEditingController();
  final _tfPassword = TextEditingController();
  final _tfName = TextEditingController();
  final _tfPhoneNumber = TextEditingController();

  final _isPasswordVisible = true.obs;
  final _isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "SignUp",
          style: TextStyle(
            color: Color(0xff06113D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Column(
          children: [
            //GAMBAR
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Image.asset(
                'assets/images/signup.png',
                width: double.maxFinite,
                height: 200,
              ),
            ),

            //CAPTION
            Container(
              margin: EdgeInsets.only(top: 12),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Signup !",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: ColorsTheme.myDarkBlue),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "With simple parking, parking becomes easier and more practical.",
                      style: TextStyle(
                        height: 1.5,
                        color: ColorsTheme.myGrey,
                      ),
                    ),
                  )
                ],
              ),
            ),

            //TEXT FIELD name
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: TextField(
                controller: _tfName,
                keyboardType: TextInputType.text,
                cursorColor: ColorsTheme.myOrange,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: ColorsTheme.myOrange),
                  ),
                  focusColor: ColorsTheme.myOrange,
                ),
              ),
            ),

            //TEXT FIELD NO.TELP
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: TextField(
                controller: _tfPhoneNumber,
                keyboardType: TextInputType.number,
                cursorColor: ColorsTheme.myOrange,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Mobile",
                  labelText: "Mobile",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: ColorsTheme.myOrange),
                  ),
                  focusColor: ColorsTheme.myOrange,
                ),
              ),
            ),

            //TEXT FIELD EMAIL
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: TextField(
                controller: _tfEmail,
                keyboardType: TextInputType.emailAddress,
                cursorColor: ColorsTheme.myOrange,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: "Email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(16),
                    ),
                    borderSide: BorderSide(color: ColorsTheme.myOrange),
                  ),
                  focusColor: ColorsTheme.myOrange,
                ),
              ),
            ),

            //TEXT FIELD PASSWORD
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Obx(
                () => TextField(
                  controller: _tfPassword,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: ColorsTheme.myOrange,
                  autocorrect: false,
                  obscureText: _isPasswordVisible.value,
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: _isPasswordVisible.value
                          ? Icon(Icons.visibility)
                          : Icon(Icons.visibility_off),
                      onPressed: () {
                        _isPasswordVisible.value = !_isPasswordVisible.value;
                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      borderSide: BorderSide(color: ColorsTheme.myOrange),
                    ),
                    focusColor: ColorsTheme.myOrange,
                  ),
                ),
              ),
            ),

            //BUTON SignUp
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Obx(
                () => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorsTheme.myLightOrange,
                    shape: StadiumBorder(),
                    minimumSize: Size(double.maxFinite, 50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isLoading.value
                          ? Container(
                              margin: const EdgeInsets.only(right: 16),
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                              ),
                            )
                          : SizedBox(),
                      Text(
                        "SignUp",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _isLoading.value
                                ? Colors.grey
                                : ColorsTheme.myDarkBlue),
                      ),
                    ],
                  ),
                  onPressed: _isLoading.value
                      ? null
                      : () async {
                          await ApiServices.signup(
                            name: _tfName.text,
                            phoneNumber: _tfPhoneNumber.text,
                            email: _tfEmail.text,
                            password: _tfPassword.text,
                          ).then(
                            (value) => ProccessSignup(
                              isError: value.error,
                              message: value.message,
                            ),
                          );
                        },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ProccessSignup({required bool isError, required String message}) async {
    //LOADING STATE CONTROL
    _isLoading.value = !_isLoading.value;
    await Future.delayed(Duration(seconds: 2));
    _isLoading.value = !_isLoading.value;

    //CLEAR TEXT FIELD
    if (!isError) {
      _tfName.text = "";
      _tfPhoneNumber.text = "";
      _tfEmail.text = "";
      _tfPassword.text = "";
    }

    //SHOWING DIALOG
    Get.defaultDialog(
      radius: 16,
      title: message,
      titlePadding: EdgeInsets.symmetric(vertical: 16),
      titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: ColorsTheme.myDarkBlue,
      ),
      content: Text(
        isError
            ? "Unable to use the signed up email address"
            : "Please login using your new account",
        textAlign: TextAlign.center,
        style: TextStyle(
          height: 1.5,
          color: ColorsTheme.myGrey,
        ),
      ),
      contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
      textCancel: "Come back",
      textConfirm: isError ? null : "Login",
      confirmTextColor: ColorsTheme.myDarkBlue,
      onConfirm: isError ? null : () => Get.offAllNamed(LoginPage.TAG),
    );
  }
}
