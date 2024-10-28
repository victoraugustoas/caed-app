import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String format(DateFormat formatter) {
    return formatter.format(this);
  }
}
