import 'package:flutter/material.dart';
import 'package:flutter_todo_app/presentation/widgets/text_widget.dart';
import 'package:flutter_todo_app/values/colors.dart' as colors;

class ButtonWidget extends StatelessWidget {
  final String? label;
  final void Function() onPress;
  final bool? disabled;
  final IconData? icon;

  final double _elevation = 3;

  const ButtonWidget(
      {Key? key,
        this.label,
        required this.onPress,
        this.disabled,
        this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isDarkModeEnabled() {
      var brightness = MediaQuery.of(context).platformBrightness;
      bool darkModeOn = brightness == Brightness.dark;
      //return darkModeOn;
      return false; //dark mode is unused
    }

    final _action = disabled == true ? null : onPress;

    Color backgroundColor = disabled ?? false
        ? colors.disabledTextColor
        : (_isDarkModeEnabled() ? colors.accentColor : colors.accentColor);
    Color borderColor = disabled ?? false
        ? colors.disabledTextColor
        : (_isDarkModeEnabled() ? colors.accentColor : colors.accentColor);
    Color textColor = Colors.white;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: RaisedButton(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 45.0),
          shape: RoundedRectangleBorder(
              side: BorderSide(color: borderColor),
              borderRadius: BorderRadius.circular(20)),
          onPressed: _action,
          elevation: _elevation,
          color: backgroundColor,
          child: TextWidget(
              text: (label ?? "Label").toUpperCase(),
              small: true,
              color: textColor)),
    );
  }
}