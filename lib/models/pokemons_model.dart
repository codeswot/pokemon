import 'dart:convert';

List<Pokemons> pokemonsFromMap(String str) =>
    List<Pokemons>.from(json.decode(str).map((x) => Pokemons.fromMap(x)));

String pokemonsToMap(List<Pokemons> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Pokemons {
  Pokemons({
    required this.picture,
    required this.id,
    required this.name,
  });

  final String picture;
  final int id;
  final String name;

  factory Pokemons.fromMap(Map<String, dynamic> json) => Pokemons(
        picture: json["picture"],
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "picture": picture,
        "id": id,
        "name": name,
      };
}
