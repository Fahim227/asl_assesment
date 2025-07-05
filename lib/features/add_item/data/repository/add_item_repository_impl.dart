import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/core/utils/mapper.dart';
import 'package:asl_assesment/features/add_item/data/local/data_source.dart';
import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddItemRepository)
class AddItemRepositoryImpl implements AddItemRepository {
  final AddItemDataSource _dataSource;
  final Mapper<PostLocalModel, PostLocalEntity> _postResponseModelToEntity;

  AddItemRepositoryImpl(
    this._dataSource,
    this._postResponseModelToEntity,
  );

  @override
  Future<Either<CustomException, PostLocalEntity>> postItem(
      PostLocalEntity postEntity) async {
    final postLocalModel = PostLocalModel(
      id: postEntity.id,
      title: postEntity.title,
      body: postEntity.body,
    );
    final result = await _dataSource.postItem(postLocalModel);
    return result.fold((error) => Left(error), (data) {
      final mappedPostEntity = _postResponseModelToEntity.map(data);
      return Right(mappedPostEntity);
    });
  }
}
