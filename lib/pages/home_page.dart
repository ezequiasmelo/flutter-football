import 'package:flutter/material.dart';
import 'package:flutter_football/models/time.dart';
import 'package:flutter_football/pages/home_controller.dart';
import 'package:flutter_football/pages/time_page.dart';
import 'package:flutter_football/repositories/times_repository.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Brasileirão'),
      ),
      body: Consumer<TimesRepository>(
        builder: ((_, repository, __) {
          return ListView.separated(
            itemCount: repository.times.length,
            itemBuilder: (BuildContext contexto, int time) {
              final List<Time> tabela = repository.times;
              return ListTile(
                leading: Image.network(tabela[time].brasao),
                title: Text(tabela[time].nome),
                subtitle: Text('Titulos: ${tabela[time].titulos.length}'),
                trailing: Text(
                  tabela[time].pontos.toString(),
                ),
                onTap: () {
                  Navigator.push(
                      contexto,
                      MaterialPageRoute(
                        builder: (_) => TimePage(
                          key: Key(tabela[time].nome),
                          time: tabela[time],
                        ),
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
