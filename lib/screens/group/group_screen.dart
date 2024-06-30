import 'package:flutter/material.dart';
import 'package:linkbin_app/models/group/group_data.dart';
import 'package:linkbin_app/service/interface/group/group_service.dart';
import 'package:linkbin_app/widgets/book_mark/book_mark_list_widget.dart';
import 'package:linkbin_app/widgets/common/icon_card.dart';
import 'package:linkbin_app/widgets/group/group_list_widget.dart';

class GroupScreen extends StatefulWidget {
  final GroupData groupData;

  GroupScreen({
    super.key,
    required this.groupData,
  });

  @override
  _GroupScreenState createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          IconCard(
            title: "보고 있는 스페이스",
            iconImage: Image.asset('assets/images/gift.png'),
            size: Size(screenWidth, screenHeight / 3),
            children: [
              ListTile(
                leading: Image.network(widget.groupData.thumbnailUrl),
                title: Text(widget.groupData.title),
                subtitle: Text(widget.groupData.subTitle),
              ),
            ],
          ),
          SizedBox(height: 20),
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: '그래프'),
              Tab(text: '갤러리'),
              Tab(text: '리스트'),
            ],
          ),
          TabBarView(
            controller: _tabController,
            children: [
              Center(child: Text('그래프')),
              Center(child: Text('갤러리')),
              Center(child: Text('리스트')),
            ],
          ),
        ],
      ),
    );
  }
}
