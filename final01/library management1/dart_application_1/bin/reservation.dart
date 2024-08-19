import 'book.dart';
import 'dart:io';
import 'dart:core'; //to represent a specific point in time

enum ReservationStatus { pending, confirmed, canceled }

class Reservation extends Book {
  late DateTime reservationdate;
  late Duration borrowingPeriod;
  late Book book;
  late Reservation _r;
  late int _capcity;
  ReservationStatus _status = ReservationStatus.pending;
  @override
  set status(BookStatus status1) {
    // TODO: implement status
    super.status = status1;
  }

  Reservation.named(this.book, {status = ReservationStatus.pending});
  Reservation(this.reservationdate, this.borrowingPeriod);
  DateTime get reservationDate => reservationdate;
  Duration get borrowperiod => borrowingPeriod;
  Reservation get rev => _r;
  set rev(Reservation r1) {
    _r = r1;
  }

  set reservationDate(DateTime value) => reservationdate = value;
  set borrowperiod(Duration value) => borrowingPeriod = value;
  void placeResevation() {}
  bool isBorrowingPeriodOver() {
    // stdout.write("Enter the reservation date :");
    // DateTime time = DateTime.parse(stdin.readLineSync()!);

    DateTime dueDate = reservationdate
        .add(borrowingPeriod); //due date=مدة الاستعاره +تاريخ الاستعاره

    // مقارنة تاريخ الاسترجاع المتوقع بالتاريخ الحالي
    return DateTime.now().isAfter(dueDate);
  }

  void displayStatus() {
    switch (_status) {
      case ReservationStatus.pending:
        print("Reservation status for $tittle is pending");
        break;
      case ReservationStatus.confirmed:
        print("Reservation status for $tittle is confirmed");
        break;
      case ReservationStatus.canceled:
        print("Reservation status for $tittle is cancelled");
        break;
      default:
        print("Invalid reservation status ");
    }
  }
}

void main(List<String> args) {
  Reservation mybook = Reservation(DateTime(8, 15, 2024), Duration(days: 7));
  if (mybook.isBorrowingPeriodOver()) {
    print("The book loan period has expired");
  } else {
    print("The book loan period has not expired");
  }
//   Reservation.named(Book.named3("To Kill a Mockingbird", "Harper Lee"),
//       ReservationStatus.confirmed);
//   mybook.displayStatus();
}
