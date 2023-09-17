import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:git_gui/constants/application_constants.dart';
import 'package:git_gui/presentation/header_components/app_container.dart';
import 'package:git_gui/utils/app_config.dart';

void main() {
  AppConfig.load();
  print(AppConfig.getConfig());
  initConstants();
  runApp(const MyApp());
  doWhenWindowReady(() {
    final win = appWindow;
    var minimumSize = Size(SCREEN_MIN_RES_WIDTH, SCREEN_MIN_RES_HEIGHT);
    win.minSize = minimumSize;
    win.alignment = Alignment.center;
    win.title = "Custom window with Flutter";
    win.maximizeOrRestore();
  });
}

const borderColor = Color(0xFF000000);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: WindowBorder(
          color: borderColor,
          width: 1,
          child: const AppContainer(),
        ),
      ),
    );
  }
}

const sidebarColor = Color(0xFF000000);
