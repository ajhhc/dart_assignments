import 'dart:io';
import 'dart:convert';

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
