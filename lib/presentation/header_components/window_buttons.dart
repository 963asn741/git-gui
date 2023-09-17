import 'dart:ui';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({Key? key}) : super(key: key);

  @override
  _WindowButtonsState createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    appWindow;
    const padding = EdgeInsets.all(10);
    return Row(
      children: [
        MinimizeButton(colors: buttonColors, padding: padding),
        appWindow.isMaximized
            ? RestoreButton(
                padding: padding,
                colors: buttonColors,
                onPressed: maximizeOrRestore)
            : MaximizeButton(
                padding: padding,
                colors: buttonColors,
                onPressed: maximizeOrRestore),
        CloseButton(colors: closeButtonColors, padding: padding)
      ],
    );
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: const Color(0xFFC0C0C0),
    mouseOver: const Color(0xFF393E46),
    mouseDown: const Color(0xFF5E5E5E),
    iconMouseOver: const Color(0xFFC0C0C0),
    iconMouseDown: const Color(0xFFC0C0C0));

final closeButtonColors = WindowButtonColors(
    mouseOver: const Color(0xFFD32F2F),
    mouseDown: const Color(0xFFB71C1C),
    iconNormal: const Color(0xFFC0C0C0),
    iconMouseOver: Colors.white);

class RestoreButton extends WindowButton {
  RestoreButton(
      {Key? key,
      EdgeInsets? padding,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate})
      : super(
            padding: padding,
            key: key,
            colors: colors,
            animate: animate ?? false,
            iconBuilder: (buttonContext) =>
                RestoreIcon(color: buttonContext.iconColor),
            onPressed: onPressed ?? () => appWindow.maximizeOrRestore());
}

class MaximizeButton extends WindowButton {
  MaximizeButton(
      {Key? key,
      EdgeInsets? padding,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate})
      : super(
            padding: padding,
            key: key,
            colors: colors,
            animate: animate ?? false,
            iconBuilder: (buttonContext) =>
                MaximizeIcon(color: buttonContext.iconColor),
            onPressed: onPressed ?? () => appWindow.maximizeOrRestore());
}

class MinimizeButton extends WindowButton {
  MinimizeButton(
      {Key? key,
      EdgeInsets? padding,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate})
      : super(
            padding: padding,
            key: key,
            colors: colors,
            animate: animate ?? false,
            iconBuilder: (buttonContext) =>
                MinimizeIcon(color: buttonContext.iconColor),
            onPressed: onPressed ?? () => appWindow.minimize());
}

class CloseButton extends WindowButton {
  CloseButton(
      {Key? key,
      EdgeInsets? padding,
      WindowButtonColors? colors,
      VoidCallback? onPressed,
      bool? animate})
      : super(
            padding: padding,
            key: key,
            colors: colors,
            animate: animate ?? false,
            iconBuilder: (buttonContext) =>
                CloseIcon(color: buttonContext.iconColor),
            onPressed: onPressed ?? () => appWindow.close());
}
