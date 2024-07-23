class OnboardingContent {
  String image;
  String title;
  String description;

  OnboardingContent(
      {required this.image, required this.title, required this.description});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      image: 'lib/assets/onboard_1.svg',
      title: 'Discover Our Products',
      description:
          'Browse thousands of products, from fashion to tech. Find what you love, effortlessly.'),
  OnboardingContent(
      image: 'lib/assets/onboard_2.svg',
      title: 'Hassle-Free Checkout',
      description:
          'Seamless payments and speedy delivery. Start shopping smarter today.'),
  OnboardingContent(
      image: 'lib/assets/onboard_3.svg',
      title: 'Easy and Happy Shopping',
      description: 'Start shopping now and enjoy a world of convenience!"'),
];