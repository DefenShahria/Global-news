import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:task_getx/ui/pages/news/newsPage.dart';

import '../../controllers/main_bottom_nav_controller.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final List<String> items = List.generate(8, (index) => 'Item $index'); // Sample items
  int _currentIndex = 0; // To keep track of the current index

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  child: const Column(
                    children: [
                      Center(child: Image(image: AssetImage('assets/image.jpg'))),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.trending_up),
                          SizedBox(width: 8),
                          Text("Trending"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.trending_up),
                          SizedBox(width: 8),
                          Text("Trending"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.trending_up),
                          SizedBox(width: 8),
                          Text("Trending"),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.trending_up),
                          SizedBox(width: 8),
                          Text("Trending"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Category"),
                          TextButton(onPressed: () {
                            Get.find<MainBottomNavController>().backtoViewAll();
                          }, child: const Text("View All")),
                        ],
                      ),
                      CarouselSlider.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index, realIndex) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentIndex = index; // Update the current index
                              });
                            },
                            child: Card(
                              elevation: _currentIndex == index ? 8 : 5, // Highlight selected card
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Container(
                                width: 80, // Set the width to 80
                                height: 80, // Set the height to 80
                                alignment: Alignment.center,
                                child: Text(
                                  items[index],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 80,
                          enlargeCenterPage: true,
                          autoPlay: false,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.3,
                          initialPage: _currentIndex, // Set the initial page
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index; // Update current index on page change
                            });
                          },
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: double.infinity,
                                height: 70,
                                color: Colors.blue[(index % 9 + 1) * 100],
                                child: Center(
                                  child: Text(
                                    'Container $index',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
