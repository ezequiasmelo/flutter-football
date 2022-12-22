import 'package:flutter/material.dart';
import 'package:flutter_football/models/time.dart';
import 'package:flutter_football/pages/add_titulo_page.dart';
import 'package:flutter_football/repositories/times_repository.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TimePage extends StatefulWidget {
  final Time time;

  const TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  tituloPage() {
    Get.to(() => AddTituloPage(
          time: widget.time,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: widget.time.cor,
          title: Text(widget.time.nome),
          actions: [
            IconButton(icon: const Icon(Icons.add), onPressed: tituloPage)
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.stacked_line_chart),
                text: 'Estatísticas',
              ),
              Tab(
                icon: Icon(Icons.emoji_events),
                text: 'Titulos',
              )
            ],
            indicatorColor: Colors.white,
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Image.network(
                    widget.time.brasao.replaceAll("40x40", "100x100"),
                  ),
                ),
                Text(
                  'Pontos: ${widget.time.pontos}',
                  style: const TextStyle(fontSize: 22),
                )
              ],
            ),
            titulos()
          ],
        ),
      ),
    );
  }

  Widget titulos() {
    final time = Provider.of<TimesRepository>(context)
        .times
        .firstWhere((element) => element.nome == widget.time.nome);

    final quantidade = time.titulos.length;

    return quantidade == 0
        ? const Center(
            child: Text('Nenhum Titulo Ainda!'),
          )
        : ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const Icon(Icons.emoji_events),
                title: Text(time.titulos[index].campeonato),
                trailing: Text(time.titulos[index].ano),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
            itemCount: quantidade,
          );
  }
}
