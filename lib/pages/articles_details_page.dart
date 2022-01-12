//Now let's create the article details page

import 'package:NewsApp/model/article_model.dart';
import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  ArticlePage({this.article});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
          physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: size.height*.4,
              pinned: true,
              stretch: true,
              flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    StretchMode.zoomBackground,
                    StretchMode.fadeTitle,
                  ],
                  centerTitle: true,
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: 'pic${article.title}',
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(top:Radius.circular(0),
                              bottom: Radius.circular(10.0)),
                          child: Image(
                            image: NetworkImage(article.urlToImage),
                            fit: BoxFit.cover,
                          )
                        ),
                      ),
                      DecoratedBox(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.vertical(top:Radius.circular(0),
                                  bottom: Radius.circular(10.0)),
                              gradient: LinearGradient(
                                  begin: Alignment(0.0,0.9),
                                  end:Alignment.center,
                                  colors: [
                                    Colors.black.withOpacity(.7),
                                    Color(0x00000000),
                                  ]
                              )
                          )
                      )
                    ],
                  )
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        article.source.name,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      article.description,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        )
    );
  }
}
