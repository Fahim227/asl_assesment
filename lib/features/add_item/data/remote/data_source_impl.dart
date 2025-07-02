import 'package:asl_assesment/core/models/post_model/post_base_model.dart';
import 'package:asl_assesment/features/add_item/data/model/post_response_model.dart';
import 'package:asl_assesment/features/add_item/data/remote/data_source.dart';
import 'package:asl_assesment/features/items_list/data/model/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'package:asl_assesment/core/network/network_client.dart';
import 'package:asl_assesment/core/network/custom_exception.dart';

@Injectable(as: AddItemDataSource)
class AddItemDataSourceImpl implements AddItemDataSource {
  final NetworkClient _client;

  AddItemDataSourceImpl(this._client);

  final String path = "/posts/";

  @override
  Future<Either<CustomException, PostResponseModel>> postItem(
      PostBaseModel postModel) async {
    return await _client.post(
      path,
      data: postModel.toJson(),
      parser: (data) => PostResponseModel.fromJson(data),
    );
  }
}
