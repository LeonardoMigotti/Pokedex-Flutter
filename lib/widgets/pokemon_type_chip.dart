import 'package:flutter/material.dart';
import 'package:pokedex/helpers/pokemon_type_helper.dart';

class PokemonTypeChip extends StatelessWidget {
  final String? type;

  const PokemonTypeChip({
    Key? key,
    this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Text(
        PokemonTypeHelper.getIcon(type),
        style: TextStyle(
          fontFamily: 'PokeGOTypes',
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      label: Text(
        type!,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      backgroundColor: PokemonTypeHelper.getColor(type!),
    );
  }
}
