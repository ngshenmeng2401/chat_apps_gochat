import 'package:chat_apps_gochat/pages/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Sign Up".tr,
          style: const TextStyle(
            fontSize:24
          )),
      ),
      body:SingleChildScrollView(
        child: Center(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(25,40,25,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: screenHeight / 4,
                  width: screenWidth / 1.1,),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          enableInteractiveSelection: true,
                          onChanged: (value) => controller.checkTextField(),
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                          decoration: InputDecoration(
                            labelText: 
                            "Email".tr,
                            icon: const Icon(Icons.email,)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          enableInteractiveSelection: true,
                          onChanged: (value) => controller.checkTextField(),
                          keyboardType: TextInputType.name,
                          controller: controller.userNameController,
                          decoration: InputDecoration(
                            labelText: 
                            "User Name".tr,
                            icon: const Icon(Icons.people,)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          enableInteractiveSelection: true,
                          onChanged: (value) => controller.checkTextField(),
                          keyboardType: TextInputType.phone,
                          controller: controller.phoneNoController,
                          decoration: InputDecoration(
                            labelText: 
                            "Phone No".tr,
                            icon: const Icon(Icons.phone,)
                          ),
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,0),
                        child: TextField(
                          onChanged: (value) => controller.checkTextField(),
                          keyboardType: TextInputType.visiblePassword,
                          controller: controller.passwordController,
                          decoration: InputDecoration(
                            labelText: 
                            "Password".tr,
                            icon: const Icon(Icons.lock,)
                          ),
                          obscureText: true,
                        ),
                      ),
                      Padding(
                        padding:const EdgeInsets.fromLTRB(15,0,15,15),
                        child: TextField(
                          onChanged: (value) => controller.checkTextField(),
                          controller: controller.confirmPasswordController,
                          decoration: InputDecoration(
                            labelText: 
                            "Confirm Password".tr,
                            icon: const Icon(Icons.lock,),
                            ),
                          obscureText: true,
                        )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height:15),
                Obx(() => MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: screenHeight/18,
                  minWidth: screenWidth/1.1,
                  color: controller.isTyping.value == true
                    ? Colors.black
                    : Colors.grey[200],
                  onPressed: controller.isTyping.value == true
                    ? (){
                      controller.signUpDialog();
                    }
                    : null,
                  child: Text(
                    "Sign Up".tr,
                    style: TextStyle(
                        color: controller.isTyping.value == true
                        ? Colors.white
                        : Colors.transparent,
                        fontSize: 20,
                    )),
                )),
                const SizedBox(height:20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account".tr,
                      style: const TextStyle(
                        fontSize: 16,
                        // fontWeight: FontWeight.bold,
                      )),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                        controller.navigateLoginView();
                      },
                      child: Text(
                        "Login".tr,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                    )
                  ],
                )
              ],
            ),
          )
        ),
      )
    );
  }
}