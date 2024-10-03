class Category {
  final String title;
  final String image;

  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: " fantasy novel", image: "assets/shoes.jpg"),
  Category(title: "Thriller", image: "assets/beauty.png"),
  Category(title: "Mystery", image: "assets/pc.jpg"),
  Category(title: "Science fiction", image: "assets/mobile.jpg"),
  Category(title: "Historical Fiction", image: "assets/watch.png"),
];
