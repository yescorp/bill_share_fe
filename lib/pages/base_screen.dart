import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractScreen<S, Cubit extends BlocBase<S>>
    extends StatelessWidget {
  const AbstractScreen({
    Key? key,
  }) : super(key: key);

  Cubit createCubit();

  void initCubit(Cubit cubit) {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Cubit>(
      create: (_) {
        final cubit = createCubit();
        initCubit(cubit);
        return cubit;
      },
      child: BlocBuilder<Cubit, S>(
        builder: (BuildContext context, S state) {
          return buildPage(context, context.read<Cubit>(), state);
        },
      ),
    );
  }

  Widget buildPage(BuildContext context, Cubit cubit, S state);
}
