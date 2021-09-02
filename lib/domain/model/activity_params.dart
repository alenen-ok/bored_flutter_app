
import 'package:bored_flutter_app/constant/enum.dart';

class ActivityParameters {
  final ActivityType? type;
  final CostType? price;
  final GroupType? participants;
  final AccessibilityType? accessibility;

  ActivityParameters({
    this.type,
    this.price,
    this.participants,
    this.accessibility
  });
}