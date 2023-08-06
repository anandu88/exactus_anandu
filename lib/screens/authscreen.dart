
import 'package:exactus_anandu/controllers/login_controller.dart';
import 'package:exactus_anandu/screens/widgets/input_fileds.dart';
import 'package:exactus_anandu/screens/widgets/summit_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

   RegisterationController registerationController =
      Get.put(RegisterationController());
      Logincontroller loginController=Get.put(Logincontroller());
       var isLogin = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(36),
          child: Center(
            child: Obx(
              () =>  Column(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'WELCOME',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MaterialButton(
                          color: !isLogin.value ? Colors.white : Colors.amber,
                          onPressed: () {
                            isLogin.value = false;
                          },
                          child: const Text('Register'),
                        ),
                        MaterialButton(
                          color: isLogin.value ? Colors.white : Colors.amber,
                          onPressed: () {
                            isLogin.value = true;
                          },
                          child: const Text('Login'),
                        ),

                      ],

                    ),
                     const SizedBox(
                      height: 80,
                    ),
                    isLogin.value ? loginWidget() : registerWidget()
                
              ]),
            ),
          ),
        ),
      ),
    );
  }
  
 Widget loginWidget() {
  return Column(
    children: [
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(textEditingController: loginController.emailController, hintText: 'email address'),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(textEditingController: loginController.passwordController, hintText: 'password'),
        const SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => loginController.loginwithEmail(),
          title: 'Login',
        )
      ],
  );
 }
 
 Widget registerWidget() {
  return Column(
     children: [
        InputTextFieldWidget(textEditingController: registerationController.nameController,  hintText: 'name',),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
           textEditingController:  registerationController.emailController, hintText: "email address"),
        const SizedBox(
          height: 20,
        ),
        InputTextFieldWidget(
            textEditingController:registerationController.passwordController , hintText: 'password'),
        const SizedBox(
          height: 20,
        ),
        SubmitButton(
          onPressed: () => registerationController.registerWithEmail(),
          title: 'Register',
        )
      ],
  );
 }
}
