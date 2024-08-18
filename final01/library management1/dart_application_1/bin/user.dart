import 'dart:io';
import 'adminiostrator.dart';
import 'customers.dart';

class User {
  late String _username, _emaile, _Password;
  late int _index;
  User.name2();
  User.name(this._username);
  User(this._username, this._Password, this._emaile);
  @override
  String toString() {
    return 'User(passwoord: $_Password, user name: $_username)';
  }

  void rulemenu(int a) {
    int choice = a;
    // do {
    //   print("1. Adminstrator.");
    //   print("2. Customer");
    //   print("3.Exite");
    //   stdout.write("Enter your choice :");
    //   try {
    //     choice = int.parse(stdin.readLineSync()!);
    //   } on FormatException catch (e) {
    //     print("Invalid input! Please enter a number between 1 and 3.");
    //     choice = -1; // Set a default value to avoid infinite loop
    // }
    switch (choice) {
      case 1:
        Adminiostrator a = Adminiostrator('', '', '');
        a.adminMenue();

        break;
      case 2:
        Customers a = Customers('', '', '');
        a.customerMenue();

        break;
      case 3:
        print("Are you sure to exit this app yes/no?");
        String c = stdin.readLineSync()!;
        if (c.toLowerCase() == "yes") {
          print("Exiting...");
          exit(0);
        } else {
          //call function inside it (recursion)
          rulemenu(a);
        }
        break;
      default:
        print("Invalid choice. Try again.\n");
    }
  } //while (choice != 3);

  Map<String, String> users = {}; // Empty map to store usernames and passwords
  void signUp() {
    stdout.write("Enter username: ");
    String username = stdin.readLineSync()!;
    stdout.write("Enter emaile: ");
    String email = stdin.readLineSync()!;
    stdout.write("Enter password: ");
    String password = stdin.readLineSync()!;
    users[username] = password;
    print("Sign up successful!\n");
  }

  String get username => _username;
  int get index => _index;
  set username(String newUsername) {
    _username = newUsername;
  }

  String get password => _Password;
  set password(String password1) {
    _Password = password1;
  }

  String get emaile => _emaile;
  set emaile(String emaile1) {
    _emaile = emaile1;
  }

  set index(int index1) {
    _index = index1;
  }

  void signIn() {
    stdout.write("Enter username: ");
    String username = stdin.readLineSync()!;
    stdout.write("Enter password: ");
    String password = stdin.readLineSync()!;
    Adminiostrator a = Adminiostrator(username, "", password);
    Customers b = Customers(username, emaile, password);
    if (users.containsKey(username) && users[username] == password) {
      print("Sign in successful!\n");
      print(
          "It's great to have you with us! Our system is tailor-made to make library management a breeze. Whether you're a librarian, student, or researcher, we've got the tools you need to record books and resources, search for books, manage loans, manage members, and generate reports.");
      print("Start the application as? customer/admin ");
      int role;
      print("1.Admin");
      print("2.custom");
      print("exite");
      stdout.write("Enter the role :");
      try {
        role = int.parse(stdin.readLineSync()!);
      } on FormatException catch (e) {
        print("Invalid input! Please enter a number between 1 and 3.");
        role = -1; // Set a default value to avoid infinite loop
      }
      rulemenu(role);
    } else {
      print("error, please try again");
      signIn();
    }
  }

  userChoice() {
    int choice;
    do {
      print("1. Sign up");
      print("2. Sign in");
      print("3. Exit");
      stdout.write("Enter your choice: ");
      try {
        choice = int.parse(stdin.readLineSync()!);
      } on FormatException catch (e) {
        print("Invalid input! Please enter a number between 1 and 4.");
        choice = -1; // Set a default value to avoid infinite loop
      }
      switch (choice) {
        case 1:
          signUp();
          break;
        case 2:
          signIn();
          break;
        case 3:
          print("Are you sure to exit this app yes/no?");
          String c = stdin.readLineSync()!;
          if (c.toLowerCase() == "yes") {
            print("Exiting...");
            exit(0);
          } else {
            //call function inside it (recursion)
            userChoice();
          }
          break;
        default:
          print("Invalid choice. Try again.\n");
      }
    } while (choice != 3);
  }

  void menu() {
    userChoice();
  }
}

void main() {
  User user = User("zaina", "123", ",jb");
  user.menu();
  // user.rulemenu();
}
