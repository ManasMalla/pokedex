import 'package:dartz/dartz.dart';
import 'package:pokedex/domain/repository/pokemons_repository.dart';

import '../../data/failure.dart';
import '../entitity/pokemons_list.dart';

class GetPokemons {
  final PokemonsRepository pokemonsRepository;
  const GetPokemons({required this.pokemonsRepository});

  Future<Either<Failure, PokemonsList>> getAllPokemons(int limit) {
    return pokemonsRepository.getListOfPokemons(limit);
  }
}
