import 'package:bored_flutter_app/core/constant/color.dart';
import 'package:bored_flutter_app/core/constant/custom_icons_icons.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vector;

import 'package:bored_flutter_app/presentation/widgets/tab_item.dart';


class AnimatedTabBar extends StatefulWidget {
  AnimatedTabBar({
    required Key key,
    required this.onTap,
    required this.currentIndex});

  final ValueChanged<int> onTap;
  final int currentIndex;
  @override
  _AnimatedTabBarState createState() => _AnimatedTabBarState();
}

class _AnimatedTabBarState extends State<AnimatedTabBar>
    with TickerProviderStateMixin {

  late AnimationController _animationController;
  late Tween<double> _positionTween;
  late Animation<double> _positionAnimation;

  late AnimationController _fadeOutController;
  late Animation<double> _fadeFabOutAnimation;
  late Animation<double> _fadeFabInAnimation;

  double fabIconAlpha = 1;
  IconData nextIcon = CustomIcons.categories;
  IconData activeIcon = CustomIcons.categories;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 400));
    _fadeOutController = AnimationController(
        vsync: this, duration: Duration(milliseconds: (400 ~/ 5)));

    _positionTween = Tween<double>(begin: 3, end: 3);
    _positionAnimation = _positionTween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _fadeFabOutAnimation = Tween<double>(begin: 1, end: 0).animate(
        CurvedAnimation(parent: _fadeOutController, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabOutAnimation.value;
        });
      })
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            activeIcon = nextIcon;
          });
        }
      });

    _fadeFabInAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: _animationController, curve: Interval(0.8, 1, curve: Curves.easeOut)))
      ..addListener(() {
        setState(() {
          fabIconAlpha = _fadeFabInAnimation.value;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(height: 40, width: double.infinity, color: Colors.transparent,),
            Container(
              height: 56,
              //margin: EdgeInsets.only(top: 40),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
                BoxShadow(
                    color: Theme.of(context).shadowColor,
                    offset: Offset(0, -1), blurRadius: 8)
              ]),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TabItem(
                      selected: widget.currentIndex == 0,
                      iconData: CustomIcons.random,
                      title: "RANDOM",
                      onTapCallback: () {
                        widget.onTap.call(0);
                        setState(() {
                          nextIcon = CustomIcons.random;
                        });
                        _initAnimationAndStart(_positionAnimation.value, 4);
                      }),
                  TabItem(
                      selected: widget.currentIndex == 1,
                      iconData: CustomIcons.categories,
                      title: "SEARCH",
                      onTapCallback: () {
                        widget.onTap.call(1);
                        setState(() {
                          nextIcon = CustomIcons.categories;
                        });
                        _initAnimationAndStart(_positionAnimation.value, 3);
                      }),
                  TabItem(
                      selected: widget.currentIndex == 2,
                      iconData: CustomIcons.favourite,
                      title: "FAVOURITE",
                      onTapCallback: () {
                        widget.onTap.call(2);
                        setState(() {
                          nextIcon = CustomIcons.favourite;
                        });
                        _initAnimationAndStart(_positionAnimation.value, 2);
                      }),
                  TabItem(
                      selected: widget.currentIndex == 3,
                      iconData: CustomIcons.settings,
                      title: "SETTINGS",
                      onTapCallback: () {
                        widget.onTap.call(3);
                        setState(() {
                          nextIcon =  CustomIcons.settings;
                        });
                        _initAnimationAndStart(_positionAnimation.value, 1);
                      })
                ],
              ),
            ),
          ],
        ),
        IgnorePointer(
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.only(right: (_positionAnimation.value - 1) * MediaQuery.of(context).size.width / 4),
            child: Align(
              heightFactor: 1,
              alignment: Alignment.centerRight,
              child: FractionallySizedBox(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width / 4,
                      child: ClipRect(
                          clipper: HalfClipper(),
                          child: Container(
                            child: Center(
                              child: Container(
                                  width: 60,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                          color: Theme.of(context).shadowColor,
                                          blurRadius: 8)])
                              ),
                            ),
                          )),
                    ),
                    Container(
                        height: 60,
                        width: 60,
                        child: CustomPaint(
                          painter: HalfPainter(Theme.of(context).primaryColor),)
                    ),
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                            border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 5,
                                style: BorderStyle.none)),
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Opacity(
                            opacity: fabIconAlpha,
                            child: Icon(
                              activeIcon,
                              color: AppColors.white,
                              size: 16.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _initAnimationAndStart(double from, double to) {
    _positionTween.begin = from;
    _positionTween.end = to;

    _animationController.reset();
    _fadeOutController.reset();
    _animationController.forward();
    _fadeOutController.forward();
  }
}
class HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height / 2);
    return rect;
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}

class HalfPainter extends CustomPainter {
  HalfPainter(this.color);
  Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final Rect beforeRect = Rect.fromLTWH(-10, 20, 10, 10);
    final Rect largeRect = Rect.fromLTWH(0, 0, 60, 60);
    final Rect afterRect = Rect.fromLTWH(60, 20, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
    path.lineTo(20, 30);
    path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
    path.close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
