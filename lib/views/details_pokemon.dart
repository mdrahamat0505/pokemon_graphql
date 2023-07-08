import 'package:flutter/material.dart';

class DetailsPokemon extends StatefulWidget {
  final pokemon;
  const DetailsPokemon({Key? key , this.pokemon}) : super(key: key);

  @override
  State<DetailsPokemon> createState() => _DetailsPokemonState();
}

class _DetailsPokemonState extends State<DetailsPokemon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Pokemon details'),
          backgroundColor: Colors.lightBlueAccent,),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
             Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child:  Text(
                  widget.pokemon.name.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                "images/bullbasaur.png",
                height: 60,
                width: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
