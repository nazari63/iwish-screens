import 'package:intl/intl.dart';

class DateUtils {
  DateUtils._();

  static formatDate(value) {
    final df = DateFormat('dd-MM-yyyy');
    return df.format(DateTime.parse(value));
  }

  static formatDateTime(value) {
    final df = DateFormat('d MMMM, y hh:mm a');
    return df.format(DateTime.parse(value));
  }
}
