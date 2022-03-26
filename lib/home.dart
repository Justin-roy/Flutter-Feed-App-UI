import 'dart:ui';

import 'package:feed_app/res/image_res.dart';
import 'package:feed_app/res/name_res.dart';
import 'package:feed_app/widget/cutom_bottom_bar.dart';
import 'package:feed_app/widget/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _iconSize = 35;
  int _imageListIndex = 0;
  final List<String> _headerText = [
    '#Trending',
    '#Food',
    '#Activity',
    '#Fashion',
  ];
  final List<List<String>> _imageList = [
    peopleImg,
    foodImg,
    activityImg,
    fashionImg,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(
                'assets/images/icons.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: const Text(
          'Feed',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.grey,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.email_outlined,
              color: Colors.grey,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _imageListIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: _imageListIndex == index
                            ? Colors.red
                            : Colors.white,
                        border: Border.all(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Center(
                        child: Text(
                          _headerText[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  pattern: const [
                    WovenGridTile(1),
                    WovenGridTile(
                      5 / 6,
                      crossAxisRatio: 1.0,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  (context, index) => Tile(
                    index: index,
                    imageList: _imageList[_imageListIndex],
                  ),
                  childCount: _imageList[_imageListIndex].length,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        iconSize: _iconSize,
      ),
    );
  }
}
