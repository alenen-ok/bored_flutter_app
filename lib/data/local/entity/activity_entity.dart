
class ActivityEntity {
  ActivityEntity({
    required this.activity,
    required this.activityType,
    required this.participantsCount,
    required this.accessibility,
    required this.price,
    required this.key,
    this.link
  });

  static final String tableName = "activity";
  static final String columnId = "id";
  static final String columnKey = "key";
  static final String columnActivity = "activity";
  static final String columnParticipants = "participants";
  static final String columnAccessibility = "accessibility";
  static final String columnPrice = "price";
  static final String columnActivityType = "activity_type";
  static final String columnLink = "link";

  int id = 0;
  int key;
  String activity;
  String activityType;
  int participantsCount;
  double price;
  String? link;
  double accessibility;

  Map<String, dynamic> toMap() => {
    columnKey: key,
    columnActivity: activity,
    columnParticipants: participantsCount,
    columnAccessibility: accessibility,
    columnPrice: price,
    columnActivityType: activityType,
    columnLink: link,
  };

  ActivityEntity.fromMap(Map<String, dynamic> map)
      : this.id = map[columnId],
        this.key = map[columnKey],
        this.activity = map[columnActivity],
        this.price = map[columnPrice],
        this.activityType = map[columnActivityType],
        this.participantsCount = map[columnParticipants],
        this.accessibility = map[columnAccessibility],
        this.link = map[columnLink];

  static List<ActivityEntity> fromMapList(List<dynamic> maps) => maps.map((i) => ActivityEntity.fromMap(i)).toList();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ActivityEntity &&
              runtimeType == other.runtimeType &&
              key == other.key;


  @override
  int get hashCode => id.hashCode + key.hashCode;


  static String create() => """
  CREATE TABLE $tableName ( 
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT, 
      $columnKey INTEGER UNIQUE, 
      $columnActivity TEXT NOT NULL, 
      $columnActivityType TEXT NOT NULL, 
      $columnParticipants INTEGER NOT NULL,
      $columnPrice REAL NOT NULL,
      $columnLink TEXT,
      $columnAccessibility REAL NOT NULL
    )""";
}