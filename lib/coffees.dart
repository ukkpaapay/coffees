import 'package:flutter/cupertino.dart';

var _name = [
  "Caramel Macchiato",
  "Caramel Cold Drink",
  "Iced Coffe Mocha",
  "Caramelized Pecan Latte",
  "Toffee Nut Latte",
  "Capuchino",
  "Toffee Nut Iced Latte",
  "Americano",
  "Vietnamese-Style Iced Coffee",
  "Black Tea Latte",
  "Classic Irish Coffee",
  "Toffee Nut Crunch Latte"
];
final coffees = List.generate(
    _name.length,
    (index) =>
        Coffee(name: _name[index], image: 'assets/images/${index + 1}.png'));

class Coffee {
  Coffee({required this.name, required this.image});
  final String name;
  final String image;
}
