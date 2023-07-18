import 'dart:convert';
import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex/data/model/pokemons_list_model.dart';
import 'package:pokedex/domain/entitity/pokemons_list.dart';

void main() {
  const tPokemonsListJson = '''{
  "count": 1281,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=10&limit=10",
  "previous": null,
  "results": [
    {
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon/1/"
    },
    {
      "name": "ivysaur",
      "url": "https://pokeapi.co/api/v2/pokemon/2/"
    },
    {
      "name": "venusaur",
      "url": "https://pokeapi.co/api/v2/pokemon/3/"
    },
    {
      "name": "charmander",
      "url": "https://pokeapi.co/api/v2/pokemon/4/"
    },
    {
      "name": "charmeleon",
      "url": "https://pokeapi.co/api/v2/pokemon/5/"
    },
    {
      "name": "charizard",
      "url": "https://pokeapi.co/api/v2/pokemon/6/"
    },
    {
      "name": "squirtle",
      "url": "https://pokeapi.co/api/v2/pokemon/7/"
    },
    {
      "name": "wartortle",
      "url": "https://pokeapi.co/api/v2/pokemon/8/"
    },
    {
      "name": "blastoise",
      "url": "https://pokeapi.co/api/v2/pokemon/9/"
    },
    {
      "name": "caterpie",
      "url": "https://pokeapi.co/api/v2/pokemon/10/"
    }
  ]
}''';
  const tPokemonsList = PokemonsList(items: [
    PokemonListItem(
        name: "bulbasaur", endpoint: "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonListItem(
        name: "ivysaur", endpoint: "https://pokeapi.co/api/v2/pokemon/2/"),
    PokemonListItem(
        name: "venusaur", endpoint: "https://pokeapi.co/api/v2/pokemon/3/"),
    PokemonListItem(
        name: "charmander", endpoint: "https://pokeapi.co/api/v2/pokemon/4/"),
    PokemonListItem(
        name: "charmeleon", endpoint: "https://pokeapi.co/api/v2/pokemon/5/"),
    PokemonListItem(
        name: "charizard", endpoint: "https://pokeapi.co/api/v2/pokemon/6/"),
    PokemonListItem(
        name: "squirtle", endpoint: "https://pokeapi.co/api/v2/pokemon/7/"),
    PokemonListItem(
        name: "wartortle", endpoint: "https://pokeapi.co/api/v2/pokemon/8/"),
    PokemonListItem(
        name: "blastoise", endpoint: "https://pokeapi.co/api/v2/pokemon/9/"),
    PokemonListItem(
        name: "caterpie", endpoint: "https://pokeapi.co/api/v2/pokemon/10/"),
  ]);

  const tPokemonsListModel = PokemonsListModel(items: [
    PokemonListItemModel(
        name: "bulbasaur", endpoint: "https://pokeapi.co/api/v2/pokemon/1/"),
    PokemonListItemModel(
        name: "ivysaur", endpoint: "https://pokeapi.co/api/v2/pokemon/2/"),
    PokemonListItemModel(
        name: "venusaur", endpoint: "https://pokeapi.co/api/v2/pokemon/3/"),
    PokemonListItemModel(
        name: "charmander", endpoint: "https://pokeapi.co/api/v2/pokemon/4/"),
    PokemonListItemModel(
        name: "charmeleon", endpoint: "https://pokeapi.co/api/v2/pokemon/5/"),
    PokemonListItemModel(
        name: "charizard", endpoint: "https://pokeapi.co/api/v2/pokemon/6/"),
    PokemonListItemModel(
        name: "squirtle", endpoint: "https://pokeapi.co/api/v2/pokemon/7/"),
    PokemonListItemModel(
        name: "wartortle", endpoint: "https://pokeapi.co/api/v2/pokemon/8/"),
    PokemonListItemModel(
        name: "blastoise", endpoint: "https://pokeapi.co/api/v2/pokemon/9/"),
    PokemonListItemModel(
        name: "caterpie", endpoint: "https://pokeapi.co/api/v2/pokemon/10/"),
  ]);

  group('to entity', () {
    test('model should be a subclass of entity', () {
      final result = tPokemonsListModel.toEntity();
      expect(result, tPokemonsList);
    });
  });

  group('from json', () {
    test('should return a valid model from json', () {
      final jsonData = json.decode(tPokemonsListJson);
      final result = PokemonsListModel.fromJson(jsonData);
      expect(result, tPokemonsListModel);
    });
  });
}
