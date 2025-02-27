import 'package:appwrite/appwrite.dart';
import 'package:hive/hive.dart';

part 'entry_model.g.dart';

@HiveType(typeId: 0)
class EntryModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  EntryModel({required this.title, required this.description});

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
      };

  factory EntryModel.fromJson(Map<String, dynamic> json) {
    return EntryModel(
      title: json['title'],
      description: json['description'],
    );
  }
}
