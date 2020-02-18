import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_prinder/containers/preferences_page.dart';
import 'package:flutter_prinder/containers/search_page.dart';
import 'package:flutter_prinder/containers/chat_page.dart';
import 'package:flutter_prinder/models/models.dart';
import 'package:flutter_prinder/presentation/paged_screen.dart';
import 'package:flutter_prinder/selectors/selectors.dart';

class MainPage extends StatelessWidget {
  MainPage({Key key, this.title, this.store}) : super(key: key);

  final String title;
  final Store<AppState> store;
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ViewModel>(
      converter: ViewModel.fromStore,
      builder: (context, vm) {
        return new PagedScreen(
          controller: vm.controller,
          indicators: [
            Icons.settings,
            Icons.print,
          ],
          pages: <Widget>[
            new MyHomePage(title: 'Printer Preferences'),
            new SearchPage(store: store),
          ],
        );
      },
    );
  }
}

class ViewModel {
  ViewModel(int initialPage)
    : controller = new PageController(initialPage: initialPage);

  // TODO: create initialPage state for future necessity of the
  // store change/store the currentPage
  static ViewModel fromStore(Store<AppState> store) =>
    new ViewModel(mainInitialPageSelector(store));

  final PageController controller;
}
