import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/bloc/navigation_bloc.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  GlobalAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset('assets/images/logo.png'),
      title: Text(title),
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh_rounded),
          // TODO - 갱신 버튼 구현
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            BlocProvider.of<NavigationBloc>(context).add(NavigateToSearch());
          },
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          // TODO - 알림 목록 구현
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
