import 'package:flutter_prinder/models/models.dart';
import 'loading_reducer.dart';
import 'matchs_reducer.dart';
import 'user_reducer.dart';
import 'strangers_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: loadingReducer(state.isLoading, action),
    mainInitialPage: 1,
//    user: userReducer(state.user, action),
//    matchs: matchsReducer(state.matchs, action),
    strangers: strangersReducer(state.strangers, action),
  );
}
