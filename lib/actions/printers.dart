import 'package:flutter_prinder/entities/entities.dart';

class LoadPrintersAction {}

class LoadPrintersSuccessAction {
  final List<PrinterEntity> printers;

  LoadPrintersSuccessAction(this.printers);

  @override
  String toString() =>
    'LoadPrintersSuccessAction{strangers: $printers}';
}

class LoadPrintersFailAction {
  final String message;

  LoadPrintersFailAction(this.message);

  @override
  String toString() =>
    'LoadPrintersFailAction{message: $message}';
}
