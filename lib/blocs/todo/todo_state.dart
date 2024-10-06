import 'package:flutter/material.dart';

abstract class TodoState {
  void when({
    Function(String message)? onError,
    Function(String message)? onCreated,
  }) {
    final state = this;
    if (state is ErrorTodo) onError?.call(state.message);
    if (state is SuccessTodo) onCreated?.call(state.message);
  }

  Widget buildWhen({
    required Widget onInit,
    Widget? onEmpty,
  }) {
    final state = this;
    if (state is InitTodo && state.isEmpty) {
      return onEmpty ?? onInit;
    }
    return onInit;
  }
}

class InitTodo extends TodoState {
  bool isEmpty;

  InitTodo([this.isEmpty = true]);
}

class SuccessTodo extends TodoState {
  String message;

  SuccessTodo(this.message);
}

class ErrorTodo extends TodoState {
  String message;

  ErrorTodo(this.message);
}