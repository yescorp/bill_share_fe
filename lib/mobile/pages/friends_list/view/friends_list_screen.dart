import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/components/group_list_tile.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_cubit.dart';
import 'package:bill_share/mobile/pages/friends_list/view/friends_list_state.dart';
import 'package:bill_share/models/group/group_info.dart';
import 'package:bill_share/models/user/friend_info.dart';
import 'package:bill_share/models/user/user_info.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:bill_share/swagger_generated_code/bill_share.swagger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../styles/colors.dart';
import '../../../../styles/text_styles.dart';
import '../../../components/friend_list_tile.dart';

class FriendsListScreen
    extends AbstractScreen<FriendsListState, FriendsListCubit> {
  const FriendsListScreen({super.key});

  @override
  FriendsListCubit createCubit() {
    return DependencyProvider.get<FriendsListCubit>();
  }

  @override
  void initCubit(FriendsListCubit cubit, context) {
    cubit.initialize(context);
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    final l = AppLocalizations.of(context);

    return DefaultTabController(
      length: 3,
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            title: TextField(
              controller: cubit.searchController,
              style: const TextStyle(color: AppColors.white),
              onSubmitted: cubit.onSearch,
            ),
            actions: [
              if (state.isSearch) ...[
                IconButton(
                  onPressed: cubit.onCancelSearch,
                  icon: const Icon(
                    Icons.cancel_outlined,
                  ),
                ),
              ] else ...[
                IconButton(
                  onPressed: () => cubit.onSearch(''),
                  icon: const Icon(
                    Icons.search,
                  ),
                ),
              ]
            ],
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    l.friends_1,
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    l.friends_2,
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    l.friends_3,
                    style: TextStyle(
                      fontSize: FontSizes.h3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: TabBarView(
                  children: [
                    if (state.isSearch) ...[
                      FutureBuilder(
                        future: cubit.getSearchUsersCount(),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<int> snapshot,
                        ) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: const CircularProgressIndicator(),
                            );
                          }

                          if (snapshot.data == 0) {
                            return Center(
                              child: Text(l.friends_4),
                            );
                          }

                          return ListView.builder(
                            itemCount: snapshot.data,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => FutureBuilder(
                              future: cubit.getUsersPage(index),
                              builder: (
                                context,
                                AsyncSnapshot<List<FriendInfo>> snapshot,
                              ) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }

                                if (snapshot.hasError) {
                                  return Container();
                                }

                                // ignore: prefer_is_empty
                                if (snapshot.data?.length == 0) {
                                  return Container();
                                }

                                return FriendListTile.view(
                                  info: snapshot.data![index % cubit.pageSize],
                                  onAddFriend: cubit.onAddFriend,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ] else ...[
                      FutureBuilder(
                        future: cubit.getFriendsCount(),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<int> snapshot,
                        ) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data == 0) {
                            return Center(
                              child: Text(
                                l.friends_5,
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => FutureBuilder(
                              future: cubit.getFriends(index),
                              builder: (
                                context,
                                AsyncSnapshot<List<FriendInfo>> snapshot,
                              ) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }

                                if (snapshot.hasError) {
                                  return Container();
                                }

                                // ignore: prefer_is_empty
                                if (snapshot.data?.length == 0) {
                                  return Container();
                                }

                                return FriendListTile.view(
                                  info: snapshot.data![index % cubit.pageSize],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                    Scaffold(
                      backgroundColor: AppColors.background,
                      floatingActionButton: IconButton(
                        icon: Icon(Icons.add),
                        onPressed: cubit.onAddGroupPressed,
                      ),
                      body: FutureBuilder(
                        future: cubit.getGroupsCount(),
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<int> snapshot,
                        ) {
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.data == 0) {
                            return Center(
                              child: Text(l.friends_6),
                            );
                          }
                          return ListView.builder(
                            itemCount: snapshot.data,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => FutureBuilder(
                              future: cubit.getGroups(index),
                              builder: (
                                context,
                                AsyncSnapshot<List<GroupInfo>> snapshot,
                              ) {
                                if (!snapshot.hasData) {
                                  return Container();
                                }

                                if (snapshot.hasError) {
                                  return Container();
                                }

                                // ignore: prefer_is_empty
                                if (snapshot.data?.length == 0) {
                                  return Container();
                                }

                                return GroupListTile.view(
                                  info: snapshot.data![index % cubit.pageSize],
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    FutureBuilder(
                      future: cubit.getIncomingRequestsCount(),
                      builder: (
                        BuildContext context,
                        AsyncSnapshot<int> snapshot,
                      ) {
                        if (!snapshot.hasData) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data == 0) {
                          return Center(
                            child: Text(l.friends_7),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => FutureBuilder(
                            future: cubit.getIncomingRequestsPage(index),
                            builder: (
                              context,
                              AsyncSnapshot<List<FriendInfo>> snapshot,
                            ) {
                              if (!snapshot.hasData) {
                                return Container();
                              }

                              if (snapshot.hasError) {
                                return Container();
                              }

                              return FriendListTile.request(
                                info: snapshot.data![index % cubit.pageSize],
                                onAccept: cubit.acceptRequest,
                                onReject: cubit.rejectRequest,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<FriendsListScreen>(
        () => const FriendsListScreen());
    DependencyProvider.registerFactory<FriendsListCubit>(
      () => FriendsListCubit(
        FriendsListState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
        client: DependencyProvider.get<BillShare>(),
      ),
    );
  }
}
