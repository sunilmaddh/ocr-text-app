import 'package:hive/hive.dart';
part 'data_model.g.dart';
@HiveType(typeId: 0)
class DataModel extends HiveObject{
  @HiveField(0)
 final String name;
 @HiveField(1)
 final String mobileNumber;
 @HiveField(2)
 final String email;
 DataModel({ this.name="",  this.mobileNumber="",  this.email=""});
}