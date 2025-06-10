
import 'package:abas_desktop/application/programa.dart';
import 'package:flutter/material.dart';

class TextView extends StatefulWidget implements Programa {
  const TextView({super.key});

  @override
  State<TextView> createState() => _TextViewState();
  
  @override
  get titulo => "Editor de texto";
}

class _TextViewState extends State<TextView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: TextField(
        maxLines: 8,
        decoration: InputDecoration.collapsed(hintText: ""),
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;

}