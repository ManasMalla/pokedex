import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pokedex/data/failure.dart';
import 'package:pokedex/domain/entitity/pokemon.dart';
import 'package:pokedex/domain/entitity/pokemons_list.dart';
import 'package:pokedex/domain/repository/pokemons_repository.dart';

import '../datasources/pokemons_datasource.dart';
import '../exception.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsDataSource dataSource;
  const PokemonsRepositoryImpl({required this.dataSource});
  @override
  Future<Either<Failure, PokemonsList>> getListOfPokemons(int limit) async {
    try {
      final result = await dataSource.getPokemonsList(limit);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(
        Failure(message: "Server failure"),
      );
    } on SocketException {
      return const Left(
        Failure(
            message: "Oops! You don't seem to be connected to the internet"),
      );
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(String url) async {
    try {
      final result = await dataSource.getPokemon(url);
      return Right(result.toEntity());
    } on ServerException {
      return const Left(
        Failure(message: "Server failure"),
      );
    } on SocketException {
      return const Left(
        Failure(
            message: "Oops! You don't seem to be connected to the internet"),
      );
    }
  }
}
