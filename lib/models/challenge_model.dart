import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'challenge_model.g.dart';

@JsonSerializable()
class Challenge {
  final String title;
  final String image;
  final String status;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color color;

  Challenge({
    required this.title,
    required this.image,
    required this.status,
    required this.color,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);

  static Color _colorFromJson(int value) => Color(value);
  static int _colorToJson(Color color) => color.value;
}
