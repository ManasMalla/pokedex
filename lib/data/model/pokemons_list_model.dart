import 'package:equatable/equatable.dart';
import 'package:pokedex/domain/entitity/pokemons_list.dart';

class PokemonsListModel extends Equatable {
  final List<PokemonListItemModel> items;
  const PokemonsListModel({required this.items});

  @override
  List<Object?> get props => [items];

  factory PokemonsListModel.fromJson(Map<String, dynamic> json) {
    final results = json["results"] as List<dynamic>;
    final items =
        results.map((result) => PokemonListItemModel.fromJson(result));
    return PokemonsListModel(items: items.toList());
  }

  PokemonsList toEntity() =>
      PokemonsList(items: items.map((item) => item.toEntity()).toList());
}

class PokemonListItemModel extends Equatable {
  final String name;
  final String endpoint;
  const PokemonListItemModel({required this.name, required this.endpoint});

  @override
  List<Object?> get props => [name, endpoint];

  factory PokemonListItemModel.fromJson(Map<String, dynamic> json) =>
      PokemonListItemModel(name: json["name"], endpoint: json["url"]);

  PokemonListItem toEntity() => PokemonListItem(name: name, endpoint: endpoint);
}
