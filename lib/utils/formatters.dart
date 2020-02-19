import 'package:flutter_prinder/entities/entities.dart';
import 'package:flutter_prinder/entities/user_entity.dart';

String makePresentationName(UserEntity user) {
  String name = user.name;
  if (name != '' && name.length > 0)
    return '${name[0].toUpperCase()}${name.substring(1)}, ${user.age}';
  return '';
}

String makePrinterPresentationName(PrinterEntity printer) {
  if (printer.name != '' && printer.name.length > 0)
    return '${printer.name[0].toUpperCase()}${printer.name.substring(1)}, ${printer.status}';
  return '';
}

String makeDistanceDescription(int distance) {
  if (distance < 1)
    return 'less than one kilometer from here';
  return '$distance kilometer${distance > 1 ? "s" : ""} from here';
}
