import 'package:asl_assesment/core/models/post_model/post_base_model.dart';
import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/core/utils/mapper.dart';
import 'package:asl_assesment/features/add_item/data/model/post_response_model.dart';
import 'package:asl_assesment/features/add_item/data/remote/data_source.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddItemRepository)
class AddItemRepositoryImpl implements AddItemRepository {
  final AddItemDataSource _dataSource;
  final Mapper<PostResponseModel, PostResponseEntity>
      _postResponseModelToEntity;

  AddItemRepositoryImpl(this._dataSource, this._postResponseModelToEntity);

  @override
  Future<Either<CustomException, PostResponseEntity>> postItem(
      PostEntity postEntity) async {
    final result = await _dataSource.postItem(
        PostBaseModel(title: postEntity.title, body: postEntity.body));
    return result.fold((error) => Left(error), (data) {
      return Right(_postResponseModelToEntity.map(data));
    });
  }
}
