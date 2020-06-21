class HelperString {
  static String getTimeSinceUpload(String inputTime) {
    var dateUpload = DateTime.parse(inputTime);
    DateTime now = DateTime.now();
    print(now.toString());
    int minutes = now.difference(dateUpload).inMinutes;
    int hours = now.difference(dateUpload).inHours;
    int days = now.difference(dateUpload).inDays;

    double weeks = days / 7;
    double months = weeks / 4;
    double years = days / 365;

    if (years >= 1) {
      String year = " year";
      if (years >= 2) year = " years";
      return years.toInt().toString() + year;
    } else if (months >= 1) {
      String month = " month";
      if (months >= 2) month = " months";
      return months.toInt().toString() + month;
    } else if (weeks >= 1) {
      String week = " week";
      if (weeks >= 2) week = " weeks";
      return weeks.toInt().toString() + week;
    } else if (days >= 1) {
      String day = " day";
      if (days >= 2) day = " days";
      return days.toInt().toString() + day;
    } else if (hours >= 1) {
      String hour = " hour";
      if (hours >= 2) hour = " hours";
      return hours.toInt().toString() + hour;
    } else if (minutes >= 1) {
      String minute = " minute";
      if (minutes >= 2) minute = " minutes";
      return minutes.toInt().toString() + minute;
    } else {
      return "a few minutes ago";
    }
  }

  static String getViewCount(int inputView) {
    String viewString = inputView.toString();
    String value = "";
    if (viewString.length >= 10) {
      value = "B";
      viewString = compressView([11, 12], viewString);
    } else if (viewString.length >= 7) {
      value = "M";
      viewString = compressView([8, 9], viewString);
    } else if (viewString.length >= 4) {
      value = "K";
      viewString = compressView([5, 6], viewString);
    }
    return viewString + value;
  }

  static String compressView(List<int> numbers, String viewString) {
    if (viewString.length == numbers[0]) {
      viewString = viewString.substring(0, 3);
    } else if (viewString.length == numbers[1]) {
      viewString = viewString.substring(0, 2);
    } else {
      String newString = viewString.substring(0, 1);
      viewString = newString + "." + viewString.substring(1, 2);
    }
    return viewString;
  }
}
