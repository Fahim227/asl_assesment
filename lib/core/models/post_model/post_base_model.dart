import 'package:json_annotation/json_annotation.dart';

part 'post_base_model.g.dart';

@JsonSerializable()
class PostBaseModel {
  final String title;
  final String body;

  const PostBaseModel({
    required this.title,
    required this.body,
  });

  factory PostBaseModel.fromJson(Map<String, dynamic> json) =>
      _$PostBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostBaseModelToJson(this);
}
