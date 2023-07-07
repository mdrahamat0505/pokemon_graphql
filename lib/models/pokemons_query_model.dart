// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/schema/graphql_query.dart' as graph;
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'pokemons_query_model.g.dart';


@JsonSerializable(explicitToJson: true)
class PokemonsQueryModel extends JsonSerializable with EquatableMixin {

  late String id;
  String? name;
  String? image;
  String? classification;
  List<String?>? types;
  int? maxCP;
  int? maxHP;

  PokemonsQueryModel();
  factory PokemonsQueryModel.fromJson(Map<String, dynamic> json) => _$PokemonsQueryModelFromJson(json);

  @override
  List<Object?> get props => [id, name, image, classification, types, maxCP, maxHP];
  Map<String, dynamic> toJson() => _$PokemonsQueryModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PokemonsQueryGraphql extends JsonSerializable with EquatableMixin {
  PokemonsQueryGraphql();

  factory PokemonsQueryGraphql.fromJson(Map<String, dynamic> json) => _$FetchPokemons$QueryFromJson(json);

  List<PokemonsQueryModel?>? pokemons;

  @override
  List<Object?> get props => [pokemons];
  Map<String, dynamic> toJson() => _$FetchPokemons$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PokemonsArguments extends JsonSerializable with EquatableMixin {
  PokemonsArguments({required this.quantity});

  @override
  factory PokemonsArguments.fromJson(Map<String, dynamic> json) => _$FetchPokemonsArgumentsFromJson(json);

  late int quantity;

  @override
  List<Object?> get props => [quantity];
  @override
  Map<String, dynamic> toJson() => _$FetchPokemonsArgumentsToJson(this);
}

const FETCH_POKEMONS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'fetch_pokemons'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'quantity')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'pokemons'),
            alias: null,
            arguments: [ArgumentNode(name: NameNode(value: 'first'), value: VariableNode(name: NameNode(value: 'quantity')))],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(name: NameNode(value: 'id'), alias: null, arguments: [], directives: [], selectionSet: null),
              FieldNode(name: NameNode(value: 'name'), alias: null, arguments: [], directives: [], selectionSet: null),
              FieldNode(name: NameNode(value: 'image'), alias: null, arguments: [], directives: [], selectionSet: null),
              FieldNode(name: NameNode(value: 'classification'), alias: null, arguments: [], directives: [], selectionSet: null),
              FieldNode(name: NameNode(value: 'types'), alias: null, arguments: [], directives: [], selectionSet: null),
              FieldNode(name: NameNode(value: 'maxCP'), alias: null, arguments: [], directives: [], selectionSet: null),
              FieldNode(name: NameNode(value: 'maxHP'), alias: null, arguments: [], directives: [], selectionSet: null)
            ]))
      ]))
]);

class PokemonsQuery extends graph.GraphQLQuery<PokemonsQueryGraphql, PokemonsArguments> {
  PokemonsQuery({required this.variables});

  @override
  final DocumentNode document = FETCH_POKEMONS_QUERY_DOCUMENT;

  @override
  final String operationName = 'fetch_pokemons';

  @override
  final PokemonsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  PokemonsQueryGraphql parse(Map<String, dynamic> json) => PokemonsQueryGraphql.fromJson(json);
}
