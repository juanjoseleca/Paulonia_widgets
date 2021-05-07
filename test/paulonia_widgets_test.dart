import 'package:flutter_test/flutter_test.dart';
import 'package:paulonia_widgets/utils/functions/date_time_utils.dart';

void main() {
  group('PauloniaDateTimeUtils test', () {
    test('Today test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 4, 25));
      expect(result, 'Hoy');
    });
    test('Yesterday test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 4, 24));
      expect(result, 'Ayer');
    });
    test('Days ago test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 4, 21));
      expect(result, 'Hace unos dias');
    });
    test('1 week ago test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 4, 18));
      expect(result, 'Hace una semana');
    });

    test('weeks ago test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 4, 11));
      expect(result, 'Hace semanas');
    });
    test('1 month ago test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 3, 25));
      expect(result, 'Hace 1 mes');
    });
    test('months ago test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2021, 1, 24));
      expect(result, 'Hace 3 meses');
    });
    test('1 year ago test', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2020, 4, 25));
      expect(result, 'Hace 1 año');
    });
    test('years ago', () {
      final result = PauloniaDateTimeUtils.dateTimeToString(
          currentDateTime: DateTime(2021, 4, 25),
          pivotDateTime: DateTime(2019, 4, 24));
      expect(result, 'Hace 2 años');
    });

    test('dayMonth test', () {
      final result =
          PauloniaDateTimeUtils.getDayMonthString(DateTime(2020, 4, 25));
      expect(result, '25 de Abril');
    });
    test('dayMonth with monthDelimiter test', () {
      final result = PauloniaDateTimeUtils.getDayMonthString(
          DateTime(2020, 5, 25),
          monthLetters: 3);
      expect(result, '25 de May');
    });
    test('dayMonth with monthDelimiter and year test', () {
      final result = PauloniaDateTimeUtils.getDayMonthString(
          DateTime(2020, 5, 25),
          monthLetters: 10,
          includeYear: true);
      expect(result, '25 de Mayo del 2020');
    });
  });
}
