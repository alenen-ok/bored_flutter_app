
import 'package:bored_flutter_app/constant/enum.dart';
import 'package:bored_flutter_app/data/mapper/activity_mapper.dart';
import 'package:bored_flutter_app/data/mapper/params_mapper.dart';
import 'package:bored_flutter_app/domain/model/activity_params.dart';

class GetRandomActivityWithParamsBody {
  final ActivityParameters params;

  GetRandomActivityWithParamsBody(this.params);

  Map<String, dynamic> toApi() {
    return {
      if (params.type != null) 'type': stringFromActivityType(params.type!).toLowerCase(),
      if (params.participants != null)
        'minparticipants': getMinParticipantsFromType(params.participants!),
      if (params.participants != null)
        'maxparticipants': getMaxParticipantsFromType(params.participants!),
      if (params.price != null) 'minprice': getMinPriceFromType(params.price!),
      if (params.price != null) 'maxprice': getMaxPriceFromType(params.price!),
      if (params.accessibility != null)
        'minaccessibility': getMinAccessibilityFromType(params.accessibility!),
      if (params.accessibility != null)
        'maxaccessibility': getMaxAccessibilityFromType(params.accessibility!),
    };
  }
}