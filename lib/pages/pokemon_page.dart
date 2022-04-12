import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/models/pokemon_model.dart';
import 'package:pokemon/pages/error_page.dart';

import '../core/d_injector.dart';

class PokemonPage extends StatefulWidget {
  const PokemonPage(this.id, {Key? key}) : super(key: key);
  final String id;

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  final apiService = di.apiServices;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Pokemon?>(
        future: di.apiServices.getPokemonById(widget.id, context: context),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            return Scaffold(
              body: Center(
                  child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://images.unsplash.com/photo-1577451804961-4053f81845d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            child: Image.network(data.picture),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '#${data.id}',
                            style: GoogleFonts.ruslanDisplay(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data.ename,
                            style: GoogleFonts.ruslanDisplay(
                              fontSize: 90,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text('Skill: '),
                          const SizedBox(height: 15),
                          Text('Egg: ${data.skills.egg.map((e) => e)}'),
                          const SizedBox(height: 10),
                          Text('Level: ${data.skills.levelUp.map((e) => e)}'),
                          const SizedBox(height: 10),
                          Text(
                              'Transfer: ${data.skills.transfer.map((e) => e)}'),
                        ],
                      ),
                      Positioned(
                          top: 0,
                          left: 0,
                          child: Text(
                            'Chinese Name: ${data.cname}',
                            style:
                                GoogleFonts.nunito(fontWeight: FontWeight.bold),
                          )),
                      Positioned(
                          top: 0,
                          right: 0,
                          child: Text(
                            'Japanese Name: ${data.jname}',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                    ],
                  ),
                ),
              )),
            );
          }
          if (snapshot.hasError) {
            return const ErrorPage();
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
