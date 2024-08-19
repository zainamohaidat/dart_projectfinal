import 'book.dart';

List<Book> listbook = [
  Book.named(
      "To Kill a Mockingbird",
      "Harper Lee",
      "Southern Gothic fiction",
      "9780060935467",
      "A young girl witnesses the racial injustice of the American South through her father\''s defense of a wrongly accused Black man."),
  Book.named("1984", "George Orwell", "Dystopian fiction", "9780451524935",
      "'A chilling portrayal of a totalitarian society where individuality and free thought are suppressed."),
  Book.named(
      "Pride and Prejudice",
      "Jane Austen",
      "Romantic comedy",
      "9781503290563",
      " is a classic romance novel following Elizabeth Bennet, a witty and independent woman, and her complex relationship with the proud and wealthy Mr. Darcy. Their journey from initial prejudice to love is filled with misunderstandings and societal pressures."),
  Book.named(
      "The Lord of the Rings",
      "J.R.R. Tolkien",
      "High fantasy",
      "9789864274917",
      "is an epic fantasy about a fellowship of hobbits, elves, dwarves, and men who embark on a perilous quest to destroy a powerful ring and save Middle-earth from the Dark Lord Sauron."),
  Book.named(
      "The Catcher in the Rye",
      "J.D. Salinger",
      " Coming-of-age fiction",
      "9780316769488",
      "The Catcher in the Rye is a coming-of-age story following Holden Caulfield, a troubled teenager who rebels against the 'phoniness' of the adult world. His search for authenticity leads him on a disillusioning journey through New York City."),
  Book.named("a", "b", "c", "123", "g")
];
void main(List<String> args) {
  listbook.forEach(
    (element) {
      print(element.tittle);
    },
  );
}
