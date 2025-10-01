import 'dart:io';

void varTypes() {
  int n1 = 50;
  double n2 = 50.1;
  num n3 = 51;
  num n4 = 51.1;
  double precio = 3.1415;
  var name = "James Smith";
  var age = 31;
  String john = "John";
  String doe = "Doe";

  num sum = n1 + n2 + n3 + n4;

  print(
    "n1 es igual a $n1, n2 es igual a $n2, n3 es igual a $n3, n4 es igual a $n4.\nLa suma total es igual a $sum.",
  );
  print(precio.toStringAsFixed(2));
  print(name.runtimeType);
  print(age.runtimeType);
  print("Hello, my name is $john $doe.");
  print("Hey, what's your name?");
  String? nombre = stdin.readLineSync();
  print("Cool name, $nombre.\nSo what's your age?");
  int? edad = int.parse(stdin.readLineSync()!);
  print(
    "So you're $edad years old and just starting to learn Dart, huh.\nWell, good luck, $nombre!",
  );
}

void stringsConcat() {
  const int val = 7;
  String name = "James";
  String hello1 = 'Hello, I am "John Doe"';
  String hello2 = "Hello, I am 'John Doe'";
  print(val);
  print("$hello1\n$hello2");
  print(name);
}

void simpleInterestCalc() {
  print("Simple Interest Calculator\nEnter the Principal amount:");
  int? p = int.parse(stdin.readLineSync()!);
  print("Enter the anual interest rate:");
  int? r = int.parse(stdin.readLineSync()!);
  print("How many years do you want to calculate?");
  int? t = int.parse(stdin.readLineSync()!);
  double result = (p * r * t) / 100;
  print(
    "The total interest for $t years at an interest rate of $r% is:\n$result",
  );
}

void squareNumber() {
  print("Give me a whole number:");
  int? num = int.parse(stdin.readLineSync()!);
  int sq = num * num;
  print("The square of $num is $sq.");
}

void fullName() {
  print("What is your first name?");
  String? first = stdin.readLineSync();
  print("Last name?");
  String? last = stdin.readLineSync();
  print("Your full name is $first $last.");
}

void division() {
  print("Give me an integer:");
  int? n = int.parse(stdin.readLineSync()!);
  print("Cool! Now give me another integer:");
  int? m = int.parse(stdin.readLineSync()!);
  int q = n ~/ m;
  int r = n % m;
  print("Quotient: $q\nRemainder: $r");
}

void swapValues() {
  double n = 3.6;
  double m = 6.1;
  double temp = m;
  print("Number 1: $n\nNumber 2: $m");
  m = n;
  n = temp;
  print("After swap\nNumber 1: $n\nNumber 2: $m");
}

void removeWhiteSpaces() {
  String s = "Write a program in Dart to remove all whitespaces from String.";
  String n = s.replaceAll(" ", "");
  print(s);
  print(n);
}

void varTypeAndValue() {
  String str = "4";
  print("Type of srt is ${str.runtimeType}");
  int num = int.parse(str);
  print("Value of num is $num.\nType is ${num.runtimeType}");
}

void arrivalTime() {
  int distInKm = 25;
  int distInm = distInKm * 1000;
  int velInKmPerh = 40;
  double velInmPers = velInKmPerh * 10 / 36;
  print("$distInm ${velInmPers.toStringAsFixed(2)}");
  double time = (distInm / velInmPers) / 60;
  print(time);
}

void calculateArrivalTime() {
  print("Enter distance (in km):");
  double d = double.parse(stdin.readLineSync()!);
  print("Enter velocity (in km/h):");
  double v = double.parse(stdin.readLineSync()!);
  double t = 60 * d / v;
  print('$t minutes');
}
