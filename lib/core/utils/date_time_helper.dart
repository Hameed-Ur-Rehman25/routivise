import 'package:intl/intl.dart';

class DateTimeHelper {
  // Format a DateTime to display as "1st Sept 2026, Thursday, 8:00 am"
  static String formatFullDateTime(DateTime dateTime) {
    final String dayOfWeek = _getDayOfWeek(dateTime.weekday);
    final String dayWithSuffix = _getDayWithSuffix(dateTime.day);
    final String month = _getMonthName(dateTime.month);
    final String timeString = DateFormat('h:mm a').format(dateTime);
    
    return '$dayWithSuffix $month ${dateTime.year}, $dayOfWeek, $timeString';
  }
  
  // Format a time range like "11:05 am-11:30 pm"
  static String formatTimeRange(DateTime start, DateTime end) {
    final String startTime = DateFormat('h:mm a').format(start);
    final String endTime = DateFormat('h:mm a').format(end);
    
    return '$startTime-$endTime';
  }
  
  // Get day of week name
  static String _getDayOfWeek(int weekday) {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[weekday - 1];
  }
  
  // Get month name
  static String _getMonthName(int month) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
  
  // Add appropriate suffix to day number (1st, 2nd, 3rd, 4th, etc.)
  static String _getDayWithSuffix(int day) {
    if (day >= 11 && day <= 13) {
      return '${day}th';
    }
    
    switch (day % 10) {
      case 1: return '${day}st';
      case 2: return '${day}nd';
      case 3: return '${day}rd';
      default: return '${day}th';
    }
  }
  
  // Get current time as formatted string
  static String getCurrentTime() {
    return formatFullDateTime(DateTime.now());
  }
}
