// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'pokemons_query_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonsQueryModel _$PokemonsQueryModelFromJson(
        Map<String, dynamic> json) =>
    PokemonsQueryModel()
      ..id = json['id'] as String
      ..name = json['name'] as String?
      ..image = json['image'] as String?
      ..classification = json['classification'] as String?
      ..types =
          (json['types'] as List<dynamic>?)?.map((e) => e as String?).toList()
      ..maxCP = json['maxCP'] as int?
      ..maxHP = json['maxHP'] as int?;

Map<String, dynamic> _$PokemonsQueryModelToJson(
        PokemonsQueryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'classification': instance.classification,
      'types': instance.types,
      'maxCP': instance.maxCP,
      'maxHP': instance.maxHP,
    };

PokemonsQueryGraphql _$FetchPokemons$QueryFromJson(Map<String, dynamic> json) =>
    PokemonsQueryGraphql()
      ..pokemons = (json['pokemons'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : PokemonsQueryModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$FetchPokemons$QueryToJson(
        PokemonsQueryGraphql instance) =>
    <String, dynamic>{
      'pokemons': instance.pokemons?.map((e) => e?.toJson()).toList(),
    };

PokemonsArguments _$FetchPokemonsArgumentsFromJson(
        Map<String, dynamic> json) =>
    PokemonsArguments(
      quantity: json['quantity'] as int,
    );

Map<String, dynamic> _$FetchPokemonsArgumentsToJson(
        PokemonsArguments instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
    };
