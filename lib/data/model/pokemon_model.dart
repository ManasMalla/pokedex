import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entitity/pokemon.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final String image;
  final int weight;
  final int height;
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  const PokemonModel({
    required this.id,
    required this.name,
    required this.types,
    required this.image,
    required this.weight,
    required this.height,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id];

  Pokemon toEntity() => Pokemon(
      id: id,
      name: name,
      types: types,
      image: image,
      weight: weight,
      height: height,
      hp: hp,
      attack: attack,
      defense: defense,
      specialAttack: specialAttack,
      specialDefense: specialDefense,
      speed: speed);
  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    var types = ((json["types"] as List<dynamic>)
        .map((e) => e["type"]["name"].toString())
        .toList());
    return PokemonModel(
        id: json["id"],
        name: json["name"],
        types: types,
        image: json["sprites"]["other"]["official-artwork"]["front_default"].toString(),
        weight: json["weight"],
        height: json["height"],
        hp: json["stats"][0]["base_stat"],
        attack: json["stats"][1]["base_stat"],
        defense: json["stats"][2]["base_stat"],
        specialAttack: json["stats"][3]["base_stat"],
        specialDefense: json["stats"][4]["base_stat"],
        speed: json["stats"][5]["base_stat"]);
  }
}
