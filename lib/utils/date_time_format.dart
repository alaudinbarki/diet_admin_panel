import 'package:intl/intl.dart';

String formatDate(DateTime dateString) {
  // DateFormat inputFormat = DateFormat("dd-MMM-yy HH:mm");
  DateFormat outputFormat = DateFormat("dd-MMM-yyyy  HH:mm");
  return outputFormat.format(dateString.toLocal());
}
