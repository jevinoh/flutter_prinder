import 'package:redux/redux.dart';
import 'package:flutter_prinder/actions/actions.dart';
import 'package:flutter_prinder/models/models.dart';

final printersReducer = combineReducers<Printers>([
  new TypedReducer<Printers, LoadPrintersAction>(_loadPrintersReducer),
  new TypedReducer<Printers, LoadPrintersSuccessAction>(_loadPrintersSuccessReducer),
]);

Printers _loadPrintersReducer(Printers state, LoadPrintersAction action) =>
  new Printers.loading();

Printers _loadPrintersSuccessReducer(Printers state, LoadPrintersSuccessAction action) {
  return new Printers(
    isLoading: false,
    printers: action.printers,
  );
}
