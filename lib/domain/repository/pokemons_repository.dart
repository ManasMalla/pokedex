import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/entitity/pokemons_list.dart';

import '../../data/failure.dart';
import '../entitity/pokemon.dart';

abstract class PokemonsRepository {
  Future<Either<Failure, PokemonsList>> getListOfPokemons(int limit);
  Future<Either<Failure, Pokemon>> getPokemon(String url);
}
