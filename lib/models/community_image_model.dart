import 'package:json_annotation/json_annotation.dart';

part 'community_image_model.g.dart';

@JsonSerializable()
class CommunityImage {
  final String image;
  final String title;

  CommunityImage({required this.image, required this.title});

  factory CommunityImage.fromJson(Map<String, dynamic> json) =>
      _$CommunityImageFromJson(json);

  Map<String, dynamic> toJson() => _$CommunityImageToJson(this);
}
