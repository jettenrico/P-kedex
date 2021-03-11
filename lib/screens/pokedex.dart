import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/core/pokeblock.dart';
import 'package:pokemon/core/pokenav.dart';
import 'package:pokemon/core/pokestate.dart';

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
}

class PokedexView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
        centerTitle: true,
      ),
      body: BlocBuilder <PokemonBlock, PokemonState>(
        builder: (context, state){
          if (state is PokemonLoad){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(state is PokemonLoadSuccess){
            return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: state.pokemonlists.length,
              itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () => BlocProvider.of<PokeNav>(context).showPokeDetails(state.pokemonlists[index].id),
                    child: Card(
                      child: GridTile(
                        child: Column(
                          children: [
                            Image.network(state.pokemonlists[index].imageUrl),
                            Text(state.pokemonlists[index].name.inCaps)
                            ],
                          ),
                        ),
                      ),
                   );
                },
              );
            }else if(state is PokemonLoadFailed){
              return Center(
                child: Text(state.error.toString()),
              );
            }else{
            return Container();
            }
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search, size: 30,),
        backgroundColor: Colors.blue,
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}