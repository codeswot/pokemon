import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemon/core/d_injector.dart';
import 'package:pokemon/widgets/pokemon_card.dart';
import 'package:pokemon/widgets/pokemon_carosel_card.dart';

import '../models/pokemons_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final apiService = di.apiServices;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pokemon',
          style: GoogleFonts.majorMonoDisplay(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: false,
        elevation: 1,
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xfff1f1f1),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: [
                Text(
                  'Search',
                  style: GoogleFonts.nunito(color: Colors.blue),
                ),
                const SizedBox(width: 25),
                const Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 18,
                ),
              ],
            ),
          ),
          const SizedBox(width: 15),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu_open_sharp),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Gotta Catch `Em All!',
                            style: GoogleFonts.nunito(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                            ),
                          ),
                          const SizedBox(height: 15),
                          RichText(
                            text: TextSpan(
                                text: 'Pokemon',
                                style: GoogleFonts.majorMonoDisplay(
                                  color: Colors.blue,
                                  fontSize: 30,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        ', The Pocket Monsters ! \n this are super rare cute creatures that won\'t fall in battle, better catch \'em all to train \'em.',
                                    style: GoogleFonts.nunito(
                                      color: Colors.black,
                                    ),
                                  )
                                ]),
                          ),
                          const SizedBox(height: 50),
                          SizedBox(
                            height: 50,
                            width: 200,
                            child: ElevatedButton.icon(
                              onPressed: () => context.go('/all'),
                              icon: const Icon(Icons.play_arrow),
                              label: const Text('Go get `em'),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              PokemonCard(
                                'https://ironhack-pokeapi.herokuapp.com/img/002Ivysaur.png',
                                width: 0.2 * MediaQuery.of(context).size.width,
                                height:
                                    0.2 * MediaQuery.of(context).size.height,
                              ),
                              const SizedBox(width: 15),
                              PokemonCard(
                                'https://ironhack-pokeapi.herokuapp.com/img/719Diancie.png',
                                width: 0.2 * MediaQuery.of(context).size.width,
                                height:
                                    0.2 * MediaQuery.of(context).size.height,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text('Hot picks ...'),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: FutureBuilder<List<Pokemons>?>(
                          future: apiService.getAllPokemon(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return CarouselSlider.builder(
                                itemCount: snapshot.data!.length,
                                itemBuilder: (BuildContext context, int itemIdx,
                                    pageIdx) {
                                  final data = snapshot.data![itemIdx];
                                  return PokemonCaroselCard(
                                    data.picture,
                                    name: data.name,
                                    onTap: () =>
                                        context.go('/pokemon/${data.id}'),
                                  );
                                },
                                options: CarouselOptions(
                                  height:
                                      0.55 * MediaQuery.of(context).size.height,
                                  aspectRatio: 16 / 9,
                                  viewportFraction: 0.8,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  onPageChanged: (int page, r) {},
                                  scrollDirection: Axis.horizontal,
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
