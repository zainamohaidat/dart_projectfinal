import 'dart:io';

import 'listbook.dart';

enum BookStatus { available, borrowed }

class Book {
  Book();
  late String _tittle, _author, _gener, ISBN, _description;
  late int _puplication_year;
  BookStatus _status = BookStatus.available;
  Book.named4(this._tittle, this.ISBN);
  Book.named3(this._tittle, this._author);
  Book.named2(this._tittle, this._author, this._status);
  Book.named(
      this._tittle, this._author, this._gener, this.ISBN, this._description);
  String get tittle => _tittle;
  String get author => _author;
  String get gener => _gener;
  BookStatus get status => _status;
  String get description => _description;
  set description(String des1) {
    description = des1;
  }

  set status(BookStatus status1) {
    status = status1;
  }

  set tittle(String tittle1) {
    tittle = tittle1;
  }

  String tostring() {
    return 'BOOK:(tittle:$tittle, author:$author, gener:$gener,descreption:$_description)';
  }

  set author(String author1) {
    author = author1;
  }

  set gener(String gener1) {
    gener = gener1;
  }

  @override
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

  void display() {
    print("the menue of books :");
    listbook.forEach((element) {
      print(element.tittle);
    });
  }
}

void main(List<String> args) {
  Book b = Book.named(
      "To Kill a Mkingbird",
      "Harper Lee",
      "Southern Gothic fiction",
      "9780060935467",
      "A young girl witnesses the racial injustice of the American South through her father\''s defense of a wrongly accused Black man.");

  //b.addBook(b);
  Book library = Book();
  // stdout.write("Enter the book name : ");
  // String tittleToSearch = stdin.readLineSync()!;
  // Book? foundBook = library.searchbook();

  // if (foundBook != null) {
  //   print("Tittle: ${foundBook._tittle}");
  //   print("author: ${foundBook._author}");
  //   print("gener: ${foundBook._gener}");
  //   print("ISBN: ${foundBook.ISBN}");
  //   print("descreption : ${foundBook._description}");
  // } else {
  //   print("Tittle: ${foundBook?.tittle ?? 'Book not found'}");
  //   print("author: ${foundBook?.author ?? 'Book not found'}");
  // }

  // library.borrow();

  // library.borrow();
  // b.display();
}
