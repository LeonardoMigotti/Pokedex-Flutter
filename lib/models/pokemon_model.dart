class PokemonModel {
  final int id;
  final String name;
  final int height;
  final int weight;
  final String imageUrl;

  final String type1;
  final String? type2;

  final int health;
  final int attack;
  final int defense;
  final int speed;

  final int specialAttack;
  final int specialDefense;

  final String ability;

  PokemonModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.imageUrl,
    required this.type1,
    this.type2,
    required this.health,
    required this.attack,
    required this.defense,
    required this.speed,
    required this.specialAttack,
    required this.specialDefense,
    required this.ability,
  });

  factory PokemonModel.fromMap(Map<String, dynamic> json) {
    final typeList = json['types'] as List;
    final statsList = json['stats'] as List;
    final abilitiesList = json['abilities'] as List;
    final id = json['id'];

    return PokemonModel(
      id: json['id'],
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      //imageUrl: json['sprites']['front_default'],
      imageUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
      type1: typeList[0]['type']['name'],
      type2: typeList.length == 2 ? typeList[1]['type']['name'] : null,
      health: statsList[0]['base_stat'],
      attack: statsList[1]['base_stat'],
      defense: statsList[2]['base_stat'],
      specialAttack: statsList[3]['base_stat'],
      specialDefense: statsList[4]['base_stat'],
      speed: statsList[5]['base_stat'],
      ability: abilitiesList[0]['ability']['name'],
    );
  }
}
