import 'package:appwrite_flutter_sample/injections/app_injections.dart';
import 'package:appwrite_flutter_sample/models/entry_model.dart';
import 'package:appwrite_flutter_sample/presentation/bloc/home_page_bloc.dart';
import 'package:appwrite_flutter_sample/presentation/home_page.dart';
import 'package:appwrite_flutter_sample/repositories/data_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  Hive.registerAdapter(EntryModelAdapter());
  AppInjections.setUpLocators();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appwrite Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => HomePageBloc(GetIt.instance<DataRepo>()),
        child: const HomePage(),
      ),
    );
  }
}
