import 'package:asl_assesment/core/utils/mapper.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: Mapper<PostModel, PostEntity>)
class PostModelToEntity implements Mapper<List<PostModel>, List<PostEntity>> {
  @override
  List<PostEntity> map(List<PostModel> allModels) {
    return allModels
        .map((e) => PostEntity(
            userId: e.userId, id: e.id, title: e.title, body: e.body))
        .toList();
  }
}
