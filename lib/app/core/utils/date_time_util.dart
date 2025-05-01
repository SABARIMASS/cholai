import 'package:intl/intl.dart';

class DateTimeUtil {
  static String formatDate(DateTime date, {String format = 'yyyy-MM-dd'}) {
    return DateFormat(format).format(date);
  }

  static String getTimeAgo(DateTime date) {
    final Duration difference = DateTime.now().difference(date);
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inDays} days ago';
    }
  }

  static String getRelativeTime(String dateString) {
    DateTime? date = DateTime.tryParse(dateString);
    if (date == null) return "Invalid date";

    DateTime now = DateTime.now();
    Duration diff = now.difference(date);

    if (diff.inDays == 0) {
      return "Today";
    } else if (diff.inDays == 1) {
      return "Yesterday";
    } else if (diff.inDays < 7) {
      return "${diff.inDays} days ago";
    } else if (diff.inDays < 30) {
      return "${(diff.inDays / 7).floor()} weeks ago";
    } else if (diff.inDays < 365) {
      return "${(diff.inDays / 30).floor()} months ago";
    } else {
      return "${(diff.inDays / 365).floor()} years ago";
    }
  }

  static String getChatDayDateFormatted(String formattedDate) {
    DateTime now = DateTime.now();
    DateTime inputDate = DateFormat('dd MMM yyyy').parse(formattedDate);

    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime yesterday = today.subtract(Duration(days: 1));

    if (inputDate == today) {
      return "Today";
    } else if (inputDate == yesterday) {
      return "Yesterday";
    } else {
      return formattedDate;
    }
  }
}
