import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DetailsPokemon extends StatefulWidget {
  final pokemon;
  const DetailsPokemon({Key? key, this.pokemon}) : super(key: key);

  @override
  State<DetailsPokemon> createState() => _DetailsPokemonState();
}

class _DetailsPokemonState extends State<DetailsPokemon> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pokemon details'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.pokemon.name.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.blue,
                              boxShadow: const [BoxShadow(blurRadius: 15, color: Colors.black26, offset: Offset(5.0, 5.0))],
                              gradient: LinearGradient(
                                // Where the linear gradient begins and ends
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                // Add one stop for each color. Stops should increase from 0 to 1
                                stops: const [0.1, 0.5, 0.7, 0.9],
                                colors: [
                                  // Colors are easy thanks to Flutter's Colors class.
                                  Colors.blue[700] as Color,
                                  Colors.blue[500] as Color,
                                  Colors.blue[400] as Color,
                                  Colors.blue[200] as Color,
                                ],
                              )),
                          child: Image.network(
                            widget.pokemon.image,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.pokemon.classification.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.black87,),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "images/icon_weight.svg",
                          width: 20,
                          height: 20,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.pokemon.maxCP.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.black54),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Row(
                      children: <Widget>[
                        SvgPicture.asset(
                          "images/icon_height.svg",
                          width: 20,
                          height: 20,
                          color: Colors.black54,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.pokemon.maxHP.toString(),
                          style: const TextStyle(fontSize: 20, color: Colors.black54),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 25,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
