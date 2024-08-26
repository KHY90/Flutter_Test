import 'package:fluter_practice/post/Menupost.dart';
import 'package:flutter/material.dart';
import 'BottomWidget/BottomWidget.dart';
import 'menu/MenuList.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "flutter 연습",
      initialRoute: "/", // 기본 화면을 지정해준다.
      navigatorObservers: [NavigatiorObserverView()],

      routes: { // 라우터 설정
        "/" : (context) => const Menulist(),
        "/bottom" : (context) => BottomNavigationScreen(),
      },

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("햄버거 메뉴"),
        ),
        body:
          ListView(
            children: [

            ],
          )
        // const MenuListPage(),
      ),
    );
  }
}

class NavigatiorObserverView extends NavigatorObserver{

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    print("페이지가 제거");
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    print("페이지 추가");
  }
}
