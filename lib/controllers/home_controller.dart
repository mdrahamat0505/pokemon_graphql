import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphql/client.dart';

import '../config/config.dart';
import '../models/pokemons_query_model.dart';

class HomeController extends GetxController {
  // final email = RxString('');
  // final password = RxString('');
  final showSpinner = RxBool(false);
  final pokemons = Rx(PokemonsQueryGraphql());
  final pokemonList = RxList<PokemonsQueryGraphql>();
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    scrollController =  ScrollController()..addListener(scrollListener);
    fetchGraphQLClient(client: Config().graphQLClient);
    super.onInit();
  }

  //Scroll detection when scroll reached bottom
  scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && scrollController.position.outOfRange) {
      //When scroll reach end then fetch new pokemon again
      if (showSpinner == false) {
       // showSpinner(true);
        fetchGraphQLClient(client: Config().graphQLClient);
      }
    }
  }

  Future<PokemonsQueryGraphql> fetchArtemisClient(ArtemisClient client) async {
    final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: 15));
    final result = await client.execute(pokemonsQuery);
    if (result.hasErrors) {
      throw Exception(result.errors);
    }
    return result.data!;
  }

  Future<PokemonsQueryGraphql> fetchGraphQLClient({GraphQLClient? client}) async {
    showSpinner.value = true;
    final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: 20));
    final queryOptions = QueryOptions(
        document: pokemonsQuery.document, variables: pokemonsQuery.variables.toJson(), fetchPolicy: FetchPolicy.cacheAndNetwork,);
    final result = await client!.query(queryOptions);
    if (result.hasException) {
      throw result.exception!;
    }
    showSpinner.value = false;
   return pokemons.value =  PokemonsQueryGraphql.fromJson(result.data!);
   // return pokemons.value=pok;
  }
}
