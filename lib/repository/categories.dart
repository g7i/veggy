class Categories {
  final String color;
  final String image;
  final String title;

  Categories(this.color, this.image, this.title);

  static List<Categories> getAllCategories() {
    return List.generate(6, (i) {
      var colors = [
        "7f53ba",
        "2be669",
        "f27367",
        "e81df9",
        "fdfe46",
        "df3a1d",
      ];
      var images = [
        "vegetables.png",
        "fruits.png",
        "beverages.png",
        "grocery.png",
        "oil.png",
        "organic.png",
      ];
      var titles = [
        "Vegetables",
        "Fruits",
        "Beverages",
        "Grocery",
        "Edible Oil",
        "Organic",
      ];
      return Categories(
        "0x99${colors[i]}",
        "assets/images/${images[i]}",
        titles[i],
      );
    });
  }
}
