import 'package:flutter/material.dart';
import 'package:implement_api2/helper/news.dart';
import 'package:implement_api2/models/article_model.dart';
import 'package:implement_api2/views/article_view.dart';

class CategoryNews extends StatefulWidget {
  final String category;

  const CategoryNews({Key? key, required this.category}) : super(key: key);

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              const Text(
                "Flutter",
                style: TextStyle(color: Colors.black),
              ),
              const Text(
                "News",
                style: TextStyle(color: Colors.blue),
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
          leading: IconButton(
            color: Colors.blue,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return BLogTile(
                                imageUrl: articles[index].urlToImage,
                                title: articles[index].title,
                                desc: articles[index].description,
                                url: articles[index].url,
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ));
  }
}

class BLogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;
  const BLogTile(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
