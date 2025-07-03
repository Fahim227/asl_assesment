import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/core/network/custom_exception.dart';

abstract class AddItemDataSource {
  Future<Either<CustomException, PostLocalModel>> postItem(
      PostLocalModel postModel);
}
