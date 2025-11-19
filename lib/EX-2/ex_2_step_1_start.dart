import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(
        children: [
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
          FavoriteCard(),
        ],
      ),
    ),
  ),
);

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void clickFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    
  }

  Color getIconColor() {
    return isFavorite ? Colors.red : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // YOUR CODE
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [  
          BoxShadow(
            color: Colors.black.withOpacity(0.2),  // Shadow color with transparency
            spreadRadius: 1,  // How much shadow spreads
            blurRadius: 2,    // How blurry/soft the shadow is
            offset: Offset(0, 1),  // X, Y position (0=horizontal, 4=down)
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("title", style: TextStyle(color: Colors.blue.shade600, fontSize: 15, fontWeight: FontWeight.bold)), 
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text("description"),
                  )
                ],
              ),
            ),
          ),
          IconButton(icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: getIconColor()), onPressed: clickFavorite),
        ],
      ),
    );
  }
}
