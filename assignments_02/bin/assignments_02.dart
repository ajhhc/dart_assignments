import 'package:assignments_02/assignments_02.dart' as assignments_02;
import 'dart:io';

void main(List<String> arguments) {
  int? assNumb;
  while (assNumb != 14) {
    print('List of assignments 02:');
    print('''Enter number of assignment to test it:
  1 - Are you a voter?
  2 - Assert age
  3 - Simple 'for' loop
  4 - Print corresponding day of the week
  5 - Check if a number is odd or even
  6 - Check if letter is a vowel or consonant
  7 - Check if a number is positive or negative
  8 - Print name 100 times
  9 - Sum of n natural numbers
  10 - Times table of 5
  11 - Times tables from 1 to 9
  12 - Basic binary calculator
  13 - Print every number except 41
  14 - EXIT''');
    try {
      assNumb = int.parse(stdin.readLineSync()!);

      switch (assNumb) {
        case 1:
          assignments_02.isVoter();
          break;
        case 2:
          assignments_02.assertAge();
          break;
        case 3:
          assignments_02.yourMother();
          break;
        case 4:
          assignments_02.dayOfWeek();
          break;
        case 5:
          assignments_02.oddOrEven();
          break;
        case 6:
          assignments_02.vowelOrConsonant();
          break;
        case 7:
          assignments_02.posOrNeg();
          break;
        case 8:
          assignments_02.printName();
          break;
        case 9:
          assignments_02.naturalsSum();
          break;
        case 10:
          assignments_02.fiveTimesTables();
          break;
        case 11:
          assignments_02.timesTables();
          break;
        case 12:
          assignments_02.basicCalc();
          break;
        case 13:
          assignments_02.printButFortyOne();
          break;
        case 14:
          print('Thanks for trying!');
          break;
        default:
          print('PLEASE SELECT A VALID OPTION');
          break;
      }
    } on AssertionError catch (e) {
      print('${e.message}');
    } catch (e) {
      print('PLEASE SELECT A VALID OPTION');
    }
  }
}
