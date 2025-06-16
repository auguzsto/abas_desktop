import 'package:abas_desktop/application/main/main_viewmodel.dart';
import 'package:abas_desktop/application/main/widgets/main_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';

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
        drawer: Drawer(),
        appBar: AppBar(
          actions: [
            IconButton(
              onLongPress: () => windowManager.startDragging(),
              onPressed: () => windowManager.startDragging(),
              icon: Icon(Icons.back_hand),
            ),
            IconButton(
              onPressed: () async {
                if (await windowManager.isMaximized()) {
                  return windowManager.unmaximize();
                }
                return windowManager.maximize();
              },
              icon: Icon(Icons.rectangle_outlined),
            ),
            IconButton(
              onPressed: () => windowManager.close(),
              icon: Icon(Icons.close),
            ),
          ],
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
          titleSpacing: 0,
          title: Row(
            children: [
              Expanded(
                flex: 1,
                child: TabBar(
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                  isScrollable: false,
                  onTap: (value) => mainViewModel.selecionar(value),
                  unselectedLabelColor: Colors.white,
                  unselectedLabelStyle: TextStyle(fontSize: 10),
                  dividerHeight: 0,
                  labelPadding: EdgeInsets.only(top: 8, left: 10),
                  tabs: List.generate(mainViewModel.processos.length, (index) {
                    return Row(
                      children: [
                        Tab(
                          child: Row(
                            spacing: 8,
                            children: [
                              Icon(
                                mainViewModel.processos[index].programa.icone,
                                size: 13,
                              ),
                              Text(
                                mainViewModel.processos[index].programa.titulo,
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () => mainViewModel.remover(index),
                          icon: Icon(Icons.close, size: 18),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              IconButton(
                onPressed: () => mainViewModel.adicionar(MainWidget()),
                icon: Icon(Icons.add),
              ),
            ],
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
