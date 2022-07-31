import 'package:intl/intl.dart';

class DateHelper {
  static formatDate(DateTime dateTime, [String format = 'yyyy-MM-dd']) {
    return DateFormat(format).format(dateTime);
  }

  static formatDateStringToDateTime(String? dateTimeString,
      [String format = 'yyyy-MM-dd']) {
    if (dateTimeString == null) return DateTime.parse('1990-01-01');
    return DateTime.parse(dateTimeString);
  }
}
