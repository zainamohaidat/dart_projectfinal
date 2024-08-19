import 'dart:io';
import 'book.dart';
import 'reservation.dart';
import 'dart:math';

class Fine {
  double fineAmount = 0; // Initialize fineAmount to 0
  bool Payment_status = false;
  late DateTime returnDate;
  late DateTime dueDate;
  late Reservation rev;

  bool isPaid = false;

  Fine(this.dueDate, this.returnDate, Reservation reservation) {
    rev = reservation;
  }

  double calculateFine() {
    if (rev.isBorrowingPeriodOver()) {
      stdout.write("he is fined");
      int daysLate = returnDate.difference(dueDate).inDays;
      daysLate = max(daysLate, 0);

      fineAmount = daysLate * 0.5; // Assuming fine rate is 0.5 per day
      return fineAmount;
    } else {
      fineAmount = 0;
      print("he is not fined");
      return 0;
    }
  }
}

void main(List<String> args) {
  final dueDate = DateTime(2023, 11, 15);
  final returnDate = DateTime(2023, 12, 5);
  Book book = Book.named3("", "");
  // Assuming you have a Reservation object named myReservation
  Reservation myReservation = Reservation.named(book);
  final reservation = myReservation;
  // Replace with your Reservation object

  final fine = Fine(dueDate, returnDate, reservation);
  final fineAmount = fine.calculateFine();

  print("Fine amount: \$$fineAmount");
}
