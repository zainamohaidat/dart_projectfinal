import 'dart:io';

import 'user.dart';
import 'book.dart';
import 'customers.dart';
import 'listcustomer.dart';
import 'listbook.dart';

class Adminiostrator extends User {
  Adminiostrator(String username, String emaile, String password)
      : super(username, emaile, password);
  @override
  void signUp() {
    // TODO: implement signUp
    super.signUp();
  }

  @override
  void signin() {}

  

  void addCustomer() {
    print("To add a new customer, please enter his data:");
    // ... قراءة بيانات المستخدم
    try{
    stdout.write("Enter the cutomer name : ");
    String namecustomer = stdin.readLineSync()!;
    stdout.write("Enter the cutomer emaile : ");
    String emailee = stdin.readLineSync()!;
    stdout.write("Enter the cutomer password : ");
    String password = stdin.readLineSync()!;
    Customers newCustomer = Customers.name(namecustomer, emailee);
    if (customerList.any((customer) =>
        customer.username == newCustomer.username &&
        customer.emaile == newCustomer.emaile)) {
      print("The customer already exists");
      adminMenue();
      // stdout.write("Do you want to add other customer ? yes/no : ");
      // String c = stdin.readLineSync()!;
      // if (c.toLowerCase() == "yes") {
      //   addCustomer();
      // } else {
      //   //menu();
      // }
    } else {
      customerList.add(newCustomer);
      print("The customer added successfully");
      adminMenue();
      // stdout.write("Do you want to add other books ? yes/no : ");
      // String c = stdin.readLineSync()!;
      // if (c.toLowerCase() == "yes") {
      //   addCustomer();
      // } else {
      //   //menu();
      // }
    }}on IOException catch (e) {
    print("خطأ في قراءة الإدخال: $e");
  }
  }

  void addBook() {
    stdout.write("Enter tha book name:");
    String nameBook = stdin.readLineSync()!;
    stdout.write("Eter the book's ISBN :");
    String isbnBook = stdin.readLineSync()!;
    Book newbook1 = Book.named4(nameBook, isbnBook);
    if (listbook.any((book) =>
        book.tittle == newbook1.tittle && book.ISBN == newbook1.ISBN)) {
      print("The book already exists");
      stdout.write("Do you want to add other books ? yes/no : ");
      String c = stdin.readLineSync()!;
      if (c.toLowerCase() == "yes") {
        addBook();
      } else {
        //menu();
      }
    } else {
      stdout.write("Eter the book's author : ");
      String nameAuthor = stdin.readLineSync()!;
      stdout.write("Eter the book's gener :");
      String generBook = stdin.readLineSync()!;
      stdout.write("Eter the book's description : ");
      String descriptionBook = stdin.readLineSync()!;
      Book newBook = Book.named(
          nameBook, nameAuthor, generBook, isbnBook, descriptionBook);
      listbook.add(newBook);
      print("The book added sucessfully");
      stdout.write("Do you want to add other books ? yes/no : ");
      String c = stdin.readLineSync()!;
      if (c.toLowerCase() == "yes") {
        addBook();
      } else {
        //menu();
      }
    }
  }

  void modifyCustomer() {
    try {
      print("Enter the name & emaile address you want to modify :  ");
      stdout.write("User name : ");
      late String name = stdin.readLineSync()!;
      stdout.write("emaile :");
      late String email = stdin.readLineSync()!;
      stdout.write("password :");
      late String password = stdin.readLineSync()!;
      Customers customer = Customers(name, email, password);
      late int index =
          customerList.indexWhere((customer) => customer.username == name);

      if (index >= 0) {
        stdout.write("Enter the new name :");
        late String newName = stdin.readLineSync()!;
        customerList[index].username = newName;
        print("Modified succesfulle .");
      } else {
        print("Client not found.");
      }
    } catch (e) {
      print("An error occurred while entering data: $e");
    }
  }

  // void removeUser(User user) {
  //   //error
  //   if (users.contains(user)) {
  //     users.remove(user);
  //     print('$user removed successfully');
  //   } else {
  //     print('$user not found');
  //   }
  // }

  void displaycustomer() {
    print("the customer's name :");
    customerList.forEach((element) {
      print(element.username);
    });
    //print('Users: $users');///inastance of (error)
  }

  @override
  void display() {
    print("the menue of books :");
    listbook.forEach((element) {
      print(element.tittle);
    }); //sers: $users');///inastance of (error)
  }

  void adminMenue() {
    int choice;
    print("the menue of admin task list:");
    do {
      print("1.Add customers.");
      print("2.Modify customers.");
      print("3.Remove customers.");
      print("4.Add book.");
      print("5.display customers .");
      print("6.display book.");
      print("7.Exite.");
      stdout.write("Enter your choice: ");
      try {
        choice = int.parse(stdin.readLineSync()!);
      } on FormatException catch (e) {
        print("Invalid input! Please enter a number between 1 and 5.");
        choice = -1; // Set a default value to avoid infinite loop
      }
      switch (choice) {
        case 1:
          addCustomer();
          break;
        case 2:
          modifyCustomer();
          break;
        case 3:
          //removeUser(user);
          break;
        case 4:
          addBook();
          break;
        case 5:
          displaycustomer();
          break;
        case 6:
          display();
          break;
        case 7:
          print("Are you sure to exit this app yes/no?");
          String c = stdin.readLineSync()!;
          if (c.toLowerCase() == "yes") {
            print("Exiting...");
            exit(userChoice());
          } else {
            //call function inside it (recursion)
            adminMenue();
          }
          break;
        default:
          print("Invalid choice. Try again.\n");
      }
    } while (choice != 7);
  }
}


