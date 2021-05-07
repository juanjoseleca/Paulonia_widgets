import 'package:paulonia_widgets/enums.dart';

class PauloniaDateTimeUtils {
  ///* This function is only created to lead with past dates
  static String dateTimeToString({
    DateTime currentDateTime,
    DateTime pivotDateTime,
  }) {
    int difference = currentDateTime.difference(pivotDateTime).inDays;

    assert(difference >= 0);
    if (difference == 0) return 'Hoy';
    if (difference == 1) return 'Ayer';
    if (difference >= 2 && difference < 7) return 'Hace unos dias';
    if (difference >= 7 && difference < 14) return 'Hace una semana';
    if (difference >= 14 && difference < 30) return 'Hace semanas';
    if (difference >= 30 && difference < 60) return 'Hace 1 mes';
    if (difference >= 60 && difference < 365)
      return 'Hace ${(difference / 30).round()} meses';
    if (difference >= 365 && difference < (365 * 2))
      return 'Hace ${(difference / 365).round()} año';
    if (difference >= (365 * 2))
      return 'Hace ${(difference / 365).round()} años';
    return 'error';
  }

  ///This function return day and Month in spanish and you can
  ///set delimiter to the month with [monthLetters] and include the
  ///year with [includeYear]
  static String getDayMonthString(DateTime dateTime,
      {int monthLetters, bool includeYear = false}) {
    String month = getStringMonth(dateTime);
    String year = includeYear ? ' del ${dateTime.year}' : '';
    int subStringLenght = monthLetters ?? month.length;
    return '${dateTime.day} de ${month.substring(0, subStringLenght > month.length ? month.length : subStringLenght)}$year';
  }

  static String getStringMonth(DateTime dateTime) {
    switch (dateTime.month) {
      case 1:
        return 'Enero';
      case 2:
        return 'Febrero';
      case 3:
        return 'Marzo';
      case 4:
        return 'Abril';
      case 5:
        return 'Mayo';
      case 6:
        return 'Junio';
      case 7:
        return 'Julio';
      case 8:
        return 'Agosto';
      case 9:
        return 'Septiembre';
      case 10:
        return 'Octubre';
      case 11:
        return 'Noviembre';
      case 12:
        return 'Diciembre';
        break;
      default:
        return 'ERROR_MES';
    }
  }
}
