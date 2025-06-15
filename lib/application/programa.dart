import 'package:flutter/material.dart';

abstract class Programa extends Widget {
  final String _titulo = "Sem título";
  final IconData _icone = Icons.edit_document;

  String get titulo => _titulo;
  IconData get icone => _icone;
  const Programa({super.key});
}