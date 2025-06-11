import 'package:abas_desktop/application/main/main_viewmodel.dart';
import 'package:abas_desktop/application/main/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final mainViewModel = context.watch<MainViewModel>();

    return DefaultTabController(
      initialIndex: 0,
      animationDuration: Duration.zero,
      length: mainViewModel.processos.length,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 5, 12, 61),
                  const Color.fromARGB(255, 82, 96, 173),
                ],
              ),
            ),
          ),
          title: Row(
            children: [
              Text("Desktop"),
              SizedBox(width: 70),
              IconButton(
                onPressed: () => mainViewModel.adicionar(MainWidget()),
                icon: Icon(Icons.add),
              ),
            ],
          ),
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            dividerColor: Colors.white,
            isScrollable: false,
            onTap: (value) => mainViewModel.selecionar(value),
            unselectedLabelColor: Colors.white,
            unselectedLabelStyle: TextStyle(fontSize: 10),
            tabs: List.generate(mainViewModel.processos.length, (index) {
              return Row(
                children: [
                  Tab(
                    child: Row(
                      spacing: 8,
                      children: [
                        Icon(mainViewModel.processos[index].programa.icone, size: 13),
                        Text(mainViewModel.processos[index].programa.titulo)
                      ],
                    )
                  ),
                  IconButton(onPressed: () => mainViewModel.remover(index), icon: Icon(Icons.close, size: 18,))
                ],
              );
            }),
          ),
          foregroundColor: Colors.white,
        ),
        body: TabBarView(
          children: List.generate(
            mainViewModel.processos.length,
            (index) => mainViewModel.processos[index].programa,
          ),
        ),
      ),
    );
  }
}
