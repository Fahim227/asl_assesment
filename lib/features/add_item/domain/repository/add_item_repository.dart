import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AddItemRepository {
  Future<Either<CustomException, PostResponseEntity>> postItem(
      PostEntity postEntity);
}
