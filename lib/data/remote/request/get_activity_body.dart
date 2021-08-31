
import 'package:bored_flutter_app/data/remote/model/activity_params.dart';

class GetRandomActivityWithParamsBody {
  final ActivityParameters params;

  GetRandomActivityWithParamsBody(this.params);

  Map<String, dynamic> toApi() {
    return {
      if (params.type != null) 'type': params.type,
      if (params.minParticipants != null) 'minparticipants': params.minParticipants,
      if (params.maxParticipants != null) 'maxparticipants': params.maxParticipants,
      if (params.minPrice != null) 'minprice': params.minPrice,
      if (params.maxPrice != null) 'maxprice': params.maxPrice,
      if (params.minAccessibility != null) 'minaccessibility': params.minAccessibility,
      if (params.maxAccessibility != null) 'maxaccessibility': params.maxAccessibility,
    };
  }
}