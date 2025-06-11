import 'package:abas_desktop/application/main/main_viewmodel.dart';
import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppIcon extends StatelessWidget {
  final Programa programa;
  const AppIcon({super.key, required this.programa});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return Column(
      children: [
        IconButton.filled(
          style: ButtonStyle(backgroundColor: WidgetStateColor.resolveWith((states) => Color.fromARGB(255, 5, 12, 61))),
          onPressed: () => mainViewModel.abrir(programa),
          icon: Icon(programa.icone, size: 18),
        ),
        Text(programa.titulo),
      ],
    );
  }
}
