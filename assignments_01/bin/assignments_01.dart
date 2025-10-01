import 'package:assignments_01/assignments_01.dart' as assignments_01;
import 'dart:io';

void main(List<String> arguments) {
  int? assNumb;
  while (assNumb != 12) {
    print('List of assignments 01:');
    print('''Enter number of assignment to test it:
  1 - Variable types
  2 - Strings concatenation
  3 - Simple interest calculator
  4 - Find the square of a number
  5 - Print full name
  6 - Integer division
  7 - Swap two numbers
  8 - Remove white spaces
  9 - Print variable type and value
  10 - Print arrival time with set values
  11 - Calculate arrival time
  12 - EXIT''');
    try {
      assNumb = int.parse(stdin.readLineSync()!);

      switch (assNumb) {
        case 1:
          assignments_01.varTypes();
          break;
        case 2:
          assignments_01.stringsConcat();
        case 3:
          assignments_01.simpleInterestCalc();
        case 4:
          assignments_01.squareNumber();
        case 5:
          assignments_01.fullName();
        case 6:
          assignments_01.division();
        case 7:
          assignments_01.swapValues();
        case 8:
          assignments_01.removeWhiteSpaces();
        case 9:
          assignments_01.varTypeAndValue();
        case 10:
          assignments_01.arrivalTime();
        case 11:
          assignments_01.calculateArrivalTime();
        case 12:
          print('Thanks for trying!');
          break;
        default:
          print('PLEASE SELECT A VALID OPTION');
      }
    } catch (e) {
      print('PLEASE SELECT A VALID OPTION');
    }
  }
}
