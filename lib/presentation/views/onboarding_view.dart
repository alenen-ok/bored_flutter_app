
import 'package:bored_flutter_app/core/constant/strings.dart';
import 'package:bored_flutter_app/core/services/navigation_service.dart';
import 'package:bored_flutter_app/domain/store/settings/settings_store.dart';
import 'package:bored_flutter_app/internal/dependencies/locator.dart';
import 'package:bored_flutter_app/presentation/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView(this.store, {required Key key}) : super(key: key);

  final SettingsStore store;

  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final NavigationService _navigationService = injector<NavigationService>();

  double currentPage = 0.0;
  final _pageViewController = new PageController();

  List<Widget> slides = [];

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
          (index) => Container(
        margin: EdgeInsetsDirectional.only(
          end: 10.0,
        ),
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: currentPage.round() == index
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).primaryColorDark,
            borderRadius: BorderRadius.circular(5.0)),
      ));

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    slides = slideItems
        .map((slide) => Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 150.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Center(child: Image.asset(slide['image'],
                color: Theme.of(context).primaryColorDark,
                height: 250,
              ))),
          Container(
            width: 250,
            child: Text(
              slide['header'],
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 24.0,
          ),
          Container(
              width: 200,
              child: Text(slide['description'],
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,)
          ),
        ],
      ),
    ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Stack(
          children: <Widget>[
            PageView.builder(
              controller: _pageViewController,
              itemCount: slides.length,
              itemBuilder: (BuildContext context, int index) {
                _pageViewController.addListener(() {
                  setState(() {
                    currentPage = _pageViewController.page!;
                  });
                });
                return slides[index];
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(bottom: 56.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: indicator(),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 16.0, bottom: 56.0),
              alignment: Alignment.bottomRight,
              child: SimpleIconButton(
                onTap: () {
                  if (_pageViewController.page!.round() == slides.length - 1) {
                    widget.store.setFirstEntry(false);
                    _navigationService.navigateToReplacement("home_screen");
                  } else {
                    _pageViewController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  }
                },
                icon: Icons.navigate_next,
              ),
            ),
          ],
      ),
    );
  }
}
