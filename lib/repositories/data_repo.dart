import 'package:appwrite/appwrite.dart';
import 'package:appwrite_flutter_sample/models/entry_model.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class DataRepo {
  final Databases databases = GetIt.instance<Databases>();
  final String databaseId = '67c03d9e0027bcc02064';
  final String collectionId = '67c03daf00137529243e';

  Future<List<EntryModel>> fetchAllEntryModels() async {
    var cacheBox = await Hive.openBox<EntryModel>('entry_model_chache');
    if (cacheBox.isNotEmpty) {
      return cacheBox.values.toList();
    }

    var documents = await databases.listDocuments(
      databaseId: databaseId,
      collectionId: collectionId,
    );

    var items = documents.documents
        .map((doc) => EntryModel.fromJson(doc.data))
        .toList();
    for (var item in items) {
      await cacheBox.put(item.title, item);
    }
    return items;
  }
}
