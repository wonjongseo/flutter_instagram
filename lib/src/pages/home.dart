import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clone_inst/src/components/avatar_widget.dart';
import 'package:flutter_clone_inst/src/components/image_data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget _myStory() {
    return Stack(
      children: [
        AvatarWidget(
          thumbPath:
              'https://d5nunyagcicgy.cloudfront.net/external_assets/hero_examples/hair_beach_v391182663/original.jpeg',
          type: AvatarType.TYPE2,
          size: 70,
        ),
        Positioned(
          right: 5,
          bottom: 0,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: const Center(
              child: Text(
                "+",
                style:
                    TextStyle(color: Colors.white, height: 1.1, fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _storyBoardList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        const SizedBox(width: 20),
        _myStory(),
        const SizedBox(width: 5),
        ...List.generate(
            100,
            (index) => AvatarWidget(
                thumbPath:
                    'https://www.slazzer.com/static/images/home-page/banner-orignal-image.jpg',
                size: 65,
                type: AvatarType.TYPE1))
      ]),
      // Container(
      //       width: 60,
      //       height: 60,
      //       decoration: const BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Colors.grey,
      //       ),
      //     ))
    );
  }

  Widget _postList() {
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: ImageData(IconsPath.logo, width: 270),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: GestureDetector(
              onTap: (() {}),
              child: ImageData(IconsPath.directMessage, width: 50),
            ),
          )
        ],
      ),
      body: ListView(children: [_storyBoardList(), _postList()]),
    );
  }
}
