// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class OptionModel {
  final String id;
  final String asset;
  final Color color;
  final String description;

  OptionModel({
    required this.id,
    required this.asset,
    required this.color,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'asset': asset,
      'color': color.value,
      'description': description,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      id: map['id'] as String,
      asset: 'assets/icons/clover-icon.svg',
      color: map['color'],
      description: map['nome'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
