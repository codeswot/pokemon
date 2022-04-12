import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PokemonCaroselCard extends StatelessWidget {
  const PokemonCaroselCard(this.image,
      {required this.name, required this.onTap, Key? key})
      : super(key: key);

  final String image;
  final String name;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.unsplash.com/photo-1577451804961-4053f81845d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80'),
          fit: BoxFit.contain,
        ),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            Image.network(
              image,
            ),
            Positioned(
              bottom: 0,
              child: Text(
                name,
                style: GoogleFonts.ruslanDisplay(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
