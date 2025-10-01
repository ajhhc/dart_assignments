import 'dart:io';
import 'dart:math';

void cubeOfN(double input) {
  double cube = input * input * input;
  print("The cube of $input is equal to $cube");
}

void mPowerOfN() {
  num x = 0;
  num exp = 0;
  bool validInput = false;
  print("Raise a number to any power");
  do {
    try {
      print("Enter base:");
      x = num.parse(stdin.readLineSync()!);
      validInput = true;
    } catch (error) {
      print("Invalid input.");
    }
  } while (!validInput);
  do {
    try {
      print("Enter exponent:");
      exp = num.parse(stdin.readLineSync()!);
      validInput = true;
    } catch (error) {
      print("Invalid input.");
      validInput = false;
    }
  } while (!validInput);
  num result = powerCalc(x, exp);
  print("Result: ${result.toStringAsFixed(4)}");
}

num powerCalc(num base, num exponent) {
  num result = pow(base, exponent);
  return result;
}

void firstLastName() {
  print("First name?");
  String first = stdin.readLineSync()!;
  print("Last name?");
  String last = stdin.readLineSync()!;
  String hi = fullName(first, last);
  print("Hi $hi!");
}

String fullName(String firstName, String lastName) {
  return "$firstName $lastName";
}

void evensInInterval() {
  print("Start of the interval:");
  int start = int.parse(stdin.readLineSync()!);
  print("End of interval:");
  int end = int.parse(stdin.readLineSync()!);
  printEvenNumbers(start, end);
}

void printEvenNumbers(int start, int end) {
  for (int i = start; i <= end; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}

void randomPassword() {
  String uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  String lowercase = uppercase.toLowerCase();
  String numbers = "1234567890";
  String symbols = "!\"#\$&'()*+,-./:;<=>?@[\\]^_`{|}~";
  int length = 0;
  String? upperOrLower;
  String? inclNum;
  String? inclSymb;
  String charSet;
  bool validLength = false;
  print("GENERATE A RANDOM PASSWORD");
  do {
    try {
      print("Enter length:");
      length = int.parse(stdin.readLineSync()!);
      if (length <= 0) {
        print("INVALID OPTION");
      } else {
        validLength = true;
      }
    } catch (error) {
      print("INVALID OPTION");
    }
  } while (!validLength || length <= 0);
  do {
    print(
      "Press 1 for only uppercase, 2 for only lowercase, or 3 for a mix of both:",
    );
    upperOrLower = stdin.readLineSync()!;
    if (upperOrLower != "1" && upperOrLower != "2" && upperOrLower != "3") {
      print("INVALID OPTION");
    }
  } while (upperOrLower != "1" && upperOrLower != "2" && upperOrLower != "3");
  do {
    print("Include numbers? y/n");
    inclNum = stdin.readLineSync()!.toLowerCase();
    if (inclNum != "y" && inclNum != "n") {
      print("INVALID OPTION");
    }
  } while (inclNum != "y" && inclNum != "n");
  do {
    print("Include symbols? y/n");
    inclSymb = stdin.readLineSync()!.toLowerCase();
    if (inclSymb != "y" && inclSymb != "n") {
      print("INVALID OPTION");
    }
  } while (inclSymb != "y" && inclSymb != "n");
  if (upperOrLower == "1") {
    charSet = uppercase;
  } else if (upperOrLower == "2") {
    charSet = lowercase;
  } else {
    charSet = lowercase + uppercase;
  }
  if (inclNum == "y") {
    charSet += numbers;
  }
  if (inclSymb == "y") {
    charSet += symbols;
  }
  String password = generatePassword(length, charSet);
  print("\nYour password of ${password.length} characters:\n\n$password\n");
}

String generatePassword(int length, String charSet) {
  var rand = Random();
  StringBuffer password = StringBuffer();
  for (int i = 0; i < length; i++) {
    password.write(charSet[rand.nextInt(charSet.length)]);
  }
  return password.toString();
}

void areaOfCircle() {
  double radius;
  bool validInput = false;
  do {
    try {
      print("Enter radius value:");
      radius = double.parse(stdin.readLineSync()!);
      if (radius < 0) {
        print("Please enter a valid number.");
        validInput = false;
      } else {
        validInput = true;
      }
      print(circleArea(radius).toStringAsFixed(2));
    } catch (error) {
      print("Please enter a valid number.");
    }
  } while (!validInput);
}

double circleArea(double radius) {
  double area = pi * radius * radius;
  return area;
}

void stringReverse() {
  String strNorm = "";
  while (strNorm.isEmpty) {
    print("Enter string to reverse:");
    strNorm = stdin.readLineSync()!;
  }
  print("Your string reversed:\n${reverseString(strNorm)}");
}

String reverseString(String stringNormal) {
  String stringBackwards = stringNormal.split('').reversed.join();
  return stringBackwards;
}

num add(num addend1, num addend2) {
  num result = addend1 + addend2;
  return result;
}

void basicAddition() {
  num num1 = 0;
  num num2 = 0;
  bool validNumber = false;
  do {
    try {
      print("Enter first number:");
      num1 = num.parse(stdin.readLineSync()!);
      validNumber = true;
    } catch (error) {
      print("Please enter a number:");
    }
  } while (!validNumber);
  do {
    try {
      print("Enter second number:");
      num2 = num.parse(stdin.readLineSync()!);
    } catch (error) {
      print(
        "Do you even know what a number is?\nPlease, PLEASE, enter a number:",
      );
      validNumber = false;
    }
  } while (!validNumber);
  print(
    "${num1 < 0 ? "($num1)" : num1} + ${num2 < 0 ? "($num2)" : num2} = ${add(num1, num2)}",
  );
}

num maxNumber(List<num> numbers) {
  num max = numbers.first;
  for (var num in numbers) {
    if (num > max) max = num;
  }
  return max;
}

void highestOf3() {
  List<num> numbersList = <num>[];
  print("Add first number:");
  num num1 = num.parse(stdin.readLineSync()!);
  numbersList.add(num1);
  print("Add second number:");
  num num2 = num.parse(stdin.readLineSync()!);
  numbersList.add(num2);
  print("Add third number:");
  num num3 = num.parse(stdin.readLineSync()!);
  numbersList.add(num3);
  print(
    "The highest number amongst ${numbersList[0]}, ${numbersList[1]} and ${numbersList[2]} is: ${maxNumber(numbersList)}",
  );
}

bool isEven(num number) {
  return number % 2 == 0;
}

void isYourNumberEven() {
  try {
    print("Give me a number:");
    num input = num.parse(stdin.readLineSync()!);
    if (isEven(input)) {
      print("$input is even.");
    } else {
      print("$input is odd.");
    }
  } catch (error) {
    print("Not a number, goodbye.");
  }
}
