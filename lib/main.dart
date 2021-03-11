import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'file:///C:/Users/Jett/AndroidStudioProjects/pokemon/lib/core/appnav.dart';
import 'package:pokemon/core/pokeblock.dart';
import 'package:pokemon/core/pokedetailscubit.dart';
import 'package:pokemon/core/pokeevent.dart';
import 'file:///C:/Users/Jett/AndroidStudioProjects/pokemon/lib/screens/pokedex.dart';
import 'package:pokemon/core/pokenav.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pokemonDetailsCubit = PokemonDetailsCubit();

    return MaterialApp(
      theme: Theme.of(context).copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => PokemonBlock()..add(PokemonPageRequest(page: 0))),
          BlocProvider(create: (context) => PokeNav(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context) => pokemonDetailsCubit)
        ], child: AppNavigator()),
      );
  }
}
