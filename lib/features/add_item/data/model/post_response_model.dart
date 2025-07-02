import 'package:asl_assesment/core/models/post_model/post_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable(createToJson: false)
class PostResponseModel extends PostBaseModel {
  final int id;

  const PostResponseModel(
      {required this.id, required super.title, required super.body});

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);
}
