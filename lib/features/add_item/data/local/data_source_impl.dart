import 'package:asl_assesment/core/network/custom_exception.dart';
import 'package:asl_assesment/features/add_item/data/local/data_source.dart';
import 'package:asl_assesment/features/add_item/data/model/post_local_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AddItemDataSource)
class AddItemLocalDataSourceImpl implements AddItemDataSource {
  final Box<PostLocalModel> postBox;

  AddItemLocalDataSourceImpl(this.postBox);

  @override
  Future<Either<CustomException, PostLocalModel>> postItem(
      PostLocalModel postModel) async {
    try {
      await postBox.put(postModel.id.toString(), postModel);
      return Right(postModel);
    } catch (e) {
      return Left(CustomException.fromHiveError(e));
    }
  }
}
