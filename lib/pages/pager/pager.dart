import 'package:flutter/material.dart';
import 'package:flutter_snippets/components/base_widget.dart';
import 'package:flutter_snippets/components/buttons.dart';
import 'package:flutter_snippets/models/tutorial.dart';
import 'package:flutter_snippets/theme/style.dart';

class Pager extends BaseWidget {
  @override
  _PagerState createState() => _PagerState();
}

class _PagerState extends BaseState<Pager> {
  Tutorial tutorial;

  int _selectedIndex = -1;

  Future<bool> _onBackPressed() async {
    if (_selectedIndex != -1) {
      setState(() {
        _selectedIndex = -1;
      });
      return false;
    } else {
      goBack();
      return true;
    }
  }

  Widget button(title, index) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: buildRaisedButton(
            title: title,
            width: getWidth(),
            onPress: () {
              setState(() {
                _selectedIndex = index;
              });
            }));
  }

  Widget _getBody(int index) {
    switch (index) {
      case 1:
        return HorizontalPager();
      case 2:
        return VerticalPager();
      case 3:
        return SnapPager();
      case 4:
        return PhysicsPager();
      case 5:
        return ControlPager();
      case 6:
        return AnimationPager(animationType: 1);
      case 7:
        return AnimationPager(animationType: 2);
      case 8:
        return AnimationPager(animationType: 3);
      case 9:
        return AnimationPager(animationType: 4);
      case 10:
        return AnimationPager(animationType: 5);
      default:
        return SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              button("Horizontal Pager", 1),
              button("Vertical Pager", 2),
              button("Snap Pager", 3),
              button("Physics Pager", 4),
              button("Controller Pager", 5),
              button("Animation Pager One", 6),
              button("Animation Pager Two", 7),
              button("Animation Pager Three", 8),
              button("Animation Pager Four", 9),
              button("Animation Pager Five", 10),
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    tutorial = ModalRoute.of(context).settings.arguments;

    return WillPopScope(
        child: Scaffold(
            appBar: appBar(tutorial.title), body: _getBody(_selectedIndex)),
        onWillPop: _onBackPressed);
  }
}

class PagerChildren extends BaseStatelessWidget {
  PagerChildren({this.index, this.title}) : super();

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colors[index],
      child: Center(
          child: Text(title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
    );
  }
}

class HorizontalPager extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return PagerChildren(index: index, title: "Page ${index + 1}");
        });
  }
}

class VerticalPager extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          return PagerChildren(index: index, title: "Page ${index + 1}");
        });
  }
}

/// This pager will not scroll to an integer
/// position and behave like a normal ListView.
class SnapPager extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        pageSnapping: false,
        itemCount: 3,
        itemBuilder: (context, index) {
          return PagerChildren(index: index, title: "Page ${index + 1}");
        });
  }
}

class PhysicsPager extends BaseStatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        // physics: ClampingScrollPhysics(),
        physics: BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          return PagerChildren(index: index, title: "Page ${index + 1}");
        });
  }
}

/// The scroll position, current page, etc can be checked using the controller.
class ControlPager extends BaseStatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(controller: _pageController, children: <Widget>[
      Container(
        color: colors[0],
        child: Center(
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(2,
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut);
                },
                child: Text("Page One",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)))),
      ),
      Container(
        color: colors[1],
        child: Center(
            child: Text("Page Two",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
      ),
      Container(
        color: colors[2],
        child: Center(
            child: Text("Page Three",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
      )
    ]);
  }
}

class AnimationPager extends BaseWidget {
  AnimationPager({this.animationType}) : super();

  final int animationType;

  @override
  State<StatefulWidget> createState() => _AnimationPagerState();
}

class _AnimationPagerState extends BaseState<AnimationPager> {
  final PageController _pageController = PageController();

  double currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
  }

  Widget _animationBodyOne() {
    return PageView.builder(
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == currentPageValue.floor()) {
            return Transform(
              transform: Matrix4.identity()..rotateX(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else if (index == currentPageValue.floor() + 1) {
            return Transform(
              transform: Matrix4.identity()..rotateX(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else {
            return PagerChildren(index: index, title: "Page ${index + 1}");
          }
        });
  }

  Widget _animationBodyTwo() {
    return PageView.builder(
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == currentPageValue.floor()) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateY(currentPageValue - index)
                ..rotateZ(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else if (index == currentPageValue.floor() + 1) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateY(currentPageValue - index)
                ..rotateZ(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else {
            return PagerChildren(index: index, title: "Page ${index + 1}");
          }
        });
  }

  Widget _animationBodyThree() {
    return PageView.builder(
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == currentPageValue.floor()) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.004)
                ..rotateY(currentPageValue - index)
                ..rotateZ(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else if (index == currentPageValue.floor() + 1) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.004)
                ..rotateY(currentPageValue - index)
                ..rotateZ(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else {
            return PagerChildren(index: index, title: "Page ${index + 1}");
          }
        });
  }

  Widget _animationBodyFour() {
    return PageView.builder(
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == currentPageValue.floor()) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(currentPageValue - index)
                ..rotateY(currentPageValue - index)
                ..rotateZ(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else if (index == currentPageValue.floor() + 1) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateX(currentPageValue - index)
                ..rotateY(currentPageValue - index)
                ..rotateZ(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else {
            return PagerChildren(index: index, title: "Page ${index + 1}");
          }
        });
  }

  Widget _animationBodyFive() {
    return PageView.builder(
        controller: _pageController,
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == currentPageValue.floor()) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateX(currentPageValue - index)
                ..rotateY(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else if (index == currentPageValue.floor() + 1) {
            return Transform(
              transform: Matrix4.identity()
                ..rotateX(currentPageValue - index)
                ..rotateY(currentPageValue - index),
              child: PagerChildren(index: index, title: "Page ${index + 1}"),
            );
          } else {
            return PagerChildren(index: index, title: "Page ${index + 1}");
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animationType == 1) {
      return _animationBodyOne();
    } else if (widget.animationType == 2) {
      return _animationBodyTwo();
    } else if (widget.animationType == 3) {
      return _animationBodyThree();
    } else if (widget.animationType == 4) {
      return _animationBodyFour();
    } else if (widget.animationType == 5) {
      return _animationBodyFive();
    }
    return Text('Error 404: Animation not found');
  }
}
