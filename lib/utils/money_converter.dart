import 'package:intl/intl.dart';

String formatMoney(int value) {
  final format = NumberFormat('#,##0', 'en_US');
  return format.format(value);
}
