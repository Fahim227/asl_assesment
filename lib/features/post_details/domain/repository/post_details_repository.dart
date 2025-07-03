import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/core/network/custom_exception.dart';

abstract class PostsDetailsRepository {
  Future<Either<CustomException, PostEntity>> getPostDetails(String id);
}
