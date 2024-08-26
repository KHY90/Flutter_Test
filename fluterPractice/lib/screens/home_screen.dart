import 'package:flutter/material.dart';
import '../models/Burger.dart';
import '../widgets/burger_card.dart';
import '../data/burgers_data.dart';

class BurgersHomePage extends StatefulWidget {
  @override
  _BurgersHomePageState createState() => _BurgersHomePageState();
}

class _BurgersHomePageState extends State<BurgersHomePage> {
  int _selectedIndex = 0;
  List<Burger> favorites = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void toggleFavorite(Burger burger) {
    setState(() {
      if (favorites.contains(burger)) {
        favorites.remove(burger);
      } else {
        favorites.add(burger);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedIndex == 0 ? '햄버거 메뉴' : '즐겨찾기'),
      ),
      body: _selectedIndex == 0
          ? ListView.builder(
        itemCount: burgers.length,
        itemBuilder: (context, index) {
          return BurgerCard(
            burger: burgers[index], // 수정: burgerCard 대신 burger로 변경
            isFavorite: favorites.contains(burgers[index]),
            onFavoritePressed: () => toggleFavorite(burgers[index]),
          );
        },
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return BurgerCard(
            burger: favorites[index], // 수정: burgerCard 대신 burger로 변경
            isFavorite: true,
            onFavoritePressed: () => toggleFavorite(favorites[index]),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
