class OnBoarding {
  String title;
  String description;
  String image;
  OnBoarding(
      {required this.title, required this.description, required this.image});

  static List<OnBoarding> getOnBoarding = [
    OnBoarding(
      title: 'Books are the quietest',
      description:
          'and most constant of friends; they are the most accessible and wisest of counselors, and the most patient of teachers',
      image: 'assets/images/onBoarding/onBoarding_1.png',
    ),
    OnBoarding(
      title: 'One glance at a book',
      description:
          'one glance at a book and you hear the voice of another person, perhaps someone dead for 1,000 years. To read is to voyage through time',
      image: 'assets/images/onBoarding/onBoarding_2.png',
    ),
    OnBoarding(
      title: 'Books are good company',
      description:
          'in sad times and happy times, for books are people – people who have managed to stay alive by hiding between the covers of a book.',
      image: 'assets/images/onBoarding/onBoarding_3.png',
    ),
  ];
}
