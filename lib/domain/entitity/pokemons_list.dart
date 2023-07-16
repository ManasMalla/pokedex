import 'package:equatable/equatable.dart';

class PokemonsList extends Equatable {
  final List<PokemonListItem> items;
  const PokemonsList({required this.items});

  @override
  List<Object?> get props => [items];
}

class PokemonListItem extends Equatable {
  final String name;
  final String endpoint;
  const PokemonListItem({required this.name, required this.endpoint});

  @override
  List<Object?> get props => [name, endpoint];
}
