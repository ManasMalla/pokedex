import 'dart:convert';

import 'package:pokedex/data/exception.dart';
import 'package:pokedex/data/model/pokemons_list_model.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../model/pokemon_model.dart';

abstract class PokemonsDataSource {
  Future<PokemonsListModel> getPokemonsList(int limit);
  Future<PokemonModel> getPokemon(String url);
}

class PokemonDataSourceImpl implements PokemonsDataSource {
  final http.Client client;
  const PokemonDataSourceImpl({required this.client});
  @override
  Future<PokemonsListModel> getPokemonsList(int limit) async {
    final response = await client.get(Uri.parse(Urls.getListOfPokemons(limit)));
    if (response.statusCode == 200) {
      return PokemonsListModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModel> getPokemon(String url) async {
    final response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
