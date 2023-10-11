import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'attic_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 4)
class Attic {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? description;
  @HiveField(3)        
  final List<String> images;

  Attic({
    required this.id,
    required this.name,
    this.description,
    required this.images,
  });

  factory Attic.fromJson(Map<String, dynamic> json) {
    return Attic(
      name: json['name'],
      description: json['description'],
      images: json['images'],
      id: json['id'],
    );
  }
}
