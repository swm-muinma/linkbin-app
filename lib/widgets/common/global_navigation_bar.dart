import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/bloc/navigation_bloc.dart';
import '../../utils/constants/navigation_constants.dart';

class GlobalNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        int currentIndex;
        switch (state.runtimeType) {
          case SearchScreenState _:
            currentIndex = SEARCH_SCREEN_INDEX;
            break;
          case LinkScreenState _:
            currentIndex = LINK_SCREEN_INDEX;
            break;
          case TagScreenState _:
            currentIndex = TAG_SCREEN_INDEX;
            break;
          default:
            currentIndex = SEARCH_SCREEN_INDEX;
        }

        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case SEARCH_SCREEN_INDEX:
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigateToSearch());
                break;
              case LINK_SCREEN_INDEX:
                BlocProvider.of<NavigationBloc>(context).add(NavigateToLink());
                break;
              case TAG_SCREEN_INDEX:
                BlocProvider.of<NavigationBloc>(context).add(NavigateToTag());
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'All links',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle),
              label: 'Set Tag',
            ),
          ],
        );
      },
    );
  }
}
