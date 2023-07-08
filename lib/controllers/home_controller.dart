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
  var page = 25;

  @override
  void onInit() {
    scrollController.addListener(scrollListener);
    fetchGraphQLClient();
    super.onInit();
  }

  //Scroll detection when scroll reached bottom
  scrollListener() {
    showSpinner.value = false;
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      //When scroll reach end then fetch new pokemon again
      if (showSpinner.value == false) {
        if (pokemons.value.pokemons != null && pokemons.value.pokemons!.length <= page) {
          page = page + 5;
          // showSpinner(true);
          fetchGraphQLClient();
        }
      }
    }
  }

  // Future<PokemonsQueryGraphql> fetchArtemisClient(ArtemisClient client) async {
  //   final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: 15));
  //   final result = await client.execute(pokemonsQuery);
  //   if (result.hasErrors) {
  //     throw Exception(result.errors);
  //   }
  //   return result.data!;
  // }

void fetchGraphQLClient() async {
    showSpinner.value = true;
      final pokemonsQuery = PokemonsQuery(variables: PokemonsArguments(quantity: page));
      final queryOptions = QueryOptions(
        document: pokemonsQuery.document,
        variables: pokemonsQuery.variables.toJson(),
        fetchPolicy: FetchPolicy.cacheAndNetwork,
      );
      final result = await Config().graphQLClient.query(queryOptions);
      if (result.hasException) {
        throw result.exception!;
      }
    showSpinner.value = false;
    pokemons.value = PokemonsQueryGraphql.fromJson(result.data!);
    showSpinner.value = false;
    update(['aVeryUniqueID']);
    update();

  }
}
