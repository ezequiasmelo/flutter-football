import 'package:flutter/material.dart';

import 'titulo.dart';

class Time {
  String nome;
  String brasao;
  int pontos;
  Color? cor;
  List<Titulo> titulos = [];

  Time({
    required this.brasao,
    required this.nome,
    required this.pontos,
    required this.cor,
  });
}
