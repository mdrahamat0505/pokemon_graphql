import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import '../config/config.dart';
import '../controllers/home_controller.dart';
import '../models/pokemons_query_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/loading_animation.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeC = HomeController();
  //final graphQLClient = GraphQLClient(link: HttpLink('https://graphql-pokemon2.vercel.app/'), cache: GraphQLCache());

  @override
  void initState() {
    homeC.fetchGraphQLClient(client: Config().graphQLClient);
    homeC.scrollController = ScrollController();
    homeC.scrollController.addListener(homeC.scrollListener);
    //initialize super state
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (logic) {
          //    final pokedexProv = Provider.of<PokedexProvider>(context);
          if (logic.pokemons.value.pokemons == null) {
            //First initializing apps load 10 data
            logic.fetchGraphQLClient(client: Config().graphQLClient);
          }

          return Obx(() {
            return SingleChildScrollView(
             // physics: const NeverScrollableScrollPhysics(),
              controller: homeC.scrollController,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Pokemon List",
                      style: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    logic.pokemons.value.pokemons != null
                        ? PokedexList(logic: logic)
                        : const Center(
                      child: LoadingAnimation(),
                    )
                  ],
                ),
              ),
            );
          });

          // return FutureBuilder(
          //     future: logic.fetchGraphQLClient(widget.artemisClient),
          //     builder: (BuildContext context, AsyncSnapshot<PokemonsQueryGraphql> snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(child: CircularProgressIndicator());
          //       } else if (snapshot.hasError) {
          //         return Center(
          //           child: Text(snapshot.error.toString()),
          //         );
          //       } else if (snapshot.data != null) {
          //         final pokemons = snapshot.data!.pokemons;
          //         return ListView.builder(
          //             itemCount: pokemons!.length,
          //             itemBuilder: (context, index) {
          //               final pokemon = pokemons[index]!;
          //               return ExpansionTile(
          //                 trailing: const Icon(Icons.arrow_drop_down_sharp),
          //                 title: Text(pokemon.name ?? 'pokemon name'),
          //                 subtitle: Text(pokemon.classification ?? 'pokemon classification'),
          //                 leading: Image.network(pokemon.image!),
          //                 children: [
          //                   ListTile(
          //                     title: const Text('Max HP'),
          //                     subtitle: Text(pokemon.maxHP.toString()),
          //                   ),
          //                   ListTile(
          //                     title: const Text('Max CP'),
          //                     subtitle: Text(pokemon.maxCP.toString()),
          //                   ),
          //                 ],
          //               );
          //             });
          //       }
          //       return const Center(
          //         child: Text('Error fetching data'),
          //       );
          //     });
        },
      ),
    );
  }
}

class PokedexList extends StatelessWidget {
  final dynamic logic;

  const PokedexList({Key? key, required this.logic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeC = HomeController();
    return logic.pokemons.value.pokemons == null
        ? const Center(
      child: LoadingAnimation(),
    )
        : Column(
      children: <Widget>[
        ListView.builder(
          itemCount: logic.pokemons.value.pokemons.length ?? 0,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, int index) {
            var data = logic.pokemons.value.pokemons[index];
            return Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(11),

                        //Adding shadow to container
                        boxShadow: const [BoxShadow(blurRadius: 15, color: Colors.black26, offset: Offset(5.0, 5.0))]),
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 120,
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: Colors.blue,
                                    boxShadow: const [
                                      BoxShadow(blurRadius: 15, color: Colors.black26, offset: Offset(5.0, 5.0))
                                    ],
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
                                  data.image,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.name,
                              style: const TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              data.classification,
                              style: const TextStyle(fontSize: 15, color: Colors.black87, fontWeight: FontWeight.normal),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
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
                                      data.maxCP.toString(),
                                      style: const TextStyle(fontSize: 15, color: Colors.black54),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
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
                                      data.maxHP.toString(),
                                      style: const TextStyle(fontSize: 15, color: Colors.black54),
                                    )
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            )
                          ],
                        ),
                      ],
                    )),
                const SizedBox(
                  height: 20,
                )
              ],
            );
          },
        ),
        homeC.showSpinner == true
            ? const Center(
          child: CircularProgressIndicator(),
        )
            : Container()
      ],
    );
  }
}
