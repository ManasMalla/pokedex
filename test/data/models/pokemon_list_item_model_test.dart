import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/model/pokemons_list_model.dart';
import 'package:pokedex/domain/entitity/pokemons_list.dart';

void main() {
  const tPokemonListItemJson = '''{
    "name": "bulbasaur",
    "url": "https://pokeapi.co/api/v2/pokemon/1/"
  }''';
  const tPokemonListItem = PokemonListItem(
      name: "bulbasaur", endpoint: "https://pokeapi.co/api/v2/pokemon/1/");
  const tPokemonListItemModel = PokemonListItemModel(
      name: "bulbasaur", endpoint: "https://pokeapi.co/api/v2/pokemon/1/");

  group('to entity', () {
    test('model should be a subclass of entity', () {
      final result = tPokemonListItemModel.toEntity();
      expect(result, tPokemonListItem);
    });
  });

  group('from json', () {
    test('should return a valid model from json', () {
      final jsonData = json.decode(tPokemonListItemJson);
      final result = PokemonListItemModel.fromJson(jsonData);
      expect(result, tPokemonListItemModel);
    });
  });
}
