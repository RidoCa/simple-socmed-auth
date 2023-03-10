import 'package:auth_socmed/app/data/size.dart';
import 'package:auth_socmed/app/modules/auth/loginregis/widget/icon_socmed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loginregis_controller.dart';

class LoginregisView extends GetView<LoginregisController> {
  const LoginregisView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: parameterGLobal.defaultPadding,
          ),
          child: Obx(
            () => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // image
                Center(
                  child: Image.network(
                    'https://img.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg?w=2000',
                    height: 150,
                  ),
                ),
                // text
                Text(
                  controller.isRegister.value
                      ? "Signup For Free"
                      : "Signin For Free",
                  style: TextStyle(
                    fontSize: parameterGLobal.sizeFontHeaderCard,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // form email
                Container(
                  margin: EdgeInsets.only(
                    top: parameterGLobal.defaultMargin * 2,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: parameterGLobal.defaultPadding,
                  ),
                  child: TextField(
                    controller: controller.emailUserTextController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: parameterGLobal.defaultPadding,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            parameterGLobal.defaultBorder,
                          ),
                        ),
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: parameterGLobal.sizeFontMedium,
                      ),
                      errorText:
                          controller.errorEmail.value ? 'Email Invalid' : null,
                    ),
                    onChanged: (value) => controller.validateEmail(),
                  ),
                ),
                // form password
                Container(
                  margin: EdgeInsets.only(
                    top: parameterGLobal.defaultMargin / 2,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: parameterGLobal.defaultPadding,
                  ),
                  child: TextField(
                    controller: controller.passwordUserTextController,
                    obscureText: controller.showPass.value ? true : false,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: parameterGLobal.defaultPadding,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            parameterGLobal.defaultBorder,
                          ),
                        ),
                      ),
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: parameterGLobal.sizeFontMedium,
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => controller.showPass.value =
                            !controller.showPass.value,
                        icon: Icon(
                          controller.showPass.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: parameterGLobal.sizeFontSubHeaderCard,
                        ),
                      ),
                      errorText: controller.errorPass.value
                          ? 'Password Invalid'
                          : null,
                    ),
                    onChanged: (value) => controller.validatePassword(),
                  ),
                ),
                // checkbox
                CheckboxListTile(
                  title: Text(
                    'Remember Me',
                    style: TextStyle(
                      fontSize: parameterGLobal.sizeFontMedium,
                    ),
                  ),
                  checkColor: Colors.white,
                  activeColor: Colors.blueGrey,
                  controlAffinity: ListTileControlAffinity.leading,
                  checkboxShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  value: true,
                  onChanged: (val) {},
                ),
                // btn login
                Container(
                  height: 50,
                  width: Get.size.width,
                  margin: EdgeInsets.all(
                    parameterGLobal.defaultMargin,
                  ),
                  child: ElevatedButton(
                    onPressed: () => controller.signUpEmail(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            parameterGLobal.defaultBorder * 2,
                          ),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.green,
                      ),
                    ),
                    child: controller.isRegister.value
                        ? const Text("Sign Up")
                        : const Text("Sign In"),
                  ),
                ),
                Text(
                  "or continue with",
                  style: TextStyle(
                    fontSize: parameterGLobal.sizeFontSmall,
                  ),
                ),
                // row socmed login/regis
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: parameterGLobal.defaultMargin,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      GestureDetector(
                        onTap: () => controller.signInGoogle(),
                        child: const IconSocmedRegister(
                          imgPath:
                              'https://img.icons8.com/color/512/google-logo.png',
                        ),
                      ),
                      GestureDetector(
                        onTap: () => controller.signInFacebook(),
                        child: const IconSocmedRegister(
                          imgPath:
                              'https://w7.pngwing.com/pngs/561/460/png-transparent-fb-facebook-facebook-logo-social-media-icon.png',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: parameterGLobal.defaultMargin,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: !controller.isRegister.value
                            ? "Don't have an account? "
                            : "Already have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: parameterGLobal.sizeFontSmall,
                        ),
                      ),
                      TextSpan(
                        text: !controller.isRegister.value
                            ? 'Sign Up'
                            : 'Sign in',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: parameterGLobal.sizeFontSmall,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            controller.isRegister.value =
                                !controller.isRegister.value;
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
