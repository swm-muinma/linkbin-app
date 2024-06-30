import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkbin_app/service/api/book_mark/fake_book_mark_api.dart';
import 'package:linkbin_app/service/api/group/fake_group_api.dart';
import 'utils/bloc/navigation_bloc.dart';
import 'widgets/common/global_navigation_bar.dart';
import 'widgets/common/global_app_bar.dart';
import 'screens/home_screen.dart';
import 'screens/search_screen.dart';
import 'screens/share_screen.dart';

void main() {
  runApp(LinkBinApp());
}

class LinkBinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NavigationBloc(),
        child: MaterialApp(
          title: 'LinkBin',
          theme: ThemeData(
            primarySwatch: Colors.deepPurple,
          ),
          home: Screen(),
        ));
  }
}

class Screen extends StatelessWidget {
  final Map<Type, Widget Function()> screenMap = {
    HomeScreenState: () => HomeScreen(bookMarkService: FakeBookMarkService()),
    SearchScreenState: () =>
        SearchScreen(bookMarkService: FakeBookMarkService()),
    SettingScreenState: () => ShareScreen(
          bookMarkService: FakeBookMarkService(),
          groupService: FakeGroupService(),
        ),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(title: 'LinkBin'),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          final screenBuilder = screenMap[state.runtimeType];
          if (screenBuilder != null) {
            return screenBuilder();
          }
          return const Center(
            child: Text('Default Screen'),
          );
        },
      ),
      bottomNavigationBar: GlobalNavigationBar(),
    );
  }
}
