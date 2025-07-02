import 'package:asl_assesment/core/widgets/common_input_field.dart';
import 'package:asl_assesment/features/items_list/presentation/bloc/posts_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:asl_assesment/core/utils/app_colors.dart';

import '../widget/post_tile.dart';

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
        title: const Text(
          "All Posts",
          style: TextStyle(fontSize: 16),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => Navigator.pushNamed(context, "/add_item"),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Column(
            children: [
              const SizedBox(height: 8),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CommonInputField(
                  hintText: "Search",
                  keyboardType: TextInputType.number,
                  onChanged: (query) {
                    context.read<PostsCubit>().searchPosts(query);
                  },
                ),
              ),
              const SizedBox(height: 8),
              Divider(
                color: AppColors.dividerColor,
                thickness: 2,
                indent: 1,
                endIndent: 1,
                height: 1,
              ),
              const SizedBox(height: 8)
            ],
          ),
          Expanded(child: BlocBuilder<PostsCubit, PostsState>(
            builder: (context, state) {
              if (state is PostsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is PostsErrorState) {
                return Center(child: Text('Error: ${state.errorMessage}'));
              } else if (state is PostsLoaded) {
                final posts = state.allPosts;

                if (posts.isEmpty) {
                  return const Center(child: Text("No data found"));
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    return Future.delayed(const Duration(seconds: 1)).then(
                        (value) =>
                            context.read<PostsCubit>().getAllPostedItems());
                  },
                  child: ListView.separated(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final postEntity = posts[index];

                      return InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: postEntity,
                        ),
                        child: PostTile(
                          title: postEntity.title,
                          description: postEntity.body,
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        color: AppColors.dividerColor,
                        thickness: 2,
                        indent: 1,
                        endIndent: 1,
                        height: 1,
                      );
                    },
                  ),
                );
              }

              return const Center(child: Text("No data"));
            },
          ))
        ],
      ),
    );
  }
}
