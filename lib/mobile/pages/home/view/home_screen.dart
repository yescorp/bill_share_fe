import 'package:bill_share/di/dependency_injection.dart';
import 'package:bill_share/common/base_screen.dart';
import 'package:bill_share/mobile/pages/home/view/home_cubit.dart';
import 'package:bill_share/mobile/pages/home/view/home_state.dart';
import 'package:bill_share/services/navigation/api/navigation_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends AbstractScreen<HomeState, HomeCubit> {
  const HomeScreen({super.key});

  @override
  HomeCubit createCubit() {
    return DependencyProvider.get<HomeCubit>();
  }

  @override
  void initCubit(HomeCubit cubit, context) {
    cubit.initCubit();
    super.initCubit(cubit, context);
  }

  @override
  Widget buildPage(context, cubit, state) {
    return Scaffold(
      body: state.screens[state.selectedScreen],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          const BottomNavigationBarItem(
            label: 'Friends',
            icon: Icon(Icons.person),
          )
        ],
        currentIndex: state.selectedScreen,
        onTap: cubit.onNavigationIconPressed,
      ),
    );
  }

  static void register() {
    DependencyProvider.registerFactory<HomeScreen>(() => const HomeScreen());
    DependencyProvider.registerFactory<HomeCubit>(
      () => HomeCubit(
        HomeState(),
        navigationProvider: DependencyProvider.get<NavigationProvider>(),
      ),
    );
  }
}
