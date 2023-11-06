// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoarding {
  final String title, description, image;
  OnBoarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoarding> onboarding = [
  OnBoarding(
    image: 'assets/images/on_boarding_img1.png',
    title: '',
    description: description,
  ),
];
