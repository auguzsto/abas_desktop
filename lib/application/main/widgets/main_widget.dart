import 'package:abas_desktop/application/gerenciador_tarefas/gerenciador_tarefas_view.dart';
import 'package:abas_desktop/application/main/widgets/appicon_widget.dart';
import 'package:abas_desktop/application/navegador/navegador_view.dart';
import 'package:abas_desktop/application/programa.dart';
import 'package:abas_desktop/application/texto/text_view.dart';
import 'package:flutter/material.dart';

class MainWidget extends StatelessWidget implements Programa {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        spacing: 15,
        children: [
          AppIcon(programa: TextView()),
          AppIcon(programa: NavegadorView()),
          AppIcon(programa: GerenciadorTarefasView()),
        ],
      ),
    );
  }
  
  @override
  get titulo => "Nova aba";
  
  @override
  get icone => Icons.create_new_folder_sharp;
}
