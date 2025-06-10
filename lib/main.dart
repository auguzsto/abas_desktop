import 'package:abas_desktop/application/app_widget.dart';
import 'package:abas_desktop/application/main/main_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainViewModel()),
        ],
      child: AppWidget(),
    ),
  );
}
