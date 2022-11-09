// the class for common book data
class CommonBook {
  String? image;
  String? title;
  CommonBook(this.image, this.title);
  static List<CommonBook> getCommonBooks() {
    return [
      CommonBook(
        'assets/images/common/common_book_4.jpg',
        'Name of the book',
      ),
      CommonBook(
        'assets/images/common/common_book_3.jpg',
        'Name of the book',
      ),
      CommonBook(
        'assets/images/common/common_book_2.jpg',
        'Name of the book',
      ),
      CommonBook(
        'assets/images/common/common_book_1.jpg',
        'Name of the book',
      ),
    ];
  }
}
