import 'package:flutter/cupertino.dart';

class Exercise extends StatefulWidget {
  const Exercise({super.key});

  @override
  State<Exercise> createState() => _ExerciseState();
}

class _ExerciseState extends State<Exercise> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class Exercisemodel {
  final String name;
  final List<Map<String, String>> set;

  Exercisemodel({
    required this.name,
    required this.set,
  });
}

