class Urls {
  static String getListOfPokemons(int limit) {
    return "https://pokeapi.co/api/v2/pokemon?limit=$limit";
  }
}
