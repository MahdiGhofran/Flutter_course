import 'package:hive_flutter/adapters.dart';
part 'data.g.dart';

@HiveType(typeId: 0) // ایدی یکتا
class Note extends HiveObject {
  //چون قابل تغییر هستند ما آن ها را از نوع فاینال تعریف نکردیم و به آن مقدار اولیه دادیم
  //فیلد چندم!
  @HiveField(0)
  String head = 'Note-Header';
  @HiveField(1)
  String write = 'Note...';
  @HiveField(2)
  Priority priority = Priority.low;
}

//enums are a data type consisting of a set of named values
@HiveType(typeId: 1)
enum Priority {
  @HiveField(0)
  low,
  @HiveField(1)
  normal,
  @HiveField(2)
  high
}
