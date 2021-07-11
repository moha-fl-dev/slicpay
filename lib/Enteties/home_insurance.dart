class HomeInsuance {
  String companyName;
  String logo;
  double price;
  double withVensyanPrice;
  int deductible;
  String priceQuality;
  double reviews;
  bool selected;

  HomeInsuance(
      {required this.companyName,
      required this.logo,
      required this.price,
      required this.withVensyanPrice,
      required this.deductible,
      required this.priceQuality,
      required this.reviews,
      this.selected = false});
}
