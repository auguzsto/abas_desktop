import 'package:abas_desktop/application/main/main_viewmodel.dart';
import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciadorTarefasView extends StatefulWidget implements Programa {
  const GerenciadorTarefasView({super.key});

  @override
  State<GerenciadorTarefasView> createState() => _GerenciadorTarefasViewState();

  @override
  get titulo => "Gerenciador de tarefas";
  
  @override
  get icone => Icons.table_restaurant;
}

class _GerenciadorTarefasViewState extends State<GerenciadorTarefasView> {
  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemCount: mainViewModel.processos.length,
      itemBuilder: (context, index) {
        final programa = mainViewModel.processos[index].programa;
        return ListTile(
          leading: Icon(programa.icone, color: Color.fromARGB(255, 5, 12, 61)),
          title: Text(programa.titulo),
          subtitle: Text("PID ${index.toString()}"),
          trailing: IconButton(onPressed: () => mainViewModel.remover(index), icon: Icon(Icons.stop, color: Colors.red)),
        );
      },
    );
  }
}
