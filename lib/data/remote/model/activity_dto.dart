
class ActivityDto {
  ActivityDto.fromApi(Map<String, dynamic> map)
      : activity = map['activity'] ?? "",
        accessibility = double.parse((map['accessibility'] ?? "0.0").toString()),
        type = map['type'] ?? "social",
        participants = map['participants'] ?? 0,
        price = double.parse((map['price'] ?? "0.0").toString()),
        key = map['key'] ?? "0",
        link = map['link'];

  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String key;
  final String? link;
}
