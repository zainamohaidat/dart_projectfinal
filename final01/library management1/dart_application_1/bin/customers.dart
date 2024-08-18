import 'book.dart';
import 'dart:io';
import 'listbook.dart';
import 'user.dart';

class Customers extends User {
   String _name, _emaile, _password;
  Book book = Book();
  Customers.name(this._name,this._emaile);
  Customers(String username, String emaile, String password,this._name,this._emaile,this._password)
      : super(username, emaile, password);

  //Customers.named(this._name, this._emaile);
  //Customers(this._name, this._emaile, this._password);

  String get username => _name;
  String get emaile => _emaile;
  String get password => _password;
  set username(String name1) {
    _name = name1;
  }

  set emaile(emaile1) {
    _emaile = emaile1;
  }

  set password(password1) {
    _password = password1;
  }

  Book? searchbook() {
    stdout.write("Enter the name book :");
    String tittle = stdin.readLineSync()!;

    for (var book in listbook) {
      if (book.tittle.toLowerCase() == tittle.toLowerCase()) {
        return book;
      }
    }
    return null;
  }

  void borrow() {
    book.display();
    print("Select the book you want borrow :");
    String a = stdin.readLineSync()!;
    stdout.write("Are you sure to borrow this book?");
    String c = stdin.readLineSync()!;
    if (c.toLowerCase() == "yes") {
      if (book.status == BookStatus.available) {
        book.status = BookStatus.borrowed;
        print("Book borrowed successfully");
        customerMenue();
      } else {
        print("Book is not available for borrowing");
        customerMenue();
      }
    } else {
      //هون لازم اعمل الشرط انه يرجع للمينيو
      print("The order has been cancelled.");
      customerMenue();
    }
  }

  // bool? reserveBook() {
  //   stdout.write("Please enter the name :");
  //   String name = stdin.readLineSync()!;
  //   stdout.write("Please enter the  isbn book :");
  //   String isbnBOOK = stdin.readLineSync()!;
  //   if (name == username && isbnBOOK == book.ISBN) {
  //     if (borrow() != null) {
  //       DateTime datenow = DateTime.now();
  //       String datenow1 = datenow.toString();
  //       String x = name + isbnBOOK + datenow1;
  //       reservlist.add(x);
  //       print("You have been added to the waiting list .");
  //       return true;
  //     }
  //   } else {
  //     print("There is an error ,check your name or the tittle of book please.");
  //     return false;
  //   }
  void customerMenue() {
    int choice;
    print("1.Search book.");
    print("2.Borrow book.");
    print("3. Return book");
    print("4.Exite");
    stdout.write("Enter your choice: ");
    try {
      choice = int.parse(stdin.readLineSync()!);
    } on FormatException catch (e) {
      print("Invalid input! Please enter a number between 1 and 4.");
      choice = -1; // Set a default value to avoid infinite loop
    }

    switch (choice) {
      case 1:
        Book library = Book();
        Book? foundBook = library.searchbook();

        if (foundBook != null) {
          print("Tittle: ${foundBook.tittle}");
          print("author: ${foundBook.author}");
          print("gener: ${foundBook.gener}");
          print("ISBN: ${foundBook.ISBN}");
          print("descreption : ${foundBook.description}");
          stdout.write("Do you want to search other books ? yes/no : ");
          String c = stdin.readLineSync()!;
          if (c.toLowerCase() == "yes") {
            library.searchbook();
          } else {
            //menu();
          }
        } else {
          print("Tittle: ${foundBook?.tittle ?? 'Book not found'}");
          print("author: ${foundBook?.author ?? 'Book not found'}");
          stdout.write("Do you want to add other books ? yes/no : ");
          String c = stdin.readLineSync()!;
          if (c.toLowerCase() == "yes") {
            library.searchbook();
          } else {
            //menu();
          }
        }

        break;
      case 2:
        borrow();
        break;
      case 3:
        returnbook();
        break;
      case 4:
        print("Are you sure to exit this app yes/no?");
        String c = stdin.readLineSync()!;
        if (c.toLowerCase() == "yes") {
          print("Exiting...");
          exit(userChoice());
        } else {
          //call function inside it (recursion)
          customerMenue();
        }
        break;
      default:
        print("Invalid choice. Try again.\n");
    }
    while (choice != 4);
  }

  void returnbook() {
    print("Select the book you want return :");
    String a = stdin.readLineSync()!;
    stdout.write("Are you sure to return this book?");
    String c = stdin.readLineSync()!;
    if (c.toLowerCase() == "yes") {
      if (book.status == BookStatus.borrowed) {
        book.status = BookStatus.available;
        print("Book returned successfully");
      } else {
        print("Book is not borrowed");
      }
    } else {
      print("Book is not borrowed"); //هون برضو لازم يعمل لجوع للمنيو
    }
  }

  // bool? reserveBook() {
  //   // User input with error handling
  //   stdout.write("Please enter your name: ");
  //   String name = stdin.readLineSync()!;

  //   if (name == null) {
  //     print("Error: Invalid name input. Please try again.");
  //     return null;
  //   }

  //   stdout.write("Please enter the ISBN of the book: ");
  //   String isbn = stdin.readLineSync()!;
  //   if (isbn == null) {
  //     print("Error: Invalid ISBN input. Please try again.");
  //     return null;
  //   }

  // // Authentication and book check (replace with actual logic)
  // if (name != username || isbn != book.ISBN) {
  //   print(
  //       "There is an error. Please check your name or the ISBN of the book.");
  //   return false;
  // }

  // // Borrowing check (replace with actual logic)
  // if (borrow() != null) {
  //   // Assuming canBorrow() returns a bool
  //   print(
  //       "You cannot borrow a book at this time. Please check your borrowing limits.");
  //   return false;
  // }

  // // Successful reservation
  // DateTime now = DateTime.now();
  // String reservationString = "$name$isbn${now.toString()}";
  // reservlist.add(reservationString);
  // print("You have been added to the waiting list.");
  // return true;
}
//}

// Helper function for safer user input
// String? getInputString(String prompt) {
//   stdout.write(prompt);
//   String? input = stdin.readLineSync();
//   if (input == null || input.isEmpty) {
//     print("Error: Input cannot be empty. Please try again.");
//     return null;
//   }
//   return input.trim(); // Remove leading/trailing whitespace
//}

void main(List<String> args) {
  Customers c = Customers("", "", "");
  //c.reserveBook();
  //print(c.searchbook());
  c.borrow();
}
