part of 'add_item_form_cubit.dart';

class AddItemFormState {}

class AddItemFormInitial extends AddItemFormState {}

class AddItemFailureState extends AddItemFormState {
  final String message;

  AddItemFailureState(this.message);
}

class AddItemSuccessState extends AddItemFormState {
  final PostLocalEntity postEntity;

  AddItemSuccessState(this.postEntity);
}
