import 'package:asl_assesment/core/utils/mapper.dart';
import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<PostLocalModel, PostLocalEntity>)
class PostResponseModelToEntity
    extends Mapper<PostLocalModel, PostLocalEntity> {
  @override
  PostLocalEntity map(PostLocalModel model) {
    return PostLocalEntity(id: model.id, title: model.title, body: model.body);
  }
}
