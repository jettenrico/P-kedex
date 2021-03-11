import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/pokedetailscubit.dart';

class PokeNav extends Cubit<int>{
  PokemonDetailsCubit pokemonDetailsCubit;

  PokeNav({@required this.pokemonDetailsCubit}): super(null);

  void showPokeDetails(int pokemonId){
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void  popToPokedex(){
    emit(null);
    pokemonDetailsCubit.clearData();
  }
}