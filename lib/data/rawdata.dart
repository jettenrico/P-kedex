import 'package:flutter/cupertino.dart';

class PokemonList{
  final int id;
  final String name;

  String get imageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png';
  PokemonList({@required this.id, @required this.name});

  factory PokemonList.fromJson(Map<String, dynamic> json){
    final name = json['name'];
    final url = json['url'] as String;
    final id = int.parse(url.split('/')[6]);

    return PokemonList(id: id, name: name);
  }
}

class PokemonPage{
  final List<PokemonList> pokemonLists;
  final bool nextPokemon;

  PokemonPage({@required this.pokemonLists, @required this.nextPokemon});

  factory PokemonPage.fromJson(Map<String, dynamic> json){
    final nextPokemon = json['next'] != null;
    final pokemonLists = (json['results'] as List).map((listJson) => PokemonList.fromJson(listJson)).toList();

    return PokemonPage(
        pokemonLists: pokemonLists, nextPokemon: nextPokemon
    );
  }
}
