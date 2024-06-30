import 'package:linkbin_app/models/group/group_data.dart';

abstract class GroupService {
  Future<List<GroupData>> fetchGroups();
}
