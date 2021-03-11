import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/data/pokedetails.dart';
import 'package:pokemon/data/pokemondata.dart';
import 'package:pokemon/data/pokemoninfo.dart';
import 'package:pokemon/data/pokemonspecies.dart';

class PokemonDetailsCubit extends Cubit<PokemonDetails>{
  final _dataPokemon = DataPokemon();

  PokemonDetailsCubit(): super(null);

  void getPokemonDetails(int pokemonId) async{
    final responses = await Future.wait([
    _dataPokemon.getPokemonInfo(pokemonId),
    _dataPokemon.getPokemonSpeciesInfo(pokemonId)]);

    final pokemonInfo = responses[0] as PokemonInfo;
    final speciesInfo = responses[1] as PokemonSpecies;
    
    emit(PokemonDetails(
        id: pokemonInfo.id,
        name: pokemonInfo.name,
        imageUrl: pokemonInfo.imageUrl,
        types: pokemonInfo.types,
        height: pokemonInfo.height,
        weight: pokemonInfo.weight,
        description: speciesInfo.description));
  }

  void clearData() => emit(null);
}