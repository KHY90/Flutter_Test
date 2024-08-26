import 'package:flutter/material.dart';
import '../models/Burger.dart';
import '../widgets/burger_card.dart';
import '../data/burgers_data.dart';
import '../screens/post_screen.dart'; // 추가: PostScreen의 import

class BurgersHomePage extends StatefulWidget {
  @override
  _BurgersHomePageState createState() => _BurgersHomePageState();
}

class _BurgersHomePageState extends State<BurgersHomePage> {
  int _selectedIndex = 0;
  List<Burger> favorites = [];

  void _onItemTapped(int index) async {
    if (index == 2) {
      // 'post' 아이템 클릭 시
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostScreen()),
      );

      if (result != null) {
        // 결과를 처리합니다. 예를 들어, 새로운 햄버거를 리스트에 추가합니다.
        setState(() {
          burgers.add(Burger(
            name: result['name'],
            description: result['description'],
            imageUrl: result['imageUrl'],
          ));
        });
      }
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
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

  void _deleteBurger(Burger burger) {
    setState(() {
      favorites.remove(burger);
      burgers.remove(burger);
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
            burger: burgers[index],
            isFavorite: favorites.contains(burgers[index]),
            onFavoritePressed: () => toggleFavorite(burgers[index]),
            onDeletePressed: () => _deleteBurger(burgers[index]),
          );
        },
      )
          : ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          return BurgerCard(
            burger: favorites[index],
            isFavorite: true,
            onFavoritePressed: () => toggleFavorite(favorites[index]),
            onDeletePressed: () => _deleteBurger(favorites[index]),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Post',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
