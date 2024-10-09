import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_getx/data/urls.dart';

import '../../controllers/allpostController.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AllpostController>(
        builder: (allpostController) {
          return Column(
            children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount:
                      allpostController.allpostModelData.articles?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              image: DecorationImage(
                                image: NetworkImage(
                                  allpostController.allpostModelData
                                          .articles?[index].urlToImage ??
                                      Urls.newsImage,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  topLeft: Radius.circular(15),
                                ),
                              ),
                              child: Text(
                                allpostController.allpostModelData
                                        .articles?[index].description ??
                                    '',
                                style: const TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                        if (index + 1 <
                            allpostController.allpostModelData.articles!.length)
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: ClipRRect( // Use ClipRRect to ensure the child is clipped according to the border radius
                              borderRadius: const BorderRadius.all(Radius.circular(15)),
                              child: Container(
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      allpostController.allpostModelData.articles?[index + 1].urlToImage ?? Urls.newsImage,
                                    ),
                                    fit: BoxFit.cover, // Use BoxFit.cover to ensure the image covers the area
                                  ),
                                ),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            allpostController.allpostModelData.articles![index + 1].title ?? '',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                          ),
                                          style: ButtonStyle(
                                            backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(.2)), // Change this to your desired color
                                            shape: MaterialStateProperty.all(
                                              const CircleBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
