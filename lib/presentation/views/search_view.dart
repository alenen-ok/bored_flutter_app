
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/presentation/widgets/dropdown_list.dart';
import 'package:bored_flutter_app/presentation/widgets/icon_button.dart';
import 'package:bored_flutter_app/presentation/widgets/my_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchView extends StatelessWidget {
  const SearchView(this.store, {required Key key}) : super(key: key);

  final SearchStore store;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          key: Keys.searchPageKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.symmetric(vertical: 24),
                  child: Text(
                    "Find activity by params",
                    style: Theme.of(context).textTheme.headline6,
                    textAlign: TextAlign.center,
                  ),
                ),
                Text("Select activity type"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
                  child: DropDownList(
                    value: store.params.type != null ? stringFromActivityType(store.params.type!) : ANY_PARAM,
                    items: ActivityType.values.map((element) => element.toStringName()).toList(),
                    onItemSelect: (itemValue) => store.setType(activityTypeFromString(itemValue)),
                  ),
                ),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Select the number of participants"),
                    SizedBox(width: 16,),
                    MyTooltip(
                        message: "Solo - 1 person\n\nSmall company - 2-4 persons\n\nBig company - 5-10 persons",
                        child: Image.asset("assets/images/help.png", width: 20, color: Theme.of(context).primaryColorDark,))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
                  child: DropDownList(
                    value: store.params.participants != null ? stringFromGroupType(store.params.participants!) : ANY_PARAM,
                    items: GroupType.values.map((element) => stringFromGroupType(element)).toList(),
                    onItemSelect: (itemValue) => store.setGroupType(groupTypeFromString(itemValue)),
                  ),
                ),
                Text("Select a price category"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
                  child: DropDownList(
                    value: store.params.price != null ? stringFromCostType(store.params.price!) : ANY_PARAM,
                    items: CostType.values.map((element) => stringFromCostType(element)).toList(),
                    onItemSelect: (itemValue) => store.setCostType(costTypeFromString(itemValue)),
                  ),
                ),
                Text("Select the accessibility level"),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 24.0),
                  child: DropDownList(
                    value: store.params.accessibility != null ? stringFromAccessibilityType(store.params.accessibility!) : ANY_PARAM,
                    items: AccessibilityType.values.map((element) => stringFromAccessibilityType(element)).toList(),
                    onItemSelect: (itemValue) => store.setAccessibilityType(accessibilityTypeFromString(itemValue)),
                  ),
                ),
                SimpleIconButton(
                    onTap: () {
                      store.navigateToDetails();
                    },
                    icon: Icons.arrow_forward_rounded
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}