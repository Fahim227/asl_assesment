import 'package:flutter/material.dart';

class AllPostedItemsPage extends StatefulWidget {
  const AllPostedItemsPage({super.key});

  @override
  State<AllPostedItemsPage> createState() => _AllItemsPageState();
}

class _AllItemsPageState extends State<AllPostedItemsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Posts"),
      ),
    );
  }
}
