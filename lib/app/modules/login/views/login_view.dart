import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: controller.formKey(),
            child: Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Email"),
                    TextFormField(
                      controller: controller.emailController.value,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: controller.emailFocus(),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Username tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Text("Password"),
                    TextFormField(
                      controller: controller.passwordController.value,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      focusNode: controller.passwordFocus(),
                      textInputAction: TextInputAction.done,
                      obscureText: controller.secured(),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                        icon: Icon(controller.secured()
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined),
                        onPressed: () {
                          controller.secured(!controller.secured());
                        },
                      )),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "password minimal 6 karakter";
                        }

                        if (value == null || value == "") {
                          return "password tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: Get.width,
                      child: MaterialButton(
                        onPressed: () {
                          controller.submit();
                        },
                        color: Colors.blue,
                        child: const Text("Login", style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
