import 'dart:math';

import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;
  final List<String> types;
  final String image;
  final int weight;
  final int height;
  double get bmi => weight / pow(height, 2);
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  double get averagePower =>
      (hp + attack + defense + specialAttack + specialDefense + speed) / 6;
  const Pokemon({
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

  @override
  String toString() {
    // TODO: implement toString
    return "#$id $name: $types, $image, weight: $weight, height: $height, hp: $hp, attack: $attack, defense: $defense, specialAttack: $specialAttack, specialDefense: $specialDefense, speed: $speed";
  }
}
