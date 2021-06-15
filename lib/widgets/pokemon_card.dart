import 'package:flutter/material.dart';
import '../helpers/pokemon_helper.dart';
import '../models/pokemon_model.dart';

class PokemonCard extends StatelessWidget {
  final PokemonModel? pokemon;
  final Function? onPressed;

  const PokemonCard({
    Key? key,
    this.pokemon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed as void Function()?,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              pokemon!.type2 != null
                  ? PokemonHelper.getColor(pokemon!.type2!)
                  : PokemonHelper.getColor(pokemon!.type1),
              PokemonHelper.getColor(pokemon!.type1),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: PokemonHelper.getColor(pokemon!.type1).withOpacity(0.5),
              blurRadius: 5.0,
              offset: Offset(3, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.network(pokemon!.imageUrl, fit: BoxFit.fill),
            ),
            Text(pokemon!.name),
          ],
        ),
      ),
    );
  }
}
