import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/core/d_injector.dart';
import 'package:pokemon/widgets/pokemon_card.dart';

import '../models/pokemons_model.dart';

class AllPokemons extends StatefulWidget {
  const AllPokemons({Key? key}) : super(key: key);

  @override
  State<AllPokemons> createState() => _AllPokemonsState();
}

class _AllPokemonsState extends State<AllPokemons> {
  final apiService = di.apiServices;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Pokemon'),
      ),
      body: FutureBuilder<List<Pokemons>?>(
          future: di.apiServices.getAllPokemon(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext ctx, index) {
                    final data = snapshot.data![index];
                    return PokemonCard(
                      data.picture,
                      onTap: () => context.go('/pokemon/${data.id}'),
                    );
                  },
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
