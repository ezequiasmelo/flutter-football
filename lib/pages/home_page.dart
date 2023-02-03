import 'package:flutter/material.dart';
import 'package:flutter_football/controllers/theme_controller.dart';
import 'package:flutter_football/models/time.dart';
import 'package:flutter_football/pages/time_page.dart';
import 'package:flutter_football/repositories/times_repository.dart';
import 'package:flutter_football/widgets/brasao.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = ThemeController.to;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Obx(() => controller.isDark.value
                      ? const Icon(Icons.brightness_7)
                      : const Icon(Icons.brightness_2)),
                  title: Obx(() => controller.isDark.value
                      ? const Text('Light')
                      : const Text('Dark')),
                  onTap: () => controller.changeTheme(),
                ),
              ),
              PopupMenuItem(
                child: ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Sair'),
                  onTap: () {
                    Navigator.pop(context);
                    AuthService.to.logout();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Consumer<TimesRepository>(
        builder: ((_, repository, __) {
          return ListView.separated(
            itemCount: repository.times.length,
            itemBuilder: (BuildContext contexto, int time) {
              final List<Time> tabela = repository.times;
              return ListTile(
                leading: Brasao(
                  image: tabela[time].brasao,
                  width: 40,
                ),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos!.length}'),
                trailing: Text(
                  tabela[time].pontos.toString(),
                ),
                onTap: () {
                  Get.to(() => TimePage(
                        key: Key(tabela[time].nome),
                        time: tabela[time],
                      ));
                },
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            padding: const EdgeInsets.all(16),
          );
        }),
      ),
    );
  }
}
