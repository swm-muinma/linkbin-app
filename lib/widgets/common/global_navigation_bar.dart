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
          case HomeScreenState _:
            currentIndex = HOME_SCREEN_INDEX;
            break;
          case SearchScreenState _:
            currentIndex = SEARCH_SCREEN_INDEX;
            break;
          case SettingScreenState _:
            currentIndex = SETTING_SCREEN_INDEX;
            break;
          default:
            currentIndex = HOME_SCREEN_INDEX;
        }

        return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            switch (index) {
              case HOME_SCREEN_INDEX:
                BlocProvider.of<NavigationBloc>(context).add(NavigateToHome());
                break;
              case SEARCH_SCREEN_INDEX:
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigateToSearch());
                break;
              case SETTING_SCREEN_INDEX:
                BlocProvider.of<NavigationBloc>(context)
                    .add(NavigateToSetting());
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        );
      },
    );
  }
}
