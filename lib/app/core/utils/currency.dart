import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:intl/intl.dart';

extension CurrencyHelper on int {
  String convertToCurrencyWithoutSymbol() {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '',
      decimalDigits: 0,
    ).format(this);
  }

  String convertToCurrencyWithSymbol(String symbol) {
    return NumberFormat.currency(
      locale: 'en_US',
      symbol: '$symbol ',
      decimalDigits: 0,
    ).format(this);
  }

  static CurrencyTextInputFormatter withoutSymbolFormat() {
    return CurrencyTextInputFormatter(
      decimalDigits: 0,
      locale: 'en_US',
      symbol: '',
    );
  }
}

extension CurrencyParseHelper on String {
  int? toIntWithoutSymbol() {
    if (this == '') return null;
    return NumberFormat.currency(
      decimalDigits: 0,
      locale: 'en_US',
      symbol: '',
    ).parse(this).toInt();
  }

  String addComma() {
    return replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => "${m[1]},",
    );
  }

  String removeComma() {
    return replaceAll(r',', '');
  }
}
