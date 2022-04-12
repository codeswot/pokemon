import 'package:flutter/material.dart';

class AllPokemons extends StatefulWidget {
  const AllPokemons({Key? key}) : super(key: key);

  @override
  State<AllPokemons> createState() => _AllPokemonsState();
}

class _AllPokemonsState extends State<AllPokemons> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Pokemon'),
      ),
    );
  }
}
