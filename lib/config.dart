import 'package:flutter/material.dart';
import 'package:flutter_football/services/auth_service.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GetX Bindings
  Get.lazyPut<ThemeController>(() => ThemeController());
  Get.lazyPut<AuthService>(() => AuthService());
}
