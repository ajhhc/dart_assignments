import 'package:assignments_04/assignments_04.dart';
import 'dart:io';

void main(List<String> arguments) {
  int? assNumb;
  while (assNumb != 8) {
    print('List of assignments 04:');
    print('''Enter number of assignment to test it:
  1 - Create a temporary list of users
  2 - Find the area of a rectangle
  3 - Create a file
  4 - Create a list of users and save it to a file
  5 - Find the area of a rectangle using class
  6 - Calculate area, perimeter and diagonal of rectangle using class with constructor
  7 - Simple bank account log with class and export to file
  8 - Mad Libs Game
  9 - Tendency values of a list of numbers
  10 - Tendency values (with class)
  0 - EXIT''');
    try {
      assNumb = int.parse(stdin.readLineSync()!);

      switch (assNumb) {
        case 1:
          listOfUsers();
          break;
        case 2:
          rectangleArea();
          break;
        case 3:
          fileCreator();
          break;
        case 4:
          listOfUsersWithFile();
          break;
        case 5:
          rectangleClass();
          break;
        case 6:
          rectangleAreaWithConstructor();
          break;
        case 7:
          bankAccount();
          break;
        case 8:
          madLibsGame();
          break;
        case 9:
          tendency();
          break;
        case 10:
          tendencyWithClass();
          break;
        case 0:
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
