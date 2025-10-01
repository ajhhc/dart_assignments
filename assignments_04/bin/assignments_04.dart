import 'package:assignments_04/assignments_04.dart' as assignments_04;
import 'dart:io';

void main(List<String> arguments) {
  int? assNumb;
  while (assNumb != 6) {
    print('List of assignments 03:');
    print('''Enter number of assignment to test it:
  1 - Create a temporary list of users
  2 - Find the area of a rectangle
  3 - Create a file
  4 - Create a list of users and save it to a file
  5 - Find the area of a rectangle using class
  6 - EXIT''');
    try {
      assNumb = int.parse(stdin.readLineSync()!);

      switch (assNumb) {
        case 1:
          assignments_04.listOfUsers();
          break;
        case 2:
          assignments_04.rectangleArea();
          break;
        case 3:
          assignments_04.fileCreator();
          break;
        case 4:
          assignments_04.listOfUsersWithFile();
          break;
        case 5:
          assignments_04.rectangleClass();
          break;
        case 6:
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
