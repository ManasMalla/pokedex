import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/data/datasources/pokemons_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/data/repository/pokemons_repository_impl.dart';
import 'package:pokedex/domain/usecases/get_pokemon_usecase.dart';

void main() {
  runApp(const MyApp());
  //Adding git
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var datasource = PokemonDataSourceImpl(client: http.Client());
    var repository = PokemonsRepositoryImpl(dataSource: datasource);
    var getPokemonUsecase = GetPokemons(pokemonsRepository: repository);
    repository
        .getPokemon("https://pokeapi.co/api/v2/pokemon/1/")
        .then((value) => print(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Color(0xFF3558CD),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.string(
              '<svg width="75" height="75" viewBox="0 0 75 75" fill="none" xmlns="http://www.w3.org/2000/svg"><path opacity="0.9" d="M4.68748 38.6449C4.68748 20.0192 22.5 34.7906 37.8125 42.4992C51.5625 38.6449 70.9375 20.0191 70.9375 38.6449C70.9375 57.2706 55.9343 66.5884 37.8125 66.5884C19.6906 66.5884 4.68748 57.2706 4.68748 38.6449Z" fill="white"/><path d="M70.9375 32.1875C70.9375 50.3094 53.125 35.9375 37.8125 28.4375C24.0625 32.1875 4.6875 50.3094 4.6875 32.1875C4.6875 14.0657 19.6907 5 37.8125 5C55.9344 5 70.9375 14.0657 70.9375 32.1875Z" fill="#CD2873"/><circle cx="37.0312" cy="37.9688" r="7.03125" fill="white"/><path fill-rule="evenodd" clip-rule="evenodd" d="M0 37.5C0 16.7893 16.7893 0 37.5 0C58.2108 0 75 16.7893 75 37.5C75 58.2108 58.2108 75 37.5 75C16.7893 75 0 58.2108 0 37.5ZM8.62871 41.6667C10.6505 55.8012 22.8064 66.6667 37.5 66.6667C52.1937 66.6667 64.3496 55.8012 66.3712 41.6667H49.2887C47.5725 46.5217 42.9425 50 37.5 50C32.0575 50 27.4271 46.5217 25.7112 41.6667H8.62871ZM66.3712 33.3333C64.3496 19.1988 52.1937 8.33333 37.5 8.33333C22.8064 8.33333 10.6505 19.1988 8.62871 33.3333H25.7112C27.4271 28.4784 32.0575 25 37.5 25C42.9425 25 47.5725 28.4784 49.2887 33.3333H66.3712ZM37.5 41.6667C39.8012 41.6667 41.6667 39.8012 41.6667 37.5C41.6667 35.1987 39.8012 33.3333 37.5 33.3333C35.1987 33.3333 33.3333 35.1987 33.3333 37.5C33.3333 39.8012 35.1987 41.6667 37.5 41.6667Z" fill="#161A33"/></svg>'),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pokemon".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Colors.white),
              ),
              Text(
                "Pokedex",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
