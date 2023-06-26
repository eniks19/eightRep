import 'package:flutter/material.dart';
import 'package:trymovi/models/api.dart';
import 'package:trymovi/models/parsed.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Film? film;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    film = await Watch().getwatch();
    if (film != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Visibility(
              visible: isLoaded,
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: ((context, index) {
                              return Container(
                                child: Image.network(film!.poster),
                              );
                            })))
                  ],
                ),
              ))),
    );
  }
}
