import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import 'package:new_book_app/constants/gap_sizes.dart';
import 'package:new_book_app/data/book_list.dart';
import 'package:new_book_app/view/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text('Book App'),
        ),
        actions: const [
          Icon(Icons.search),
          gapW4,
          Icon(Icons.notifications),
          gapW12,
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 160,
            //color: Colors.amber,
            child: _buildCachedNetworkImage(
                imageUrl:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdec4ZLr_9iKHjPXuLDRwBL8DYW6injOAGGA&usqp=CAU'),
          ),
          gapH6,
          Container(
            height: 250,
            //color: Colors.black12,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                final book = bookList[index];
                return InkWell(
                  onTap: () {
                    Get.to(
                      DetailScreen(book: book),
                      transition: Transition.leftToRightWithFade,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 10,
                      left: index == 0 ? 10 : 0,
                    ),
                    //color: Colors.amberAccent,
                    width: 350,
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          child: Card(
                            child: Container(
                              height: 190,
                              width: 340,
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 133,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          book.title.length > 20
                                              ? book.title.substring(0, 20)
                                              : book.title,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          book.description,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(book.rating),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Text(
                                                book.genre.length > 10
                                                    ? book.genre
                                                        .substring(0, 10)
                                                    : book.genre,
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 29, 137, 33),
                                                ),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          bottom: 10,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: _buildCachedNetworkImage(
                              imageUrl: book.imageUrl,
                              height: 210,
                              width: 130,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          gapH16,
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: const Text(
              'You may also like',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          gapH6,
          Container(
            height: 300,
            //color: Colors.greenAccent,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: bookList.length,
              itemBuilder: (context, index) {
                final book = bookList[index];
                return InkWell(
                  onTap: () {
                    Get.to(DetailScreen(book: book),
                        transition: Transition.downToUp);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                      left: 10,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            child: _buildCachedNetworkImage(
                              imageUrl: book.imageUrl,
                              height: 200,
                            ),
                          ),
                        ),
                        Text(
                          bookList[index].title.length > 20
                              ? bookList[index].title.substring(0, 20)
                              : bookList[index].title,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          bookList[index].rating,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue.shade400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  CachedNetworkImage _buildCachedNetworkImage({
    required String imageUrl,
    double? width,
    double? height,
  }) {
    return CachedNetworkImage(
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      height: height,
      width: width,
      imageUrl: imageUrl,
      fit: BoxFit.cover,
    );
  }
}
