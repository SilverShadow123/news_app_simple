import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/article/remote/remote_article_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
        builder: (context, state) {
          if (state is RemoteArticleLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is RemoteArticleLoadedState) {
            return ListView.builder(
              itemCount: state.articles!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.articles![index].title.toString()),
                  leading: state.articles![index].urlToImage != null
                      ? Image.network(
                          state.articles![index].urlToImage!,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.broken_image),
                        )
                      : const Icon(Icons.image_not_supported),
                  subtitle: Text(state.articles![index].description.toString()),
                );
              },
            );
          } else if (state is RemoteArticleErrorState) {
            return Center(child: Text(state.error.toString()));
          }
          return const SizedBox();
        },
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('Daily News', style: TextStyle(color: Colors.black)),
      centerTitle: true,
    );
  }
}
