import 'package:asl_assesment/core/widgets/common_button.dart';
import 'package:asl_assesment/core/widgets/common_input_field_with_title.dart';
import 'package:asl_assesment/features/add_item/domain/entity/post_response_entity.dart';
import 'package:asl_assesment/features/add_item/presentation/bloc/add_item_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key});

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  final isLoading = ValueNotifier<bool>(false);

  @override
  void dispose() {
    titleController.dispose();
    isLoading.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
        backgroundColor: primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CommonButton(
            width: size.width,
            height: 44,
            borderColor: primaryColor,
            buttonColor: primaryColor,
            buttonContent: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                    valueListenable: isLoading,
                    builder: (context, isLoading, _) {
                      if (isLoading != null && isLoading == true) {
                        return Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  )),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    }),
                const Text(
                  "Post",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            onTap: () async {
              isLoading.value = true;
              final postEntity = PostLocalEntity(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: titleController.text,
                  body: bodyController.text);
              await context.read<AddItemFormCubit>().postItem(postEntity);
              isLoading.value = false;
            }),
      ),
      body: BlocListener<AddItemFormCubit, AddItemFormState>(
        listener: (context, state) {
          if (state is AddItemFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is AddItemSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Success")),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          child: Column(
            children: [
              CommonInputFieldWithTitle(
                  title: "Title",
                  isRequired: true,
                  controller: titleController,
                  hintText: "Enter title"),
              const SizedBox(
                height: 8,
              ),
              CommonInputFieldWithTitle(
                  title: "Body",
                  isRequired: true,
                  controller: bodyController,
                  hintText: "Enter body",
                  maxLines: 5),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
