import 'package:flutter/material.dart';
import '../models/Burger.dart';
import '../screens/detail_screen.dart';

class BurgerCard extends StatelessWidget {
  final Burger burger; // 수정: BurgerCard 대신 Burger로 변경
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  BurgerCard({
    required this.burger, // 수정: burgerCard 대신 burger로 변경
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 80,
          height: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              burger.imageUrl, // 수정: burgerCard 대신 burger로 변경
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text('이미지를 불러올 수 없습니다.'));
              },
            ),
          ),
        ),
        title: Text(burger.name), // 수정: burgerCard 대신 burger로 변경
        subtitle: Text(burger.description), // 수정: burgerCard 대신 burger로 변경
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: onFavoritePressed,
            ),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BurgerDetailPage(burger: burger), // 수정: burgerCard 대신 burger로 변경
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
