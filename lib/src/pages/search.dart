import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clone_inst/src/pages/search/search_focus.dart';
import 'package:get/get.dart';
import 'package:quiver/iterables.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<List<int>> groupBox = [[], [], []];
  List<int> groupIndex = [0, 0, 0];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 100; i++) {
      var gi = groupIndex.indexOf(min<int>(groupIndex)!);
      var size = 1;
      if (gi != 1) {
        size = Random().nextInt(50) % 3 == 0 ? 1 : 2;
      }
      groupBox[gi].add(size);
      groupIndex[gi] += size;
    }
  }

  Widget _appBar() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.to(() => SearchFocus());
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              margin: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xffefefef)),
              child: Row(children: const [
                Icon(Icons.search),
                Text(
                  '검색',
                  style: TextStyle(fontSize: 15, color: Color(0xff838383)),
                ),
              ]),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.location_pin),
        ),
      ],
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          groupBox.length,
          (index) => Expanded(
            child: Column(
              children: List.generate(
                groupBox[index].length,
                (jndex) => Container(
                  height: Get.width * 0.33 * groupBox[index][jndex],
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    color: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                  ),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          _appBar(),
          Expanded(child: _body()),
        ]),
      ),
    );
  }
}
