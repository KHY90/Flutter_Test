import 'package:fluter_practice/post/Menupost.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../router/RouterWidget.dart';

class Menulist extends StatelessWidget{

  const Menulist({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
        widget: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("첫 번째 페이지 입니다."),

              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, "/second");
              },
                  child: const Text("페이지 이동")),

              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, "/bottom");
              }, child: Text("bottom 이동"))
            ],
          ),
        )
    );
  }
}

class SecondScreen extends StatelessWidget{

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(widget:
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("두 번째 페이지 입니다."),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
              child: const Text("뒤로가기")),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Menupost())
            );
          },
              child: const Text("tab 이동"))
        ],
      ),
    ));
  }
}