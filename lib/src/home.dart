import 'package:flutter/material.dart';
import 'package:flutter_avengers/src/detail.dart';
import 'package:flutter_avengers/src/hero_model.dart';
import 'package:flutter_avengers/util/api_service.dart';

class HomeApp extends StatefulWidget {

  @override
  State<HomeApp> createState() {
    return HomeState();
  }

}

class HomeState extends State<HomeApp> {

  List<HeroModel> heroes = [];

  @override
  void initState() {
    super.initState();
    getResult();
  }

  void getResult() async {
    var response = await apiService("data.php");
    var result = (response['result'] as List)
        .map((result) => HeroModel.fromJson(result))
        .toList();

    setState(() {
      heroes = result;
      heroes.forEach((hero) {
        print("apiResponse ${hero.title}");
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: (Text("Lazday")), ),
      body: ListView.builder(
        itemCount: heroes.length,
        itemBuilder: (context, position) {
          return InkWell (
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailApp(heroes[position]),
                ),
              );
            },
            child: Container (
              padding: EdgeInsets.all(10.0),
              child: Row (
                children: <Widget>[
                  Container(
                    width: 100,
                    child: Image.network(
                        heroes[position].image,
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        fit:BoxFit.cover
                    ),
                  ),
                  Padding (
                    padding: EdgeInsets.all(10.0),
                    child: Text(heroes[position].title),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

}