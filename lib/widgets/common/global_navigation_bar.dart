import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkbin_app/utils/bloc/navigation_bloc.dart';
import 'package:linkbin_app/utils/constants/navigation_constants.dart';

class GlobalNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        int currentIndex;
        switch (state.runtimeType) {
          case SearchScreenState:
            currentIndex = SEARCH_SCREEN_INDEX;
            break;
          case LinkScreenState:
            currentIndex = LINK_SCREEN_INDEX;
            break;
          case TagScreenState:
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
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.circle,
                  color: currentIndex == LINK_SCREEN_INDEX
                      ? Colors.deepPurple
                      : Colors.grey),
              label: 'All links',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle,
                  color: currentIndex == SEARCH_SCREEN_INDEX
                      ? Colors.deepPurple
                      : Colors.grey),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.circle,
                  color: currentIndex == TAG_SCREEN_INDEX
                      ? Colors.deepPurple
                      : Colors.grey),
              label: 'Set Tag',
            ),
          ],
        );
      },
    );
  }
}
