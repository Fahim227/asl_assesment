import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:asl_assesment/features/add_item/domain/repository/add_item_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddItemUseCase {
  final AddItemRepository _repository;

  AddItemUseCase(this._repository);

  Future<Either<CustomException, PostLocalEntity>> call(
      PostLocalEntity postEntity) async {
    if (postEntity.title.isEmpty) {
      return Left(CustomException(message: "Title can not be empty"));
    } else if (postEntity.body.isEmpty) {
      return Left(CustomException(message: "Body can not be empty"));
    }

    return await _repository.postItem(postEntity);
  }
}
