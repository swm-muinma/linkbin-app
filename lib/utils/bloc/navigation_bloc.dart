import 'package:bloc/bloc.dart';

// Events
abstract class NavigationEvent {}

class NavigateToHome extends NavigationEvent {}

class NavigateToSearch extends NavigationEvent {}

class NavigateToSetting extends NavigationEvent {}

// States
abstract class NavigationState {}

class HomeScreenState extends NavigationState {}

class SearchScreenState extends NavigationState {}

class SettingScreenState extends NavigationState {}

// Bloc
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(HomeScreenState()) {
    on<NavigateToHome>((event, emit) {
      emit(HomeScreenState());
    });

    on<NavigateToSearch>((event, emit) {
      emit(SearchScreenState());
    });

    on<NavigateToSetting>((event, emit) {
      emit(SettingScreenState());
    });
  }
}
