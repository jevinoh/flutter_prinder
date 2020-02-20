import 'package:flutter/foundation.dart';
import 'package:flutter_prinder/entities/entities.dart';

@immutable
class Printers {
  Printers({
    this.isLoading: false,
    this.printers: const [],
  });

  factory Printers.loading() => new Printers(isLoading: true);

  final bool isLoading;
  final List<PrinterEntity> printers;

  Printers copyWith({
    bool isLoading,
    List<PrinterEntity> printers,
  }) {
    return new Printers(isLoading: isLoading ?? this.isLoading, printers: printers ?? this.printers,);
  }

  @override
  int get hashCode =>
    isLoading.hashCode ^
    printers.hashCode;

  @override
  bool operator ==(dynamic other) =>
    identical(this, other) ||
    runtimeType == other.runtimeType &&
    isLoading == other.isLoading &&
    printers == other.printers;

  @override
  String toString() =>
    'Printers {isLoading: $isLoading, printers: $printers}';
}
