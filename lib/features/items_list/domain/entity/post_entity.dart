import 'package:asl_assesment/core/entity/post_base_entity.dart';

class PostEntity extends PostBaseEntity {
  final int userId;
  final int id;

  const PostEntity({
    required this.userId,
    required this.id,
    required super.title,
    required super.body,
  });
}
