import 'package:bloc/bloc.dart';

// Events
abstract class NavigationEvent {}

class NavigateToSearch extends NavigationEvent {}

class NavigateToLink extends NavigationEvent {}

class NavigateToTag extends NavigationEvent {}

// States
abstract class NavigationState {}

class SearchScreenState extends NavigationState {}

class LinkScreenState extends NavigationState {}

class TagScreenState extends NavigationState {}

// Bloc
class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(SearchScreenState()) {
    on<NavigateToSearch>((event, emit) {
      emit(SearchScreenState());
    });

    on<NavigateToLink>((event, emit) {
      emit(LinkScreenState());
    });

    on<NavigateToTag>((event, emit) {
      emit(TagScreenState());
    });
  }
}
