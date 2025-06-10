import 'package:abas_desktop/application/processo.dart';
import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  final List<Processo> processos = [];
  int selecionado = 0;

  void selecionar(int index) {
    selecionado = index;
    notifyListeners();
  }

  void abrir(Programa programa) {
    processos[selecionado].programa = programa;
    notifyListeners();
  }

  void adicionar(Programa programa) {
    final processo = Processo(programa);
    processos.add(processo);
    notifyListeners();
  }

  void remover(int index) {
    processos.remove(processos[index]);
    notifyListeners();
  }
}
