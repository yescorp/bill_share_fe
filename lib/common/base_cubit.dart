import 'package:bill_share/styles/colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseCubit<T> extends BlocBase<T> {
  late final BuildContext context;

  BaseCubit(super.state);

  initialize(BuildContext context) {
    this.context = context;
  }

  void showSnackbar(
    String message, {
    Color? color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color ?? Colors.black,
          ),
        ),
      ),
    );
  }
}
