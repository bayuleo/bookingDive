import 'package:intl/intl.dart';

class TimeHelper {
  static formatDate(DateTime dateTime,
      [String format = 'dd MMM yyyy hh:mm:ss']) {
    return DateFormat(format).format(dateTime);
  }

  static formatDateTimeString(String? dateTimeString,
      [String format = 'dd MMM yyyy hh:mm:ss']) {
    if (dateTimeString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateTimeString);
      return DateFormat(format).format(date);
    } catch (_) {
      return dateTimeString;
    }
  }

  static formatDateString(String? dateTimeString,
      [String format = 'dd MMM yyyy']) {
    if (dateTimeString == null) return 'N/A';
    try {
      final date = DateTime.parse(dateTimeString);
      return DateFormat(format).format(date);
    } catch (_) {
      return dateTimeString;
    }
  }
}
