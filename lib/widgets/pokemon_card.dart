import 'package:flutter/material.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard(this.image, {this.height = 100, this.width = 100, Key? key})
      : super(key: key);
  final double? width;
  final double? height;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.blue),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(
          image,
        ),
      ),
    );
  }
}
