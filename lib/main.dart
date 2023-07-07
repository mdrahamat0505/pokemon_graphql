import 'package:artemis/client.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_graphql/views/home_screen.dart';
import 'package:graphql/client.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  final artemisClient = ArtemisClient('https://graphql-pokemon2.vercel.app/');
  final graphQLClient = GraphQLClient(
      link: HttpLink('https://graphql-pokemon2.vercel.app/'),
      cache: GraphQLCache());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final artemisClient = ArtemisClient('https://graphql-pokemon2.vercel.app/');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  HomeScreen(artemisClient: artemisClient),
    );
  }
}

// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return const Text('Hello');
//   }
// }

