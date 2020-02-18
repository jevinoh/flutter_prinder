import 'package:flutter_prinder/models/models.dart';
import 'loading_reducer.dart';
import 'strangers_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: loadingReducer(state.isLoading, action),
    mainInitialPage: 1,
    strangers: strangersReducer(state.strangers, action),
  );
}
