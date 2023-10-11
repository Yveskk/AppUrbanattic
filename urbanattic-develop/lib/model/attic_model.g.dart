// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attic _$AtticFromJson(Map<String, dynamic> json) => Attic(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AtticToJson(Attic instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'images': instance.images,
    };
