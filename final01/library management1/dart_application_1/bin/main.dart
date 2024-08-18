import 'User.dart';
import 'dart:io';
import 'adminiostrator.dart';
import 'customers.dart';

void main() {
  User user = User("", "", "");
  void rulemenu(int a) {
    int choice = a;

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
  }

  user.menu();
}
