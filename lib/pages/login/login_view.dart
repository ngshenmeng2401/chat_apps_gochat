import 'package:chat_apps_gochat/pages/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login".tr, style: const TextStyle(fontSize: 24)),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 80, 0, 10),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: screenHeight / 4,
                    width: screenWidth / 1.1,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (_) {
                          return ListTile(
                            leading: const Icon(
                              Icons.email,
                            ),
                            title: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _.emailController,
                              decoration: InputDecoration(
                                labelText: "Email".tr,
                              ),
                            ),
                          );
                        },
                      ),
                      GetBuilder<LoginController>(
                        init: LoginController(),
                        builder: (_) {
                          return ListTile(
                            leading: const Icon(
                              Icons.lock,
                            ),
                            title: TextField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _.passwordController,
                              decoration: InputDecoration(
                                labelText: "Password".tr,
                              ),
                              obscureText: true,
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Row(
                  children: [
                    GetBuilder<LoginController>(
                      init: LoginController(),
                      builder: (controller) {
                        return Checkbox(
                            value: controller.rememberMe,
                            activeColor: Colors.black,
                            onChanged: (value) {
                              controller.rememberEmailPassword(
                                  value!,
                                  controller.emailController.text.toString(),
                                  controller.passwordController.text.toString(),
                              );
                            });
                      },
                    ),
                    Text("Remember_Me".tr, style: const TextStyle(fontSize: 16)),
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      controller.forgotPasswordDialog();
                    },
                    child: Text(
                      "Forgot_Password".tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minWidth: screenWidth / 1.1,
                    height: screenHeight / 18,
                    color: Colors.black,
                    onPressed: () {
                      controller.loginUser();
                    },
                    child: Text("Login".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account ?".tr,
                            style: const TextStyle(fontSize: 16)),
                        const SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                            onTap: () {
                              controller.navigateSignUpView();
                            },
                            child: Text(
                              "Sign Up".tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ],
                    ))
              ],
            ),
          ),
      )),
    );
  }
}