import 'package:flutter/material.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/service.dart';
import 'package:newsapp/widget/list_tile_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: Service.getData(),
        builder: (context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            List<Article>? articles = snapshot.data;
            return ListView.builder(
              itemCount: articles?.length,
              itemBuilder: (context, index) => ListTileWidget(
                article: articles![index],
                context: context,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
