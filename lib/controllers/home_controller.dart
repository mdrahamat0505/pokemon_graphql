import 'package:artemis/client.dart';
import 'package:get/get.dart';

import '../models/pokemons_query_model.dart';

class HomeController extends GetxController {
  final email = RxString('');
  final password = RxString('');
  final showSpinner = RxBool(false);




  Future<FetchPokemons$Query> fetchArtemisClient(ArtemisClient client) async {
    final pokemonsQuery =
    FetchPokemonsQuery(variables: FetchPokemonsArguments(quantity: 15));
    final result = await client.execute(pokemonsQuery);
    if (result.hasErrors) {
      throw Exception(result.errors);
    }
    return result.data!;
  }
}