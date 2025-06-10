import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';
import 'package:webview_all/webview_all.dart';

class NavegadorView extends StatefulWidget implements Programa {
  const NavegadorView({super.key});

  @override
  State<NavegadorView> createState() => _NavegadorViewState();
  
  @override
  get titulo => "Navegador";
}

class _NavegadorViewState extends State<NavegadorView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Webview(url: "https://google.com",),
        ),
      ],
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}
