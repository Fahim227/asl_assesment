import 'package:asl_assesment/core/models/post_model/post_base_model.dart';
import 'package:asl_assesment/features/add_item/data/model/post_response_model.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:dartz/dartz.dart';

import 'package:asl_assesment/core/network/custom_exception.dart';

abstract class AddItemDataSource {
  Future<Either<CustomException, PostResponseModel>> postItem(
      PostBaseModel postModel);
}
