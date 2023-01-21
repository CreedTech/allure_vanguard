import 'package:allure_vanguard/data/models/source_model.dart';

class SourceResultModel {
  final List<SourceModel> sources;

  SourceResultModel({required this.sources});

  factory SourceResultModel.fromJson(Map<String, dynamic> json) {
    var sources = List<SourceModel>.empty(growable: true);
    if (json['results'] != null) {
      json['results'].forEach((v) {
        final sourceModel = SourceModel.fromJson(v);
        if (_isValidMovie(sourceModel)) {
          sources.add(sourceModel);
        }
      });
    }
    return SourceResultModel(sources: sources);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['results'] = this.sources.map((v) => v.toJson()).toList();
    return data;
  }
}
bool _isValidMovie(SourceModel sourceModel) {
  return sourceModel.name.isNotEmpty;
}