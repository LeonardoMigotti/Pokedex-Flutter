import 'package:flutter/material.dart';
import '../widgets/infinite_grid_view.dart';
import 'detail_page.dart';
import '../widgets/pokemon_card.dart';
import '../controllers/home_controller.dart';
import '../core/app_const.dart';
import '../repositories/poke_repository_impl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(PokeRepositoryImpl());
  bool searching = false;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await _controller.fetch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: InfiniteGridView(
        crossAxisCount: kCrossAxisCount,
        itemBuilder: _buildPokemonCard,
        itemCount: _controller.length,
        hasNext: _controller.length < kPokemonAmount,
        nextData: _onNextData,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: !searching
          ? Text(
              kAppTitle,
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Pokemon',
              ),
            )
          : TextField(
              onChanged: (searchText) {
                _filterPokemons(searchText);
              },
              style: TextStyle(
                color: Colors.black,
              ),
              autofocus: true,
              decoration: InputDecoration(
                hintText: kLabelHintText,
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: <Widget>[
        searching
            ? Container(
                margin: EdgeInsets.only(right: kOnlyRigthMargin),
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      this.searching = false;
                    });
                  },
                ),
              )
            : Container(
                margin: EdgeInsets.only(right: kOnlyRigthMargin),
                child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      this.searching = true;
                    });
                  },
                ),
              ),
      ],
    );
  }

  void _filterPokemons(searchText) {
    // searchText = searchText.toLowerCase();
    // print(searchText);
  }

  void _onNextData() async {
    await _controller.next();
    setState(() {});
  }

  Widget _buildPokemonCard(BuildContext context, int index) {
    final pokemon = _controller.pokemons[index];
    return PokemonCard(
      pokemon: pokemon,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
    );
  }
}
