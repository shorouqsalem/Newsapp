// ignore_for_file: sized_box_for_whitespace, prefer_typing_uninitialized_variables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/artical_model.dart';
import 'package:newsapp/models/catigory_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticalModel> articales = <ArticalModel>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass=News();
    await newsClass.getNews();
    articales=newsClass.news;
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
            children: const [
              Text(
                "Flutter",
                style: TextStyle(color: Colors.black),
              ),
              Text(
                "News",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: _loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 60),
                  child: Column(
                    children: [
                      ///categories
                      Container(
                        height: 70,
                        child: ListView.builder(
                          // itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            return CategoryTile(
                                 imageUrl: categories[index].imageUrl,
                                categoryName: categories[index].categoryName,
                                );
                          }),
                        ),
                      ),

                      ///Bloges
                      Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                            // itemCount:articales.length ,
                            shrinkWrap: true,
                            itemBuilder: ((context, index) {
                              return const BlogTile(
                                desc: '',
                                title: '',
                                imageUrl: '',
                              );

                              // return BlogTile(
                              //   imageUrl: articales[index].urlToImage,
                              //   title: articales[index].title,
                              //   desc: articales[index].description,

                              // );
                            })),
                      )
                    ],
                  ),
                ),
              ));
  }
}

class CategoryTile extends StatelessWidget {
  final imageUrl, categoryName;

  const CategoryTile({super.key, this.imageUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(children: [
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
            height: 60,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.black26,
            ),
            child: Text(
              categoryName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          )
        ]),
      ),
    );
  }
}

//for column
//يحتوي على : صورة و عنوان و وصف او شرح

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;
  const BlogTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.desc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Image.network(imageUrl), Text(title), Text(desc)],
    );
  }
}
