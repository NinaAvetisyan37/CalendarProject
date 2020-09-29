class Calendar {
  DateTime _dateTime;
  int _beginMissedDays;
  DateTime get dateTime => _dateTime;
  int get beginMissedDays => _beginMissedDays;

  Calendar(this._dateTime, [this._beginMissedDays]);

  void setMonthMissedDays() {
    _beginMissedDays = DateTime(_dateTime.year, _dateTime.month, 1).weekday;
    if (_beginMissedDays == 7) {
      _beginMissedDays = 0;
    }
  }

  void goToToday() {
    //print("trying to go to the month of today");
    _dateTime = DateTime.now();
    setMonthMissedDays();
  }

  void previousMonthSelected() {
    if (_dateTime.month == DateTime.january)
      _dateTime = new DateTime(_dateTime.year - 1, DateTime.december);
    else
      _dateTime = new DateTime(_dateTime.year, _dateTime.month - 1);

    setMonthMissedDays();
  }

  void nextMonthSelected() {
    {
      if (_dateTime.month == DateTime.december)
        _dateTime = new DateTime(_dateTime.year + 1, DateTime.january);
      else
        _dateTime = new DateTime(_dateTime.year, _dateTime.month + 1);

      setMonthMissedDays();
    }
  }

  int getNumberOfDaysInMonth(final int month) {
    int numDays = 28;

    switch (month) {
      case 1:
        numDays = 31;
        break;
      case 2:
        numDays = 28;
        break;
      case 3:
        numDays = 31;
        break;
      case 4:
        numDays = 30;
        break;
      case 5:
        numDays = 31;
        break;
      case 6:
        numDays = 30;
        break;
      case 7:
        numDays = 31;
        break;
      case 8:
        numDays = 31;
        break;
      case 9:
        numDays = 30;
        break;
      case 10:
        numDays = 31;
        break;
      case 11:
        numDays = 30;
        break;
      case 12:
        numDays = 31;
        break;
      default:
        numDays = 28;
    }
    return numDays + _beginMissedDays;
  }

  String getMonthName(final int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Unknown";
    }
  }
}
