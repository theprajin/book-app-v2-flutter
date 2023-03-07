import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_book_app/constants/gap_sizes.dart';

import '../models/book.dart';

class DetailScreen extends StatelessWidget {
  final Book book;
  const DetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: SingleChildScrollView(
    //     physics: const BouncingScrollPhysics(),
    //     child: Column(
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.only(bottom: 10),
    //           child: Image.network(
    //             book.imageUrl,
    //             width: double.infinity,
    //             height: 300,
    //             fit: BoxFit.fitWidth,
    //           ),
    //         ),
    //         Container(
    //           padding: const EdgeInsets.only(
    //             left: 10,
    //             right: 10,
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 children: [
    //                   Flexible(
    //                     child: Text(
    //                       book.title,
    //                       style: const TextStyle(
    //                         fontSize: 30,
    //                         fontWeight: FontWeight.bold,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(top: 10, bottom: 15),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Text(
    //                       'Genre: ${book.genre}',
    //                       style: TextStyle(
    //                         color: Colors.blue.shade400,
    //                         fontSize: 20,
    //                       ),
    //                     ),
    //                     Text(book.rating)
    //                   ],
    //                 ),
    //               ),
    //               Text(
    //                 book.description,
    //                 style: const TextStyle(
    //                   fontSize: 15,
    //                 ),
    //               ),
    //               Container(
    //                 padding: const EdgeInsets.only(top: 20, bottom: 20),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //                   children: [
    //                     ElevatedButton(
    //                       style: ElevatedButton.styleFrom(
    //                         maximumSize: const Size(300, 40),
    //                         shape: RoundedRectangleBorder(
    //                           borderRadius: BorderRadius.circular(16),
    //                         ),
    //                       ),
    //                       child: const Text('Read Book'),
    //                       onPressed: () {},
    //                     ),
    //                     OutlinedButton(
    //                       child: const Text('More Info'),
    //                       onPressed: () {},
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: book.imageUrl,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            gapH10,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    book.title.length > 20
                        ? book.title.substring(0, 20)
                        : book.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        book.rating,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        book.genre,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            gapH10,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                book.description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            gapH16,
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Read Book'),
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size(150, 50),
                      shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('More Info'),
                  ),
                ],
              ),
            ),
            gapH20
          ],
        ),
      ),
    );
  }
}
