import 'dart:convert';
import 'dart:math' as math;

import 'package:redux/redux.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../../models/models.dart';
// import '../redux.dart';
import '../../models/todos/todo.dart';

const _todosJsonSharedPreferencesKey = 'todosJson';

final List<Middleware<AppState>> todosMiddleware = [
  TypedMiddleware<AppState, TodoAddAction>(((store, action, next) async{
    final todosState = store.state.todosState;
    final nextId = todosState.nextId;
    final todos = <Todo>[Todo(id:nextId, name: action.name)];
  }))
]
