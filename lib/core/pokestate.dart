import 'package:flutter/cupertino.dart';
import 'file:///C:/Users/Jett/AndroidStudioProjects/pokemon/lib/data/rawdata.dart';

abstract class PokemonState{}

class PokemonInitial extends PokemonState{}

class PokemonLoad extends PokemonState{}

class PokemonLoadSuccess extends PokemonState{
  final List<PokemonList> pokemonlists;
  final bool nextPokemon;

  PokemonLoadSuccess({@required this.pokemonlists, @required this.nextPokemon});
}

class PokemonLoadFailed extends PokemonState{
  final Error error;

  PokemonLoadFailed({@required this.error});
}