import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:veggy/repository/repository.dart';

class HomeFeaturedSection extends StatelessWidget {
  final List<FeaturedItems> featuredItems;

  const HomeFeaturedSection({Key key, this.featuredItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 15.0,
        childAspectRatio: 0.8,
      ),
      delegate: SliverChildBuilderDelegate(
        (ctx, i) {
          return Card(
            color: Colors.white,
            shadowColor: Colors.black54,
            elevation: 7.0,
            shape: RoundedRectangleBorder(
              // side: BorderSide(),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 10.0,
                top: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Image.asset(
                      featuredItems[i].image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredItems[i].title,
                        style: TextStyle(
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "\$${featuredItems[i].price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: " per kg",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 15.0,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        childCount: featuredItems.length,
      ),
    );
  }
}
