import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/theme_controller.dart';

initConfigurations() async {
  WidgetsFlutterBinding.ensureInitialized();

  // GetX Bindings
  Get.lazyPut<ThemeController>(() => ThemeController());
}
