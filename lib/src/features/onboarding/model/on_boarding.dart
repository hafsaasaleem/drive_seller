// ignore_for_file: public_member_api_docs, sort_constructors_first
class OnBoarding {
  final int id;
  final String title, description, image;
  OnBoarding({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnBoarding> onboarding = [
  OnBoarding(
    id: 1,
    image: 'assets/images/on_boarding_img1.png',
    title: 'Selecting a Car',
    description:
        'Find your dream car and start the bidding process by selecting from a wide range of vehicles available on our car auction app.',
  ),
  OnBoarding(
    id: 2,
    image: 'assets/images/on_boarding_img2.png',
    title: 'Placing a Bid',
    description:
        'Discover the exciting world of car auctions and confidently place your bids on the vehicles that catch your eye.',
  ),
  OnBoarding(
    id: 3,
    image: 'assets/images/on_boarding_img3.png',
    title: 'Winning a Car',
    description:
        'Winning a car with Company app. Complete the transaction and become the proud owner of your desired vehicle.',
  ),
];
