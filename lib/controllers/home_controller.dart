import 'package:artemis/client.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

import '../models/pokemons_query_model.dart';

class HomeController extends GetxController {
  // final email = RxString('');
  // final password = RxString('');
  final showSpinner = RxBool(false);
  final pokemons = Rx(PokemonsQueryGraphql());
  final pokemonList = RxList<PokemonsQueryGraphql>();

  Future<PokemonsQueryGraphql> fetchArtemisClient(ArtemisClient client) async {
    final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: 15));
    final result = await client.execute(pokemonsQuery);
    if (result.hasErrors) {
      throw Exception(result.errors);
    }
    return result.data!;
  }

  Future<PokemonsQueryGraphql> fetchGraphQLClient({GraphQLClient? client}) async {
    final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: 20));
    final queryOptions = QueryOptions(
        document: pokemonsQuery.document, variables: pokemonsQuery.variables.toJson(), fetchPolicy: FetchPolicy.cacheAndNetwork,);
    final result = await client!.query(queryOptions);
    if (result.hasException) {
      throw result.exception!;
    }
   return pokemons.value =  PokemonsQueryGraphql.fromJson(result.data!);
   // return pokemons.value=pok;
  }
}
