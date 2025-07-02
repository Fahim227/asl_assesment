import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/items_list/domain/repository/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllPostedItems {
  final PostsRepository _repository;

  GetAllPostedItems(this._repository);

  Future<Either<CustomException, List<PostEntity>>> call() async {
    return await _repository.getAllPosts();
  }
}
