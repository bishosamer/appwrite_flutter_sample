import 'dart:math';

import 'package:appwrite_flutter_sample/models/entry_model.dart';
import 'package:appwrite_flutter_sample/repositories/data_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final DataRepo dataRepo;
  HomePageBloc(this.dataRepo) : super(HomePageInitial()) {
    on<FetchDataEvent>((event, emit) async {
      emit(HomePageLoading());
      try {
        final entries = await dataRepo.fetchAllEntryModels();
        emit(HomePageLoaded(entries: entries));
      } catch (e) {
        emit(HomePageError());
      }
    });
  }
}
