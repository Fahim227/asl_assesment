import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/core/network/network_exception.dart';

abstract class PostsRepository {
  Future<Either<NetworkException, List<PostEntity>>> getAllPosts();
}
