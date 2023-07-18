import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex/domain/entitity/pokemons_list.dart';
import 'package:pokedex/domain/repository/pokemons_repository.dart';
import 'package:pokedex/domain/usecases/get_pokemon_usecase.dart';

import '../../test_helper.mocks.dart';

void main() {
  late MockPokemonsRepository pokemonsRepository;
  late GetPokemons getPokemons;

  setUp(() {
    pokemonsRepository = MockPokemonsRepository();
    getPokemons = GetPokemons(pokemonsRepository: pokemonsRepository);
  });

  const tPokemonListItem = PokemonListItem(
      name: "bulbasaur", endpoint: "https://pokeapi.co/api/v2/pokemon/1/");
  const tPokemonList = PokemonsList(items: [tPokemonListItem]);

  test('get list of pokemons', () async {
    when(pokemonsRepository.getListOfPokemons(10))
        .thenAnswer((realInvocation) async => const Right(tPokemonList));
    final result = await getPokemons.getAllPokemons(10);
    expect(result, const Right(tPokemonList));
  });
}
