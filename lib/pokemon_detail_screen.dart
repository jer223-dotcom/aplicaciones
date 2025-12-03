import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;

  const PokemonDetailScreen({super.key, required this.data});

  Color getTypeColor(String type) {
    switch (type) {
      case "fire":
        return Colors.red;
      case "water":
        return Colors.blue;
      case "grass":
        return Colors.green;
      case "electric":
        return Colors.yellow;
      case "fairy":
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getTypeColor(data["type"]);

    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(data["image"], height: 150),
            const SizedBox(height: 20),
            Text(
              data["name"].toUpperCase(),
              style: const TextStyle(
                fontSize: 28,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Tipo: ${data['type'].toString().toUpperCase()}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


