// import 'dart:io';
// import 'book.dart';
// import 'reservation.dart';
// import 'dart:math';

// class Fine {
//   late double fineAmount;
//   late bool Payment_status;
//   late DateTime returnDate;
//   late DateTime dueDate;
//   Reservation rev;

//   bool isPaid = false;
//   Fine(this.dueDate, this.returnDate, this.Payment_status);
//   //Fine(this.fineAmount, this.Payment_status, this.rev);
//   double calculateFine() {
//     if (rev.isBorrowingPeriodOver()) {
//       stdout.write("he is fined");
//       // Calculate the difference in days, ensuring positive value
//       int daysLate = returnDate.difference(dueDate).inDays;
//       daysLate = max(daysLate, 0); // Ensure non-negative value

//       return daysLate * fineAmount;
//     } else {
//       print("he is not fined");
//       return 0;
//     }
//   }
// }

// void main(List<String> args) {
//   final dueDate = DateTime(2023, 11, 15);
//   final returnDate = DateTime(2023, 12, 5);
//   const dailyFineRate = 0.5;

//   /// $0.50 per day
//   final fine = Fine(dueDate, returnDate, dailyFineRate);
//   final fineAmount = fine.calculateFine();

//   print("Fine amount: \$$fineAmount");
// }
// //بهذا الفكلاس حاولت اربط قيمة الغرامه مع مقدار اللتاخير في ارجاع لكتاب بس انعجقت 

