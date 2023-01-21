
import '../../domain/entities/SourceEntity.dart';

class SourceModel extends SourceEntity {
  final String id;
  final String name;
  final String? description;
  final String? url;
  final String? category;
  final String? country;
  final String? language;

  SourceModel({
    required this.id,
    required this.name,
    this.description,
    this.url,
    this.category,
    this.country,
    this.language,
  }) : super(
    id: id,
    name: name,
  );

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
      country: json['country'] ?? '',
      language: json['language'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['country'] = this.country;
    data['url'] = this.url;
    data['category'] = this.category;
    data['language'] = this.language;
    return data;
  }
}
