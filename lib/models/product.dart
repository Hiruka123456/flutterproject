// import 'package:flutter/material.dart';

class Product {
  final String title;
  final String description;
  final String image;
  final double price;
  // final List<Color> colors;
  final String category;
  final double rate;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    // required this.colors,
    required this.category,
    required this.rate,
  });
}

final List<Product> products = [
  Product(
    title: "Harry Potter",
    description:
        " An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world. On his eleventh birthday, Harry Potter (Daniel Radcliffe) discovers that he is no ordinary boy.",
    image: "assets/lf.png",
    price: 120,
    // colors: [
    //   Colors.black,
    //   Colors.blue,
    //   Colors.orange,
    // ],
    category: "fantasy novel",
    rate: 4.8,
  ),
  Product(
    title: "Sherlock Holmes",
    description:
        "Uncover the brilliance of Sherlock Holmes with The Best of Sherlock Holmes set. This captivating two-book collection features carefully selected tales showcasing the detective's greatest cases, capturing the essence of Sir Arthur Conan Doyle's iconic character and his unparalleled powers of deduction.",
    image: "assets/sherlock.jpg",
    price: 120,
    // colors: [
    //   Colors.brown,
    //   Colors.red,
    //   Colors.pink,
    // ],
    category: "fantasy novel",
    rate: 4.8,
  ),
  Product(
    title: "Circe",
    description:
        "In the house of Helios, god of the sun and mightiest of the Titans, a daughter is born. Circe is a strange child - not powerful and terrible, like her father, nor gorgeous and mercenary like her mother. Scorned and rejected, Circe grows up in the shadows, at home in neither the world of gods or mortals. But Circe has a dark power of her own: witchcraft. When her gift threatens the gods, she is banished to the island of Aiaia where she hones her occult craft, casting spells, gathering strange herbs and taming wild beasts. Yet a woman who stands alone will never be left in peace for long - and among her island's guests is an unexpected visitor: the mortal Odysseus, for whom Circe will risk everything.So Circe sets forth her tale, a vivid, mesmerizing epic of family rivalry, love and loss - the defiant, inextinguishable song of woman burning hot and bright through the darkness of a man's world.",
    image: "assets/circe.jpg",
    price: 55,
    // colors: [
    //   Colors.black,
    // ],
    category: "Watch",
    rate: 4.8,
  ),
];
