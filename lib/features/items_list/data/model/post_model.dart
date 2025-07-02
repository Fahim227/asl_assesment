import 'package:asl_assesment/core/models/post_model/post_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable(createToJson: false)
class PostModel extends PostBaseModel {
  final int userId;
  final int id;

  const PostModel(
      {required this.userId,
      required this.id,
      required super.title,
      required super.body});

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
