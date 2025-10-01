import 'package:assignments_03/assignments_03.dart' as assignments_03;
import 'dart:io';

void main(List<String> arguments) {
  int? assNumb;
  while (assNumb != 11) {
    print('List of assignments 03:');
    print('''Enter number of assignment to test it:
  1 - Find the cube of a given number
  2 - Raise a base to an exponent
  3 - Greetings [your name]!
  4 - Print even numbers in a given interval
  5 - Random password generator
  6 - Find the area of a circle
  7 - Reverse a string
  8 - Add two numbers (YEAH!)
  9 - Find the highest amongst three numbers
  10 - Check whether your number is even
  11 - EXIT''');
    try {
      assNumb = int.parse(stdin.readLineSync()!);

      switch (assNumb) {
        case 1:
          print('Enter number:');
          double input = double.parse(stdin.readLineSync()!);
          assignments_03.cubeOfN(input);
          break;
        case 2:
          assignments_03.mPowerOfN();
          break;
        case 3:
          assignments_03.firstLastName();
          break;
        case 4:
          assignments_03.evensInInterval();
          break;
        case 5:
          assignments_03.randomPassword();
          break;
        case 6:
          assignments_03.areaOfCircle();
          break;
        case 7:
          assignments_03.stringReverse();
          break;
        case 8:
          assignments_03.basicAddition();
          break;
        case 9:
          assignments_03.highestOf3();
          break;
        case 10:
          assignments_03.isYourNumberEven();
          break;
        case 11:
          print('Thanks for trying!');
          break;
        default:
          print('PLEASE SELECT A VALID OPTION');
          break;
      }
    } catch (e) {
      print('PLEASE SELECT A VALID OPTION');
    }
  }
}
