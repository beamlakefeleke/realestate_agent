import 'package:intl/intl.dart';

class AppUtils {
  static String formatCurrency(double amount) {
    final format = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return format.format(amount);
  }

  static String formatDate(DateTime date) {
    final format = DateFormat.yMMMMd();
    return format.format(date);
  }

  static String formatDateTime(DateTime dateTime) {
    final format = DateFormat.yMMMMd('en_US').add_jm();
    return format.format(dateTime);
  }

  static String truncateString(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    }
    return text.substring(0, maxLength) + '...';
  }
  
    static String getPropertyStatusString(String status) {
    switch (status.toLowerCase()) {
      case 'available':
        return 'Available';
      case 'sold':
        return 'Sold';
      default:
        return 'Unknown';
    }
  }
}