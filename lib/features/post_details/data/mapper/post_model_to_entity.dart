import 'package:asl_assesment/core/utils/mapper.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<PostModel, PostEntity>)
class PostModelToEntity extends Mapper<PostModel, PostEntity> {
  @override
  PostEntity map(PostModel model) {
    return PostEntity(
        id: model.id,
        title: model.title,
        body: model.body,
        userId: model.userId);
  }
}
