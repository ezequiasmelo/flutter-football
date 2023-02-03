import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService extends GetxController {
  var userIsAuthenticated = false.obs;

  @override
  void onInit() {
    super.onInit();
    userIsAuthenticated.value = true;
  }

  static AuthService get to => Get.find<AuthService>();

  showSnack(String titulo, String erro) {
    Get.snackbar(
      titulo,
      erro,
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  login(String email, String password) async {
    try {
      // await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      // showSnack('Erro no Login!', e);
    }
  }

  logout() async {
    try {
      // await _auth.signOut();
    } catch (e) {
      // showSnack('Erro ao sair!', e.message);
    }
  }
}
