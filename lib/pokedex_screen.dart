import 'package:flutter/material.dart';
import 'pokemon_detail_screen.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final TextEditingController searchController = TextEditingController();

  // Lista básica de Pokémon (puedes agregar más)
  final List<Map<String, dynamic>> pokemonList = [
    {"id": 1, "name": "bulbasaur", "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png", "type": "grass"},
    {"id": 4, "name": "charmander", "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png", "type": "fire"},
    {"id": 7, "name": "squirtle", "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/7.png", "type": "water"},
    {"id": 25, "name": "pikachu", "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png", "type": "electric"},
    {"id": 39, "name": "jigglypuff", "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/39.png", "type": "fairy"},
    {"id": 52, "name": "meowth", "image": "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/52.png", "type": "normal"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF0000),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              "Pokédex",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: searchController,
                onChanged: (value) => setState(() {}),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Buscar Pokémon...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // GRID
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: pokemonList.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemonList[index];

                  if (!pokemon["name"]
                      .toString()
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                    return const SizedBox.shrink();
                  }

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PokemonDetailScreen(data: pokemon),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            pokemon["image"],
                            height: 70,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            pokemon["name"].toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}



