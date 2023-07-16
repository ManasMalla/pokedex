import 'package:mockito/annotations.dart';
import 'package:pokedex/domain/repository/pokemons_repository.dart';

@GenerateMocks(
  [
    PokemonsRepository,
  ],
  // customMocks: [MockSpec<http.Client>(as: #MockHttpClient)],
)
void main() {}
