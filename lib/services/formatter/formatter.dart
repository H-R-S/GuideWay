import 'package:intl/intl.dart';

class Formatter {

  static String dateTimeformatter(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDateTime =
        DateFormat('yyyy-MM-dd | hh:mm').format(dateTime);
    return formattedDateTime;
  }
}
