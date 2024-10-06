import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

abstract class DateTimeFormatterHelper {
  static String tryParse({
    String dateFormat = "dd MMMM yyyy HH:mm",
    String? dateTime,
  }) {
    try {
      initializeDateFormatting();
      final dt = DateTime.tryParse(dateTime ?? "") ?? DateTime(1970);
      return DateFormat(dateFormat).format(dt);
    } catch (e) {
      return DateFormat(dateFormat).format(DateTime(1970));
    }
  }
}