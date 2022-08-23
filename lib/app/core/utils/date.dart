import 'package:intl/intl.dart';

class DateHelper {
  static formatDate(DateTime dateTime, [String format = 'yyyy-MM-dd']) {
    return DateFormat(format).format(dateTime);
  }

  static formatDateYearOnly(DateTime dateTime, [String format = 'yyyy']) {
    return DateFormat(format).format(dateTime);
  }

  static formatDateStringToDateTime(String? dateTimeString) {
    if (dateTimeString == null) return DateTime.parse('1990-01-01');
    return DateTime.parse(dateTimeString);
  }

  static formatDateStringToDateTimeYearOnly(String? year) {
    if (year == null) return DateTime.parse('1990-01-01');
    return DateTime.parse('$year-01-01');
  }

  static getNextDateFromString(String? dateTimeString, [int addDays = 0]) {
    var inputFormat = DateFormat('dd MMMM yyyy');
    var dateTime = dateTimeString == null
        ? DateTime.parse('1990-01-01')
        : inputFormat.parse(dateTimeString);
    var newDate = dateTime.add(new Duration(days: addDays));
    return DateFormat('dd MMMM yyyy').format(newDate);
  }
}
