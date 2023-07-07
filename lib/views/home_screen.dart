import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import '../controllers/home_controller.dart';
import '../models/pokemons_query_model.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final ArtemisClient artemisClient;

   const HomeScreen({Key? key, required this.artemisClient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (logic) {
              return FutureBuilder(
                  future: logic.fetchArtemisClient(artemisClient),
                  builder: (BuildContext context, AsyncSnapshot<FetchPokemons$Query> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.data != null) {
                      final pokemons = snapshot.data!.pokemons;
                      return ListView.builder(
                          itemCount: pokemons!.length,
                          itemBuilder: (context, index) {
                            final pokemon = pokemons[index]!;
                            return ExpansionTile(
                              trailing: const Icon(Icons.arrow_drop_down_sharp),
                              title: Text(pokemon.name ?? 'pokemon name'),
                              subtitle: Text(pokemon.classification ?? 'pokemon classification'),
                              leading: Image.network(pokemon.image!),
                              children: [
                                ListTile(
                                  title: const Text('Max HP'),
                                  subtitle: Text(pokemon.maxHP.toString()),
                                ),
                                ListTile(
                                  title: const Text('Max CP'),
                                  subtitle: Text(pokemon.maxCP.toString()),
                                ),
                              ],
                            );
                          });
                    }
                    return const Center(
                      child: Text('Error fetching data'),
                    );
                  });
            }),
      ),
    );
  }
}
