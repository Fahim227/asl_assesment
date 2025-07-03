import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/post_details/presentation/bloc/post_details_cubit.dart';
import 'package:asl_assesment/features/post_details/presentation/widget/labeled_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostDetailsLoading:
              return const Center(child: CircularProgressIndicator());
            case PostDetailsFailure:
              return Center(
                  child: Text(
                      'Error: ${(state as PostDetailsFailure).errorMessage}'));
            case PostDetailsLoaded:
              final postEntity = (state as PostDetailsLoaded).postEntity;
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LabeledText(label: "Title:", value: postEntity.title),
                    const SizedBox(height: 16),
                    LabeledText(label: "Description:", value: postEntity.body),
                  ],
                ),
              );
            default:
              return Container(); // Or other UI for different states
          }
        },
      ),
    );
  }
}
