import 'package:abas_desktop/application/main/widgets/main_widget.dart';
import 'package:abas_desktop/application/processo.dart';
import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  final List<Processo> processos = [Processo(MainWidget())]; // PID 1
  int selecionado = 0;

  void selecionar(int index) {
    selecionado = index;
    notifyListeners();
  }

  void abrir(Programa programa) {
    final pid = _indiceValido(selecionado);
    processos[pid].programa = programa;
    notifyListeners();
  }

  void adicionar(Programa programa) {
    final processo = Processo(programa);
    processos.add(processo);
    notifyListeners();
  }

  void remover(int index) {
    final pid = _indiceValido(index);
    processos.remove(processos[pid]);
    notifyListeners();
  }

  int _indiceValido(int index) {
    if (index == 0) {
      return 0;
    }

    if (processos.asMap().containsKey(index)) {
      return index;
    }

    return _indiceValido(index-1);
  }
}
