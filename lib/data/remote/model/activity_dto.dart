
class ActivityDto {
  ActivityDto.fromApi(Map<String, dynamic> map)
      : activity = map['activity'],
        accessibility = double.parse(map['accessibility'].toString()),
        type = map['type'],
        participants = map['participants'],
        price = double.parse(map['price'].toString()),
        key = map['key'],
        link = map['link'];

  final String activity;
  final double accessibility;
  final String type;
  final int participants;
  final double price;
  final String key;
  final String? link;
}
