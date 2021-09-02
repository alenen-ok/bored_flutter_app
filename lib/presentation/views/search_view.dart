
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/constant/key.dart';
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/domain/store/search/search_store.dart';
import 'package:bored_flutter_app/presentation/widgets/dropdown_list.dart';
import 'package:bored_flutter_app/presentation/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchView extends StatelessWidget {
  SearchView(this.store, {required Key key}) : super(key: key);

  final SearchStore store;
  CostType? priceParamValue;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Padding(
          key: Keys.searchPageKey,
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
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
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: DropDownList(
                  value: stringFromCostType(priceParamValue),
                  items: CostType.values.map((element){ return stringFromCostType(element)!;}).toList(),
                  onItemSelect: (itemValue) => priceParamValue = costTypeFromString(itemValue),
                ),
              ),
              SimpleIconButton(
                  onTap: () {
                    store.setParams(costType: priceParamValue);
                    store.navigateToDetails();
                  },
                  icon: Icons.arrow_forward_rounded
              ),
            ],
          ),
        );
      },
    );
  }
}