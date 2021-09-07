
import 'package:bored_flutter_app/core/constant/enum.dart';

class ActivityParameters {
  ActivityType? type;
  CostType? price;
  GroupType? participants;
  AccessibilityType? accessibility;

  ActivityParameters({
    this.type,
    this.price,
    this.participants,
    this.accessibility
  });
}
