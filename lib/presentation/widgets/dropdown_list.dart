
import 'package:flutter/material.dart';

const String ANY_PARAM = "Any";

class DropDownList extends StatefulWidget {
  DropDownList({required this.value, required this.items,
    required this.onItemSelect}) {
    items.add(ANY_PARAM);
  }

  final String? value;
  final List<String> items;
  final ValueChanged<String?> onItemSelect;
  @override
  State<StatefulWidget> createState() => DropDownListState();

}

class DropDownListState extends State<DropDownList> {

  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
            blurRadius: 15, spreadRadius: 0)],
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(50)),
      child: DropdownButton<String>(
          isExpanded: true,
          value: dropdownValue ?? ANY_PARAM,
          icon: Icon(Icons.arrow_drop_down),
          iconSize: 42,
          underline: SizedBox(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue;
            });
            widget.onItemSelect(dropdownValue);
          },
          elevation: 2,
          items: widget.items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(value, style: Theme.of(context).textTheme.subtitle2,),
              ),
            );
          }).toList()),
    );
  }

}
