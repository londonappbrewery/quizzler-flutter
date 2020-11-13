import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

Icon iconsBuilder(icon, color) => Icon(
      icon,
      color: color,
    );

ToggleSwitch toggleBuilder() {
  return ToggleSwitch(
    initialLabelIndex: 1,
    labels: ['Español', 'English'],
    onToggle: (int i) {
      print('switched to $i');
    },
    // TODO: put this on main and implement the change language
  );
}
