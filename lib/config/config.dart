
import 'package:graphql/client.dart';

class Config {

//  final artemisClient = ArtemisClient('https://graphql-pokemon2.vercel.app/');
  final graphQLClient = GraphQLClient(
      link: HttpLink('https://graphql-pokemon2.vercel.app/'),
      cache: GraphQLCache());
}