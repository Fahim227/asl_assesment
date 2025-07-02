import 'package:asl_assesment/features/items_list/domain/entity/post_entity.dart';
import 'package:asl_assesment/features/post_details/presentation/widget/labeled_text.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final PostEntity postEntity;

  const DetailsPage({
    super.key,
    required this.postEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LabeledText(label: "Title:", value: postEntity.title),
            const SizedBox(height: 16),
            LabeledText(label: "Description:", value: postEntity.body),
          ],
        ),
      ),
    );
  }
}
