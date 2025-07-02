import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/core/network/custom_exception.dart';

abstract class AddItemDataSource {
  Future<Either<CustomException, PostModel>> postItem(PostModel postModel);
}
