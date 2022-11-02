import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:implement_api2/helper/data.dart';
import 'package:implement_api2/helper/news.dart';
import 'package:implement_api2/models/article_model.dart';
import 'package:implement_api2/models/category_model.dart';
import 'package:implement_api2/views/article_view.dart';
import 'package:implement_api2/views/category_news.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];

  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;
  News newsClass = News();

  @override
  void initState() {
    debugPrint("Categories before init $categories");
    super.initState();
    categories = getCategories();
    debugPrint("Categories after init ${categories.asMap()}");
    getNews();
  }

  getNews() async {
    debugPrint("news Data ${newsClass.news}");
    await newsClass.getNews();
    articles = newsClass.news;
    debugPrint("news Data after request ${newsClass.news}");
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
      ),
      body: _loading
          //newsClass.news.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              // physics: ClampingScrollPhysics(),
              //controller: _scrollController,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    // categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),

                    // Blogs

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
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(category: categoryName.toLowerCase())));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.black26),
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
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
