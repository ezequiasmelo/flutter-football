import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_football/models/time.dart';

class TimePage extends StatefulWidget {
  Time time;

  TimePage({super.key, required this.time});

  @override
  State<TimePage> createState() => _TimePageState();
}

class _TimePageState extends State<TimePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
