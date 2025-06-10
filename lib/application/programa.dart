import 'package:flutter/material.dart';

abstract class Programa extends Widget {
  final String _titulo = "Sem título";

  get titulo => _titulo;

  const Programa({super.key});
}