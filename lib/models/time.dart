import 'package:flutter/material.dart';

import 'titulo.dart';

class Time {
  int? id;
  String nome;
  String brasao;
  int pontos;
  Color? cor;
  List<Titulo>? titulos = [];

  Time({
    this.id,
    required this.brasao,
    required this.nome,
    required this.pontos,
    required this.cor,
    this.titulos,
  });
}
