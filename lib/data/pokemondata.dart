import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokemon/data/pokemoninfo.dart';
import 'file:///C:/Users/Jett/AndroidStudioProjects/pokemon/lib/data/rawdata.dart';
import 'package:pokemon/data/pokemonspecies.dart';

class DataPokemon{
  final baseUrl = 'pokeapi.co';
  final client = http.Client();

  Future<PokemonPage> getPokemon(int pokeIndex) async{
    final pokeLimit = {
      'limit' : '151',
      'offset' : '0'
    };

    final uri = Uri.https(baseUrl, '/api/v2/pokemon', pokeLimit);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPage.fromJson(json);
  }

  Future<PokemonInfo> getPokemonInfo(int pokemonID) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonID');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfo.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
  Future<PokemonSpecies> getPokemonSpeciesInfo(int pokemonID) async{
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonID');

    try{
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonSpecies.fromJson(json);
    }catch (e){
      print(e);
    }
  }
}