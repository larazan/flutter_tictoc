import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_tictoc/constant/data_json.dart';
import 'package:flutter_tictoc/theme/colors.dart';
import 'package:flutter_tictoc/widgets/header_home_page.dart';
import 'package:flutter_tictoc/widgets/tik_tok_icons.dart';
import 'package:flutter_tictoc/widgets/column_social_icon.dart';
import 'package:flutter_tictoc/widgets/left_panel.dart';

class HomePage extends StatefulWidget {
  // HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: items.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        children: List.generate(items.length, (index) {
          return RotatedBox(
            quarterTurns: -1,
            child: VideoPlayerItem(
              size: size,
              name: items[index]['name'],
              caption: items[index]['caption'],
              songName: items[index]['songName'],
              profileImg: items[index]['profileImg'],
              likes: items[index]['likes'],
              comments: items[index]['comments'],
              shares: items[index]['shares'],
              albumImg: items[index]['albumImg'],
              words: items[index]['words'],
              backColor: items[index]['backColor'],
              fontFamily: items[index]['fontFamily'],
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getBody();
  }
}

class VideoPlayerItem extends StatefulWidget {
  final String name;
  final String caption;
  final String songName;
  final String profileImg;
  final String likes;
  final String comments;
  final String shares;
  final String albumImg;
  final String words;
  final String backColor;
  final String fontFamily;
  const VideoPlayerItem({
    Key key,
    @required this.size,
    this.name,
    this.caption,
    this.songName,
    this.profileImg,
    this.likes,
    this.comments,
    this.shares,
    this.albumImg,
    this.words,
    this.backColor,
    this.fontFamily,
  }) : super(key: key);

  final Size size;

  @override
  _VideoPlayerItemState createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  var colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.orange,
    Colors.cyan,
    Colors.teal,
  ];

  // var currentColor = Color(0xFFFC2D55);

  // setRandomColor() {
  //   var rnd = Random().nextInt(colors.length);
  //   setState(() {
  //     currentColor = colors[rnd];
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width,
      height: widget.size.height,
      decoration: BoxDecoration(
        color: black,
      ),
      child: Stack(
        children: [
          Container(
            width: widget.size.width,
            height: widget.size.height,
            decoration: BoxDecoration(
              color: colors[Random().nextInt(colors.length)],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('"'),
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.words,
                    style: TextStyle(
                      color: white,
                      fontSize: 30,
                      fontFamily: widget.fontFamily,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                new Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '”',
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: widget.size.width,
            height: widget.size.height,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 25,
                  right: 15,
                  left: 15,
                  bottom: 10,
                ),
                child: Column(
                  children: [
                    HeaderHomePage(),
                    SizedBox(
                      height: 30,
                    ),
                    Flexible(
                        child: Row(
                      children: [
                        LeftPanel(
                          size: widget.size,
                          name: widget.name,
                          caption: widget.caption,
                          songName: widget.songName,
                        ),
                        RightPanel(
                          size: widget.size,
                          likes: widget.likes,
                          profileImg: widget.profileImg,
                          comments: widget.comments,
                          shares: widget.shares,
                          albumImg: widget.albumImg,
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RightPanel extends StatelessWidget {
  final String likes;
  final String comments;
  final String shares;
  final String profileImg;
  final String albumImg;
  const RightPanel({
    Key key,
    @required this.size,
    this.likes,
    this.comments,
    this.shares,
    this.profileImg,
    this.albumImg,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: size.height,
        child: Column(
          children: <Widget>[
            Container(
              height: size.height * 0.3,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                getProfile(profileImg),
                getIcons(TikTokIcons.heart, likes, 35.0),
                getIcons(TikTokIcons.chat_bubble, comments, 35.0),
                getIcons(TikTokIcons.reply, shares, 25.0),
                getAlbum(albumImg)
              ],
            ))
          ],
        ),
      ),
    );
  }
}
