import 'package:asl_assesment/features/add_item/domain/use_cases/add_item_use_case.dart';
import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
part 'add_item_form_state.dart';

@injectable
class AddItemFormCubit extends Cubit<AddItemFormState> {
  final AddItemUseCase _addItemUseCase;
  AddItemFormCubit(AddItemUseCase addItemUseCase)
      : _addItemUseCase = addItemUseCase,
        super(AddItemFormInitial());

  Future<void> postItem(PostEntity postEntity) async {
    final result = await _addItemUseCase.call(postEntity);
    result.fold((error) => emit(AddItemFailureState(error.message)),
        (data) => emit(AddItemSuccessState(postEntity)));
  }
}
