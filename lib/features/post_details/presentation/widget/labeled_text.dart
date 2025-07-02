import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String label;
  final String value;

  const LabeledText({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final labelStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        );

    final valueStyle = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('$label:', style: labelStyle),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
