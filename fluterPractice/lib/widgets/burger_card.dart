import 'package:flutter/material.dart';
import '../models/Burger.dart';
import '../screens/detail_screen.dart';

class BurgerCard extends StatelessWidget {
  final Burger burger;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;
  final VoidCallback onDeletePressed; // 삭제 콜백 추가

  BurgerCard({
    required this.burger,
    required this.isFavorite,
    required this.onFavoritePressed,
    required this.onDeletePressed, // 삭제 콜백 추가
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
              burger.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(child: Text('이미지를 불러올 수 없습니다.'));
              },
            ),
          ),
        ),
        title: Text(burger.name),
        subtitle: Text(burger.description),
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
                    builder: (context) => BurgerDetailPage(burger: burger),
                  ),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: onDeletePressed, // 삭제 콜백 호출
            ),
          ],
        ),
      ),
    );
  }
}
