import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart'; // Just for theme example
import 'package:validators/validators.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PreferencePage([
        DropdownPreference(
          'Paper Size',
          'paper_size',
          defaultVal: 'A4',
          values: ['A4', 'A3'],
        ),
        DropdownPreference(
          'Color Support',
          'color_support',
          defaultVal: 'No',
          values: ['Yes', 'No'],
        ),
        DropdownPreference(
          'Scanner Support',
          'scanner_support',
          defaultVal: 'No',
          values: ['Yes', 'No'],
        ),
      ]),
    );
  }
}

