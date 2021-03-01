class FeaturedItems {
  final String title;
  final String image;
  final String price;

  FeaturedItems(this.title, this.image, this.price);

  static List<FeaturedItems> getAllItems() {
    return List.generate(6, (i) {
      var prices = [
        "30",
        "20",
        "50",
        "120",
        "12",
        "77",
      ];
      var images = [
        "cauliflower.png",
        "potato.jpg",
        "onion.jpg",
        "raddish.jpg",
        "carrot.webp",
        "brinjal.jpg",
      ];
      var titles = [
        "Cauliflower",
        "Potato",
        "Onion",
        "Raddish",
        "Carrot",
        "Brinjal",
      ];
      return FeaturedItems(
        titles[i],
        "assets/images/featured/${images[i]}",
        prices[i],
      );
    });
  }
}