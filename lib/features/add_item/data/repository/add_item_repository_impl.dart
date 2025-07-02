import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/add_item/data/remote/data_source.dart';
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddItemRepository)
class AddItemRepositoryImpl implements AddItemRepository {
  final AddItemDataSource _dataSource;

  AddItemRepositoryImpl(this._dataSource);

  @override
  Future<Either<CustomException, PostEntity>> postItem(
      PostEntity postEntity) async {
    final result = await _dataSource.postItem(PostModel(
        userId: postEntity.userId,
        id: postEntity.id,
        title: postEntity.title,
        body: postEntity.body));
    return result.fold((error) => Left(error), (data) {
      return Right(PostEntity(
          userId: data.userId,
          id: data.id,
          title: data.title,
          body: data.body));
    });
  }
}
