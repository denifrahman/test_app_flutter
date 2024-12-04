import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app_flutter/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocus = FocusNode().obs;
  final passwordFocus = FocusNode().obs;

  final _secured = true.obs;

  get secured => _secured;

  set secured(value) {
    _secured.value = value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    emailController().dispose();
    passwordController().dispose();
    emailFocus().dispose();
    passwordFocus().dispose();
    super.onClose();
  }

  bool validateForm() {
    formKey().currentState!.save();
    return formKey().currentState!.validate();
  }

  void resetForm() {
    emailController().clear();
    passwordController().clear();
    formKey().currentState!.reset();
  }

  void submit() {
    if (validateForm()) {
      if (validateCredential(
          email: emailController().text, password: passwordController().text)) {
        Get.offNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "credential not valid", snackPosition: SnackPosition.BOTTOM, backgroundColor: Color(0xFFB00020), colorText: Colors.white);
      }
    }
  }

  bool validateCredential({String? email, String? password}) {
    if (email == "test@mail.com" && password == "12345678") {
      return true;
    }
    return false;
  }
}
