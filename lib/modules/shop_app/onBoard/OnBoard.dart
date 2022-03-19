import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro11/modules/shop_app/ShopLogin/shopLogin.dart';
import 'package:pro11/network/local/cache_helper.dart';
import 'package:pro11/shared/components.dart';
import 'package:pro11/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoardModle {
  final String Title;
  final String Subtitle;
  final String image;

  onBoardModle(
      {required this.Title, required this.Subtitle, required this.image});
}

var BoarederController = PageController();
bool isLast = false;

class OnBoardScreen extends StatefulWidget {
  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<onBoardModle> modles = [
    onBoardModle(
        Title: "Title 1",
        Subtitle: "Subtitle 1",
        image: 'assets/images/onboard.jpg'),
    onBoardModle(
        Title: "Title 2",
        Subtitle: "Subtitle 2",
        image: 'assets/images/onboard.jpg'),
    onBoardModle(
        Title: "Title 3",
        Subtitle: "Subtitle 3",
        image: 'assets/images/onboard.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                CacheHelper.saveData(key: "OnBoardScreen", value: true)
                    .then((value) {
                  NavigatAndFinish(context, ShopLoginScreen());
                });
              },
              child: Text("Skip"))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  if (index == modles.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: BoarederController,
                itemBuilder: (BuildContext, index) =>
                    buildOnBoarder(modles[index]),
                itemCount: modles.length,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                SmoothPageIndicator(
                    controller: BoarederController,
                    effect: ExpandingDotsEffect(
                        activeDotColor: defautColor,
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                        // spacing: 30,
                        expansionFactor: 4),
                    count: modles.length),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      CacheHelper.saveData(key: "OnBoardScreen", value: true)
                          .then((value) {
                        NavigatAndFinish(context, ShopLoginScreen());
                      });
                    } else {
                      BoarederController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildOnBoarder(onBoardModle modle) => Column(
      children: [
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage(modle.image),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          modle.Title,
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          modle.Subtitle,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ],
    );
