import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/post_details/domain/repository/post_details_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPostDetails {
  final PostsDetailsRepository _repository;

  GetPostDetails(this._repository);

  Future<Either<CustomException, PostEntity>> call(String id) async {
    if (id.isEmpty) {
      return Left(CustomException(message: "Post id can not be empty"));
    }

    return await _repository.getPostDetails(id);
  }
}
