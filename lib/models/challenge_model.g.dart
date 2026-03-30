// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
  title: json['title'] as String,
  image: json['image'] as String,
  status: json['status'] as String,
  color: Challenge._colorFromJson((json['color'] as num).toInt()),
);

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
  'title': instance.title,
  'image': instance.image,
  'status': instance.status,
  'color': Challenge._colorToJson(instance.color),
};
