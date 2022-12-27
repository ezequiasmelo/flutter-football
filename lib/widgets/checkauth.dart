import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/autenticacao_page.dart';

class CheckAuth extends StatelessWidget {
  final bool userIsAuthenticated = false;

  const CheckAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return userIsAuthenticated ? const HomePage() : AutenticacaoPage();
  }
}
