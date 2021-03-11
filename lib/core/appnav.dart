import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/pokenav.dart';
import 'package:pokemon/screens/pokedex.dart';
import 'package:pokemon/screens/pokedexdetail.dart';

class AppNavigator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokeNav, int>(builder: (context, pokemonId){
      return Navigator(pages: [
        MaterialPage(child: PokedexView()),
        if(pokemonId != null) MaterialPage(child: PokemonDetailsView())
        ],
        onPopPage: (route, result){
        BlocProvider.of<PokeNav>(context).popToPokedex();
        return route.didPop(result);
        },
      );
    });
  }
}