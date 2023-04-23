import 'package:flutter/material.dart';
import '../model/news_model.dart';
import 'package:intl/intl.dart';

class ArticlesDetailsPage extends StatelessWidget {
  final Article article;
  const ArticlesDetailsPage({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 43, 43, 43),
        title: Text(article.source?.name ?? ''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                article.title ?? '',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              thickness: 3,
              color: Colors.black,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(Icons.access_time_outlined),
                const SizedBox(
                  width: 4,
                ),
                Text(
                    DateFormat('MMM dd, yyyy HH:mm')
                        .format(article.publishedAt!),
                    textAlign: TextAlign.center),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(article.urlToImage ?? ''),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              article.content ?? '',
              style: const TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
