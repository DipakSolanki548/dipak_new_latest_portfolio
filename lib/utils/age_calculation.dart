
import 'package:age_calculator/age_calculator.dart';

String currentAge = '';
getAge(){
  DateTime birthday = DateTime(1996, 3, 20);

  DateDuration duration;

  // Find out your age as of today's date 2021-03-08
  duration = AgeCalculator.age(birthday);
  // print('Your age is ${duration.years}'); // Your age is Years: 24, Months: 0, Days: 3
  currentAge = duration.years.toString();
}