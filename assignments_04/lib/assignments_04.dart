import 'dart:io';
import 'dart:convert';
import 'dart:math';

// Create a temporary list of users

List<dynamic> createUser() {
  String? name;
  int age = -1;
  bool isActive = true;
  print("Enter User Name:");
  do {
    try {
      name = stdin.readLineSync()!;
      if (name.isEmpty) {
        print("Please enter a valid User Name:");
        continue;
      }
      break;
    } catch (e) {
      print("Please enter a valid User Name:");
    }
  } while (true);
  while (true) {
    try {
      print("Enter User Age:");
      int tempAge = int.parse(stdin.readLineSync()!);
      if (tempAge > 0) {
        age = tempAge;
        break;
      }
      print("Age must be positive.");
    } catch (e) {
      print("Please enter a valid User Age:");
    }
  }
  return [name, age, isActive];
}

void printUser(List user) {
  print("""
Name: ${user[0]}
Age: ${user[1]}
Is Active: ${user[2]}""");
}

void listOfUsers() {
  List<List<dynamic>> userData = [];
  String? state;
  print("LIST OF USERS");
  while (state != "4") {
    print(
      "Select option\n1 - Add new user\n2 - Remove user\n3 - Show list of registered users\n4 - Exit",
    );
    state = stdin.readLineSync()!.toLowerCase();
    switch (state) {
      case "1":
        userData.add(createUser());
        break;
      case "2":
        if (userData.isNotEmpty) {
          try {
            print("Enter number of user to remove:");
            int userIndexNumber = int.parse(stdin.readLineSync()!);
            if (userIndexNumber > userData.length || userIndexNumber <= 0) {
              print("USER DOES NOT EXIST");
            } else {
              userData.removeAt(userIndexNumber - 1);
            }
          } catch (e) {
            print("Try again");
          }
        } else {
          print("NO USERS ADDED YET");
        }
        break;
      case "3":
        if (userData.isEmpty) {
          print("NO USERS ADDED YET");
          break;
        }
        for (int i = 0; i < userData.length; i++) {
          print("*******************************");
          print("USER ${i + 1}:");
          printUser(userData[i]);
        }
        print("*******************************");
        break;
      case "4":
        break;
      default:
        print("INVALID OPTION");
        break;
    }
  }
}

// Find the area of a rectangle

num calcArea({num length = 1, num width = 1}) {
  return length * width;
}

void rectangleArea() {
  num lengthOrWidth = 0;
  num widthOrLength = 0;
  print("""
Find the area of a rectangle. Pretty simple stuff, eh?
Just give me the length first and width second...
Or the other way around, it doesn't really matter.
Oh, and remember to use the same units for both!""");
  do {
    try {
      lengthOrWidth = num.parse(stdin.readLineSync()!);
      if (lengthOrWidth <= 0) {
        print("Check your input and try again.");
      }
    } catch (e) {
      print("You know that doesn't work!");
    }
  } while (lengthOrWidth <= 0);
  do {
    try {
      widthOrLength = num.parse(stdin.readLineSync()!);
      if (widthOrLength <= 0) {
        print("Impossible!");
      }
    } catch (e) {
      print("Quit fooling around and give me a number!");
    }
  } while (widthOrLength <= 0);
  print("""
The area of a rectangle of length (or width) of
$lengthOrWidth and width (or length) of $widthOrLength is equal to:
${calcArea(length: lengthOrWidth, width: widthOrLength)}.
""");
}

// Create a file

void createFile(String fileName) {
  File newFile = File('$fileName.txt');
  newFile.writeAsStringSync('');
  bool exists = newFile.existsSync();
  if (exists) {
    print('New file succesfully created at ${newFile.absolute.path}');
  } else {
    print('Failed to create file at ${newFile.absolute.path}');
  }
}

void fileCreator() {
  String state = '';
  while (state != 'n') {
    print('Create new file? y/n');
    state = stdin.readLineSync()!.toLowerCase();
    switch (state) {
      case "y":
        print('Enter file name');
        String newFileName = stdin.readLineSync()!;
        if (newFileName.isEmpty) {
          print('Invalid file name');
        } else {
          createFile(newFileName);
        }
        break;
      case 'n':
        print('K bye.');
        break;
      default:
        print('Incorrect option');
    }
  }
}

// Create a list of users and save it to a file

File usersList = File('users.txt');

void createUserWithFile() {
  String? name;
  int age = -1;
  bool isActive = true;
  print("Enter User Name:");
  do {
    try {
      name = stdin.readLineSync()!;
      if (name.isEmpty) {
        print("Please enter a valid User Name:");
        continue;
      }
      break;
    } catch (e) {
      print("Please enter a valid User Name:");
    }
  } while (true);
  while (true) {
    try {
      print("Enter User Age:");
      int tempAge = int.parse(stdin.readLineSync()!);
      if (tempAge > 0) {
        age = tempAge;
        break;
      }
      print("Age must be positive.");
    } catch (e) {
      print("Please enter a valid User Age:");
    }
  }
  String encodedUser = '${json.encode([name, age, isActive])}\n';
  usersList.writeAsStringSync(encodedUser, mode: FileMode.append);
}

void printUserWithFile(List user) {
  print("""
Name: ${user[0]}
Age: ${user[1]}
Is Active: ${user[2]}""");
}

void mainMenu(String state) {
  switch (state) {
    case "1":
      createUserWithFile();
      print('USER ADDED TO FILE');
      break;
    case "2":
      try {
        if (!usersList.existsSync() || usersList.readAsLinesSync().isEmpty) {
          print("NO USERS ADDED YET");
          return;
        }
        List<String> lines = usersList.readAsLinesSync();
        List<List<dynamic>> tempUsers = [];
        for (String line in lines) {
          if (line.trim().isEmpty) continue;
          try {
            List<dynamic> user = json.decode(line.trim()) as List<dynamic>;
            tempUsers.add(user);
          } catch (e) {
            /* Skip bad */
          }
        }
        print("Enter number of user to remove:");
        int userIndexNumber = int.parse(stdin.readLineSync()!);
        if (userIndexNumber > tempUsers.length || userIndexNumber <= 0) {
          print("USER DOES NOT EXIST");
        } else {
          tempUsers.removeAt(userIndexNumber - 1);
          // Rewrite file
          usersList.writeAsStringSync('', mode: FileMode.write);
          for (List<dynamic> user in tempUsers) {
            usersList.writeAsStringSync(
              '${json.encode(user)}\n',
              mode: FileMode.append,
            );
          }
          print("User removed from file!");
        }
      } catch (e) {
        print("Try again!");
      }
      break;
    case "3":
      try {
        if (!usersList.existsSync() || usersList.readAsLinesSync().isEmpty) {
          print("NO USERS ADDED YET");
          break;
        }
        List<String> lines = usersList.readAsLinesSync();
        for (int i = 0; i < lines.length; i++) {
          String line = lines[i].trim();
          if (line.isEmpty) continue;
          try {
            List<dynamic> user = json.decode(line) as List<dynamic>;
            print("*******************************");
            print("USER ${i + 1}:");
            printUserWithFile(user);
          } catch (e) {
            /* Skip bad */
          }
        }
        print("*******************************");
      } catch (e) {
        print("View error: $e");
      }
      break;
    case "4":
      break;
    default:
      print("INVALID OPTION");
      break;
  }
}

void listOfUsersWithFile() {
  String? state;
  print("LIST OF USERS");
  while (state != "4") {
    print(
      "Select option\n1 - Add new user\n2 - Remove user\n3 - Show list of registered users\n4 - Exit",
    );
    state = stdin.readLineSync()!.toLowerCase();
    mainMenu(state);
  }
}

// Find the area of a rectangle using class

class Rectangle {
  double? length;
  double? width;
  double area() {
    return length! * width!;
  }
}

void rectangleClass() {
  Rectangle rectangle1 = Rectangle();
  print('Calculate the area of a rectangle');
  while (true) {
    try {
      print('Enter rectangle length:');
      rectangle1.length = double.parse(stdin.readLineSync()!);
      if (rectangle1.length! <= 0) {
        print('Value must be positive, silly! Try again');
      } else {
        break;
      }
    } catch (e) {
      print('What is a number, really? Try again');
    }
  }
  while (true) {
    try {
      print('Enter rectangle width:');
      rectangle1.width = double.parse(stdin.readLineSync()!);
      if (rectangle1.width! <= 0) {
        print('Let\'s stick to reality for now, shall we? Try again');
      } else {
        break;
      }
    } catch (e) {
      print('Oops, looks like you made a typo. Try again');
    }
  }
  print('The area of your rectangle is ${rectangle1.area()}');
  if (rectangle1.length == rectangle1.width) {
    print('Your rectangle is a square!');
  }
}

//create and calculate area of rectangle with constructor

class RectangleWithConstructor {
  double length;
  double width;

  RectangleWithConstructor(this.length, this.width) {
    print("Constructor called with length=$length and width=$width");
  }
  double area() {
    return length * width;
  }

  double perimeter() {
    return 2 * (length + width);
  }

  double diagonal() {
    return sqrt(length * length + width * width);
  }
}

double getUserInput(String prompt, String value) {
  while (true) {
    print(prompt);
    try {
      double input = double.parse(stdin.readLineSync()!);
      if (input <= 0) {
        print('$value should be positive. Try again.');
        continue;
      }
      return input;
    } catch (e) {
      print('$value should be a number. Try again.');
    }
  }
}

void rectangleAreaWithConstructor() {
  // Originally the main() function
  print('Rectangle area, perimeter and main diagonal calculation:');
  double len = getUserInput('Enter length: ', 'Length');
  double wid = getUserInput('Enter width: ', 'Width');
  RectangleWithConstructor rect = RectangleWithConstructor(len, wid);
  print('Area: ${rect.area()}');
  print('Perimeter: ${rect.perimeter()}');
  print('Diagonal: ${rect.diagonal()}');
  if (len == wid) {
    print('Your rectangle is a square!');
  }
}

// List of named constructors

class Person {
  String? name;
  int? age;

  Person(this.name, this.age);

  Person.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    print('Constructor 1 called with name=$name and age=$age');
  }

  Person.fromJsonString(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    name = json['name'];
    age = json['age'];
    print('Constructor 2 called with name=$name and age=$age');
  }
}

void namedConstructors() {
  // Originally the main() function
  String jsonString1 = '{"name": "Alice", "age": 30}';
  Map<String, dynamic> jsonString2 = {"name": "Bob", "age": 25};

  Person p1 = Person.fromJsonString(jsonString1);
  print('Person 1 Name: ${p1.name}');
  print('Person 1 Age: ${p1.age}');

  Person p2 = Person.fromJson(jsonString2);
  print('Person 2 Name: ${p2.name}');
  print('Person 2 Age: ${p2.age}');
}

// Simple bank account management system with export of transaction history to a file

void bankAccount() async {
  // This would be the main() function in a real app
  double? initialBalance;
  print('Account Management');

  while (true) {
    stdout.write('Enter initial balance: \$');
    initialBalance = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;
    if (initialBalance < 0) {
      print('Please enter a valid amount.');
    } else {
      break;
    }
  }

  var account = Account(initialBalance);

  while (true) {
    print('\nCurrent Balance: \$${account.balance.toStringAsFixed(2)}.');
    print(
      '\nChoose an option: (d)eposit, (w)ithdraw, transaction (h)istory, (q)uit',
    );
    stdout.write('Your choice: ');
    String? choice = stdin.readLineSync()?.toLowerCase();

    if (choice == 'q') break;
    if (choice == 'h') {
      print('Transaction History:');
      if (account.history.length <= 1) {
        // Only in case of no recorded transactions
        print('No transactions yet.');
      } else {
        account.history.forEach(print); // Will print creation too, that's fine
      }
      continue;
    }

    if (choice == 'd' || choice == 'w') {
      stdout.write('Enter amount: \$');
      double? amount = double.tryParse(stdin.readLineSync() ?? '0') ?? 0.0;
      if (amount <= 0) {
        print('Invalid amount.');
        continue;
      }
      if (choice == 'd') {
        account.deposit(amount);
      } else if (choice == 'w') {
        account.withdraw(amount);
      }
    } else {
      print('Please select a valid choice.');
    }
  }
  print('Saving transaction history...');
  await saveHistory(account.history, 'transaction_history.txt');
  print('Exiting. Thank you!');
}

class Account {
  // This class would be in a separate file in a real app, should work fine with imports
  double _balance;
  final List<String> _history = [];

  Account(this._balance) {
    if (_balance < 0) {
      throw ArgumentError('Initial balance cannot be negative.');
    }
    print(
      'Account created with initial balance: \$${balance.toStringAsFixed(2)}.',
    );
    _history.add(
      '${DateTime.now()}: Account created with initial balance: \$${balance.toStringAsFixed(2)}.',
    );
  }

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit amount must be positive.');
      return;
    }
    _balance += amount;
    print(
      'Deposited: \$$amount, New Balance: \$${balance.toStringAsFixed(2)}.',
    );
    _history.add(
      '${DateTime.now()}: Deposited \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}.',
    );
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be positive.');
      return;
    }
    if (amount > _balance) {
      print(
        'Insufficient funds. Current Balance: \$${_balance.toStringAsFixed(2)}.',
      );
      return;
    }
    _balance -= amount;
    print(
      'Withdrew: \$$amount, New Balance: \$${_balance.toStringAsFixed(2)}.',
    );
    _history.add(
      '${DateTime.now()}: Withdrew \$${amount.toStringAsFixed(2)}. New Balance: \$${balance.toStringAsFixed(2)}.',
    );
  }

  List<String> get history => List.unmodifiable(_history);
}

Future<void> saveHistory(List<String> history, String filename) async {
  final File file = File(filename);
  await file.writeAsString(
    '${history.join('\n')}\n\n',
    mode: FileMode.append,
    encoding: utf8,
  );
  print('History saved to $filename');
}
