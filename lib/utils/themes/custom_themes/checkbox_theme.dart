import 'package:flutter/material.dart';

class CustomCheckboxTheme {
  CustomCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else {
        return Colors.black;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      } else {
        return Colors.transparent;
      }
    })
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
    checkColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)) {
        return Colors.black;
      } else {
        return Colors.white;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states){
      if (states.contains(WidgetState.selected)) {
        return Colors.blue;
      } else {
        return Colors.transparent;
      }
    })
  );
}