import 'package:pokemon/core/pokeevent.dart';
import 'file:///C:/Users/Jett/AndroidStudioProjects/pokemon/lib/data/pokemondata.dart';
import 'package:pokemon/core/pokestate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/Users/Jett/AndroidStudioProjects/pokemon/lib/data/rawdata.dart';

class PokemonBlock extends Bloc<PokemonEvent, PokemonState>{
  final _pokemonData = DataPokemon();

  PokemonBlock() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async*{
    if(event is PokemonPageRequest){
      yield PokemonLoad();

      try{
        final pokemonPageResponse = await _pokemonData.getPokemon(event.page);
        yield PokemonLoadSuccess(
          pokemonlists: pokemonPageResponse.pokemonLists,
          nextPokemon: pokemonPageResponse.nextPokemon
        );
      } catch (e){
        yield PokemonLoadFailed(error: e);
      }
    }
  }
}