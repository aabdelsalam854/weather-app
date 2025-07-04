import 'package:intl/intl.dart';

String parseDate(String date) =>
    DateFormat('yyyy-MM-dd').format(DateTime.parse(date));

String parseDateTime(String date) =>
    DateFormat('yyyy-MM-dd').add_jm().format(DateTime.parse(date));

String parseTime(String date) =>
    DateFormat('hh:mm a').format(DateTime.parse(date));
