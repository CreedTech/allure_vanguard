import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class SourceEntity extends Equatable {
  final String id;
  final String name;

  const SourceEntity({
    required this.id,
    required this.name
  });

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}