import 'package:pokedex/core/errors.dart';
import '../repositories/poke_repository.dart';
import '../models/pokemon_model.dart';

class HomeController {
  final PokeRepository _repository;

  HomeController(this._repository);

  int _offset = 0;

  int _limit = 20;

  Failure? failure;

  List<PokemonModel> pokemons = <PokemonModel>[];

  int get length => pokemons.length;

  Future<void> fetch() async {
    failure = null;
    final result = await _repository.fetch(limit: _limit, offset: _offset);
    result.fold((l) => failure = l, (r) => pokemons.addAll(r));
  }

  Future<void> next() async {
    _offset += _limit;
    await fetch();
  }
}
