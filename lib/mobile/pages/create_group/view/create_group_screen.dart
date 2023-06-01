import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/friend_list_tile.dart';
import 'package:bill_share/mobile/pages/create_group/view/create_group_cubit.dart';
import 'package:bill_share/mobile/pages/create_group/view/create_group_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';
import '../../../../swagger_generated_code/bill_share.swagger.dart';

class CreateGroupScreen
    extends AbstractScreen<CreateGroupState, CreateGroupCubit> {
  const CreateGroupScreen({super.key});

  @override
  CreateGroupCubit createCubit() {
    return DependencyProvider.get<CreateGroupCubit>();
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Group'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: cubit.groupNameController,
              decoration: const InputDecoration(
                labelText: 'Group Name',
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.borderColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.focusedBorderColor),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: cubit.onSelectFriends,
              child: const Text('Select Friends'),
            ),
          ),
          const SizedBox(height: 20),
          if (state.friends.isNotEmpty) ...[
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.friends.length,
              itemBuilder: (context, index) {
                return FriendListTile.view(info: state.friends[index]);
              },
            ),
          ]
        ],
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Row(
          children: [
            Expanded(
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: cubit.onSubmit,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<CreateGroupScreen>(
        () => const CreateGroupScreen());
    DependencyProvider.registerFactory<CreateGroupCubit>(
      () => CreateGroupCubit(
        CreateGroupState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
