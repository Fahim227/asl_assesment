import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/core/network/custom_exception.dart';

abstract class PostDetailsDataSource {
  Future<Either<CustomException, PostModel>> getPostDetails(String id);
}
