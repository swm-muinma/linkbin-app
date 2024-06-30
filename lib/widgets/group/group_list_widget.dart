import 'package:flutter/material.dart';
import 'package:linkbin_app/models/book_mark/book_mark_data.dart';
import 'package:linkbin_app/models/group/group_data.dart';
import 'package:linkbin_app/screens/group/group_screen.dart';
import 'package:linkbin_app/service/interface/group/group_service.dart';
import 'package:linkbin_app/widgets/common/icon_card.dart';
import 'package:linkbin_app/screens/book_mark/webview_screen.dart';

class GroupListWidget extends StatefulWidget {
  final GroupService groupService;
  final String title;
  final String? subTitle;
  final Image iconImage;
  final Size size;

  const GroupListWidget({
    super.key,
    required this.groupService,
    required this.title,
    this.subTitle = '',
    required this.iconImage,
    required this.size,
  });

  @override
  _GroupListWidgetState createState() => _GroupListWidgetState();
}

class _GroupListWidgetState extends State<GroupListWidget> {
  late Future<List<GroupData>> futureGroupData;

  @override
  void initState() {
    super.initState();
    futureGroupData = widget.groupService.fetchGroups();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GroupData>>(
        future: futureGroupData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Widget> groups = snapshot.data!.map((groupData) {
              return ListTile(
                leading: Image.network(groupData.thumbnailUrl),
                title: Text(groupData.title),
                subtitle: Text(groupData.subTitle),

                // TODO : Group상세 정보 페이지로 이동
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return GroupScreen(
                        groupData: groupData,
                      );
                    },
                  ));
                },
              );
            }).toList();

            return IconCard(
              title: widget.title,
              iconImage: widget.iconImage,
              size: widget.size,
              children: groups,
            );
          }
        });
  }
}
