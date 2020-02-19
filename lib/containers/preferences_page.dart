import 'package:flutter_prinder/entities/entities.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';
import 'package:dynamic_theme/dynamic_theme.dart'; // Just for theme example
import 'package:validators/validators.dart';
import 'package:flutter_prinder/observers/search_observer.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/actions/actions.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.store}) : super(key: key);

  final String title;
  final Store<AppState> store;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String paperSize = "A4";
  String color = "No";
  String mfp = "No";

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
          onChange: (selected) => setState(() {paperSize = selected;}),
        ),
        DropdownPreference(
          'Color Support',
          'color_support',
          defaultVal: 'No',
          values: ['Yes', 'No'],
          onChange: (selected) => setState(() {color = selected;}),
        ),
        DropdownPreference(
          'Scanner Support',
          'scanner_support',
          defaultVal: 'No',
          values: ['Yes', 'No'],
          onChange: (selected) => setState(() {mfp = selected;}),
        ),
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          searchOnPreferences();
        },
        label: Text('Search'),
        icon: Icon(Icons.search),
        backgroundColor: Colors.pinkAccent,
      ),
      floatingActionButtonLocation : FloatingActionButtonLocation.centerFloat,
    );
  }

  void searchOnPreferences() {
    print('notifying search page widget..');

    try {

      List<PreferenceEntity> _preference = [];

      _preference.add( new PreferenceEntity(
          paperSize: paperSize,
          color: color,
          mfp: mfp,
          location: "Empty") );

      print(_preference.toString());

      widget.store.dispatch(new LoadPreferencesSuccessAction(_preference));

    } catch (error) {
      widget.store.dispatch(new LoadPreferencesFailAction(error.message));
    }


    SearchObserverProvider _searchObserver = SearchObserverProvider();
    _searchObserver.notify(ObserverState.REBUILD);
  }
}

