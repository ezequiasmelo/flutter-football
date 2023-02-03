import 'package:flutter/material.dart';
import 'package:flutter_football/services/auth_service.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../pages/home_page.dart';
import '../pages/autenticacao_page.dart';

class CheckAuth extends StatelessWidget {
  final bool userIsAuthenticated = false;

  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    // return userIsAuthenticated ? const HomePage() : AutenticacaoPage();
    return Obx(() => AuthService.to.userIsAuthenticated.value
        ? const HomePage()
        : AutenticacaoPage());
  }
}
