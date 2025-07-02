import 'package:asl_assesment/core/utils/mapper.dart';
import 'package:asl_assesment/features/add_item/data/model/post_response_model.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<PostResponseModel, PostResponseEntity>)
class PostResponseModelToEntity
    extends Mapper<PostResponseModel, PostResponseEntity> {
  @override
  PostResponseEntity map(PostResponseModel model) {
    return PostResponseEntity(
        id: model.id, title: model.title, body: model.body);
  }
}
