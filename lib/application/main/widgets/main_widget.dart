import 'package:abas_desktop/application/main/main_viewmodel.dart';
import 'package:abas_desktop/application/navegador/navegador_view.dart';
import 'package:abas_desktop/application/programa.dart';
import 'package:abas_desktop/application/texto/text_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatelessWidget implements Programa {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Column(
            children: [
              IconButton.filled(
                onPressed: () => mainViewModel.abrir(TextView()),
                icon: Icon(Icons.edit_document, size: 18),
              ),
              Text("Editor de texto"),
            ],
          ),
          SizedBox(width: 15),
          Column(
            children: [
              IconButton.filled(
                onPressed: () =>  mainViewModel.abrir(NavegadorView()),
                icon: Icon(Icons.language, size: 18),
              ),
              Text("Navegador"),
            ],
          ),
        ],
      ),
    );
  }
  
  @override
  get titulo => "Nova aba";
}
