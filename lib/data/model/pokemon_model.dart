import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entitity/pokemon.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final List<dynamic> types;
  final String image;
  final double weight;
  final double height;
  final double hp;
  final double attack;
  final double defense;
  final double specialAttack;
  final double specialDefense;
  final double speed;
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
      types: [],
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
        .map((e) => e["type"]["name"])
        .toList());
    return PokemonModel(
        id: json["id"],
        name: json["name"],
        types: types,
        image: json["sprites"]["other"]["official-artwork"]["front-default"],
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
