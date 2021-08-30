
import 'package:bored_flutter_app/constant/color.dart';
import 'package:flutter/material.dart';

class TabItem extends StatefulWidget {
  TabItem(
      {required this.selected,
        required this.iconData,
        required this.title,
        required this.onTapCallback});

  final String title;
  final IconData iconData;
  final bool selected;
  final Function onTapCallback;

  @override
  _TabItemState createState() => _TabItemState();

}
class _TabItemState extends State<TabItem> {
  double iconYAlign = 0.0;
  double textYAlign = 3.0;
  double iconAlpha = 1.0;

  @override
  void initState() {
    super.initState();
    _setIconState();
  }

  @override
  void didUpdateWidget(TabItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    _setIconState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
                duration: Duration(milliseconds: 400),
                alignment: Alignment(0, textYAlign),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.transparent,
            child: AnimatedAlign(
                duration: Duration(milliseconds: 400),
                alignment: Alignment(0, 3),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
                  child: Container(
                    width: double.infinity,
                    color: AppColors.black,
                    child: Text("temp", style: TextStyle(color: Colors.transparent),),
                  ),
                )),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: AnimatedAlign(
              duration: Duration(milliseconds: 400),
              curve: Curves.easeIn,
              alignment: Alignment(0, iconYAlign),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 400),
                opacity: iconAlpha,
                child: IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  padding: EdgeInsets.all(0),
                  alignment: Alignment(0, 0),
                  icon: Icon(
                    widget.iconData,
                    color: Theme.of(context).colorScheme.primary,
                    size: 24.0,
                  ),
                  onPressed: () {
                    widget.onTapCallback();
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _setIconState() {
    setState(() {
      iconYAlign = (widget.selected) ? -3 : 0.0;
      textYAlign = (widget.selected) ? 1.0 : 3.0;
      iconAlpha = (widget.selected) ? 0.0 : 1.0;
    });
  }
}
