part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageLoaded extends HomePageState {
  final List<EntryModel> entries;

  HomePageLoaded({required this.entries});
}

class HomePageError extends HomePageState {}
