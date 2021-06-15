import 'package:flutter/material.dart';
import 'package:pokedex/core/app_const.dart';
import '../controllers/detail_controller.dart';
import '../models/pokemon_model.dart';
import '../widgets/metric_tile.dart';
import '../widgets/pokemon_header.dart';
import '../widgets/horizontal_bar.dart';
import '../widgets/pokemon_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel? pokemon;

  const DetailPage({
    Key? key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _controller = DetailController();

  @override
  void initState() {
    _controller.setPokemon(widget.pokemon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        _controller.name,
      ),
      centerTitle: true,
      elevation: kElevation,
      backgroundColor: _controller.primaryColor,
      actions: [
        Container(
          height: kContainerHeight52,
          width: kContainerWidth80,
          child: Center(
            child: Text(
              _controller.id,
              style: TextStyle(
                fontSize: kAppBarFontSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PokemonHeader(
            backgroundColor: _controller.primaryColor,
            imageUrl: _controller.imageUrl,
          ),
          _buildTypes(),
          _buildMetrics(),
          _buildStats(),
        ],
      ),
    );
  }

  Widget _buildTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          _controller.types.map((type) => PokemonTypeChip(type: type)).toList(),
    );
  }

  Widget _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MetricTile(
          value: _controller.weight,
          label: kLabelWeight,
          unit: kUnitWeight,
        ),
        MetricTile(
          value: _controller.height,
          label: kLabelHeight,
          unit: kUnitHeight,
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: kSymmetricHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: kOnlyTopPadding),
            child: Text(
              kLabelStatistics,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PokemonStatBar(
            label: kPokemonStatBarLabelHP,
            value: _controller.health,
            foregroundColor: _controller.primaryColor,
          ),
          PokemonStatBar(
            label: kPokemonStatBarLabelAttack,
            value: _controller.attack,
            foregroundColor: _controller.primaryColor,
          ),
          PokemonStatBar(
            label: kPokemonStatBarLabelDefense,
            value: _controller.defense,
            foregroundColor: _controller.primaryColor,
          ),
          PokemonStatBar(
            label: kPokemonStatBarLabelSpAttack,
            value: _controller.specialAttack,
            foregroundColor: _controller.primaryColor,
          ),
          PokemonStatBar(
            label: kPokemonStatBarLabelDefAttack,
            value: _controller.specialDefense,
            foregroundColor: _controller.primaryColor,
          ),
          PokemonStatBar(
            label: kPokemonStatBarLabelSpeed,
            value: _controller.speed,
            foregroundColor: _controller.primaryColor,
          ),
          Padding(
            padding: const EdgeInsets.only(top: kOnlyTopPadding),
            child: Text(
              kPokemonLabelAbility1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: 75.0,
            child: Text(
              _controller.ability.toUpperCase(),
              style: TextStyle(
                fontSize: kFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
