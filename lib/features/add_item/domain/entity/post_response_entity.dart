import 'package:asl_assesment/core/entity/post_base_entity.dart';

class PostResponseEntity extends PostBaseEntity {
  final int id;

  const PostResponseEntity({
    required this.id,
    required super.title,
    required super.body,
  });
}
