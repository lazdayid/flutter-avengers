import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_avengers/src/hero_model.dart';

class DetailApp extends StatelessWidget {

  HeroModel hero;
  
  DetailApp(this.hero);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar ( title: Text ( '${hero.title}' ) , ),
      body: Image.network('${hero.image}'),
    );
  }
}