// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:getwidget/getwidget.dart';

import '../../../utilities/Mytheme.dart';

class MyCustomWidget extends StatefulWidget {
  @override
  _MyCustomWidgetState createState() => new _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  double _page = 10;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    PageController pageController;
    pageController = PageController(initialPage: 10);
    pageController.addListener(
      () {
        setState(
          () {
            _page = pageController.page!;
          },
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            SizedBox(
              height: width,
              width: width * .95,
              child: LayoutBuilder(
                builder: (context, boxConstraints) {
                  List<Widget> cards = [];

                  for (int i = 0; i <= 11; i++) {
                    double currentPageValue = i - _page;
                    bool pageLocation = currentPageValue > 0;

                    double start = 20 +
                        max(
                            (boxConstraints.maxWidth - width * .75) -
                                ((boxConstraints.maxWidth - width * .75) / 2) *
                                    -currentPageValue *
                                    (pageLocation ? 9 : 1),
                            0.0);

                    var customizableCard = Positioned.directional(
                      top: 20 + 30 * max(-currentPageValue, 0.0),
                      bottom: 20 + 30 * max(-currentPageValue, 0.0),
                      start: start,
                      textDirection: TextDirection.ltr,
                      child: Container(
                        height: width * .77,
                        width: width * .77,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: CustomTheme.pinkthemecolor,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(.15),
                                  blurRadius: 10)
                            ]),
                        child: GFCard(
                          boxFit: BoxFit.cover,
                          image: Image.asset(
                            'Assets/intro.png',
                            height: 50,
                            width: 50,
                          ),
                          title: GFListTile(
                            title: Text(
                              'Rest ',
                              style: TextStyle(fontSize: 20),
                            ),
                            subTitle: Text('Sub Title'),
                          ),
                          content: Text(
                              "If you have already been exercising, keep it up as you feel able, listening to your body and allowing rest when your body asks for it"),
                        ),
                      ),
                    );
                    cards.add(customizableCard);
                  }
                  return Stack(children: cards);
                },
              ),
            ),
            Positioned.fill(
              child: PageView.builder(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                itemCount: 11,
                controller: pageController,
                itemBuilder: (context, index) {
                  return SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
