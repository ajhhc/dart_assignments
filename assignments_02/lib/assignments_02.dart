import 'dart:io';

void isVoter() {
  print("Know if you're a voter.\nPlease enter your age:");
  int age = int.parse(stdin.readLineSync()!);
  if (age >= 18) {
    print("You're a voter.");
  } else {
    print("You're not a voter.");
  }
}

void assertAge() {
  var age = 21;
  assert(age == 22, "Age must be 22.");
  print("Assert passed!");
}

void yourMother() {
  for (int i = 1; i < 11; i++) {
    print("Your mother $i.");
  }
}

void dayOfWeek() {
  String day = "0";
  while (day != "exit" && day != "EXIT") {
    print(
      "Enter a number between 1 and 7\nto get the corresponding day of the week\nor type 'exit' to stop.",
    );
    day = stdin.readLineSync()!;
    switch (day) {
      case "1":
        print("Sunday");
        break;
      case "2":
        print("Monday");
        break;
      case "3":
        print("Tuesday");
        break;
      case "4":
        print("Wednesday");
        break;
      case "5":
        print("Thursday");
        break;
      case "6":
        print("Friday");
        break;
      case "7":
        print("Saturday");
        break;
      case "exit":
        ;
      case "EXIT":
        ;
      default:
        print("Invalid");
        break;
    }
  }
}

void oddOrEven() {
  print("Check whether a number is odd or even.\nEnter a whole number:");
  int number = int.parse(stdin.readLineSync()!);
  if (number % 2 == 0) {
    print("The number $number is EVEN");
  } else {
    print("The number $number is ODD");
  }
}

void vowelOrConsonant() {
  print(
    "Is your letter a vowel or a consonant? Let's find out!\nGive me a letter:",
  );
  String letter = stdin.readLineSync()!.toUpperCase();
  int code = letter.codeUnits[0];
  if (code > 64 && code < 91) {
    switch (letter) {
      case "A":
      case "E":
      case "I":
      case "O":
      case "U":
        print("The letter $letter is a VOWEL.");
        break;
      default:
        print("The letter $letter is a CONSONANT.");
        break;
    }
  } else {
    print("I said a LETTER! Are you blind?");
  }
}

void posOrNeg() {
  print("Give me a real number:");
  double number = double.parse(stdin.readLineSync()!);
  if (number == 0) {
    print("ZERO is neither positive nor negative.");
  } else if (number > 0) {
    print("The number $number is POSITIVE.");
  } else {
    print("The number $number is NEGATIVE.");
  }
}

void printName() {
  for (int i = 1; i <= 100; i++) {
    print("$i: James  Smith");
  }
}

void naturalsSum() {
  int sum = 0;
  print("Sum of n natural numbers\nEnter n:");
  int n = int.parse(stdin.readLineSync()!);
  sum = (n * (n + 1)) ~/ 2;
  print("The total sum of the first $n natural numbers is: $sum");
}

void fiveTimesTables() {
  int result;
  for (int i = 0; i <= 10; i++) {
    result = i * 5;
    print("$i x 5 = $result");
  }
}

void timesTables() {
  int result;
  for (int j = 1; j <= 9; j++) {
    print(
      "$j"
      "x tables",
    );
    for (int i = 0; i <= 10; i++) {
      result = i * j;
      print("$i x $j = $result");
    }
    print("");
  }
}

void basicCalc() {
  int operation = 1;
  print("BASIC BINARY OPERATIONS CALCULATOR");
  while (operation != 0) {
    print(
      "Enter 1 for addition, 2 for subtraction,\n3 for multiplication, 4 for division, or 0 to exit:",
    );
    operation = int.parse(stdin.readLineSync()!);
    switch (operation) {
      case 0:
        break;
      case 1:
        print("ADDITION\nEnter first addend:");
        double addend1 = double.parse(stdin.readLineSync()!);
        print("Enter second addend:");
        double addend2 = double.parse(stdin.readLineSync()!);
        double result = addend1 + addend2;
        print("$addend1 + $addend2 = $result\n");
        break;
      case 2:
        print("SUBTRACTION\nEnter minuend:");
        double minuend = double.parse(stdin.readLineSync()!);
        print("Enter subtrahend:");
        double subtrahend = double.parse(stdin.readLineSync()!);
        double result = minuend - subtrahend;
        print("$minuend - $subtrahend = $result\n");
        break;
      case 3:
        print("MULTIPLICATION\nEnter first factor:");
        double factor1 = double.parse(stdin.readLineSync()!);
        print("Enter second factor:");
        double factor2 = double.parse(stdin.readLineSync()!);
        double result = factor1 * factor2;
        print("$factor1 x $factor2 = $result\n");
        break;
      case 4:
        print("DIVISION\nEnter dividend:");
        double dividend = double.parse(stdin.readLineSync()!);
        print("Enter divisor:");
        double divisor = double.parse(stdin.readLineSync()!);
        if (divisor == 0) {
          print("DIVISION BY ZERO IS UNDEFINED.");
        } else {
          double result = dividend / divisor;
          print("$dividend / $divisor = $result\n");
        }
        break;
      default:
        print("INVALID\n");
        break;
    }
  }
}

void printButFortyOne() {
  for (int i = 1; i <= 100; i++) {
    if (i == 41) continue;
    print(i);
  }
}
