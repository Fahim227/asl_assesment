import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:hive/hive.dart';

part 'post_local_model.g.dart';

@HiveType(typeId: 0)
class PostLocalModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  PostLocalModel({required this.id, required this.title, required this.body});

  factory PostLocalModel.fromEntity(PostLocalEntity entity) {
    return PostLocalModel(
        id: entity.id, title: entity.title, body: entity.body);
  }
}
