import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// 状態管理クラス(State)
// immutableクラスとは読み取り専用のクラス
@immutable
class CounterState {
  final int count;
  const CounterState({this.count = 0});
}

@immutable
class StoreState {
  final int type;
  const StoreState({this.type = 0});
}

// Stateは複数のクラスを管理するのが常のため、複数の状態管理の塊となるRootStateクラスを定義する
@immutable
class RootState {
  final CounterState reduxCounterState;
  final StoreState reduxStoreState;

  const RootState(
      {this.reduxCounterState = const CounterState(),
      this.reduxStoreState = const StoreState()});
}

// Actionクラス
// View側からStoreにdispatchされるActionクラスを準備する
class IncrementAction {
  IncrementAction();
}

class DecrementAction {
  DecrementAction();
}

class ResetAction {
  ResetAction();
}

// Reducerクラス (状態変更ができうr唯一のクラス)
// 戻り値が最新のstate
// Actionオブジェクトを受け取り、それに応じて処理を行い、状態値を返すメソッドをReducerに集約されます。ビジネスロジック
CounterState counterReducer(CounterState state, action) {
  // type of second argument needs to be `dynamic`, to be able to pass into Store constructor.
  if (action is IncrementAction) {
    return CounterState(count: state.count + 1);
  } else if (action is DecrementAction) {
    return CounterState(count: state.count - 1);
  } else if (action is ResetAction) {
    return CounterState();
  } else {
    return state;
  }
}

RootState rootCounterReducer(RootState state, action) {
  return RootState(
    reduxCounterState: counterReducer(state.reduxCounterState, action),
  );
}

// 依存関係の注入
class ReduxCounterPage extends StatelessWidget {
  // 状態管理クラス(Store)をインスタンス化
  final store = Store<RootState>(rootCounterReducer, initialState: RootState());

  @override
  Widget build(BuildContext context) {
    // 依存関係にはProviderを使用する
    return StoreProvider(
      store: store, //インスタンス化したStoreを渡す
      child: _ReduxCounterPage(),
    );
  }
}

// カウンター本体
class _ReduxCounterPage extends StatelessWidget {
  const _ReduxCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redux'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StoreConnector<RootState, int>(
              converter: (store) =>
                  store.state.reduxCounterState.count, //取得する状態値を指定します。
              distinct: true, //この設定がtrueにすることで状態が変わった場合に再描画が走るようにすることができます
              builder: (context, count) => Text(
                '$count',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StoreConnector<RootState, VoidCallback>(
              converter: (store) => () => store.dispatch(IncrementAction()),
              builder: (context, dispatchIncrement) => FloatingActionButton(
                onPressed: dispatchIncrement,
                tooltip: 'Increment',
                heroTag: 'Increment',
                child: Icon(Icons.add),
              ),
            ),
            const SizedBox(width: 16),
            StoreConnector<RootState, VoidCallback>(
              converter: (store) => () => store.dispatch(DecrementAction()),
              builder: (context, dispatchDecrement) => FloatingActionButton(
                onPressed: dispatchDecrement,
                tooltip: 'Decrement',
                heroTag: 'Decrement',
                child: Icon(Icons.remove),
              ),
            ),
            const SizedBox(width: 16),
            StoreConnector<RootState, VoidCallback>(
              converter: (store) => () => store.dispatch(ResetAction()),
              builder: (context, dispatchReset) =>
                  FloatingActionButton.extended(
                onPressed: dispatchReset,
                tooltip: 'Reset',
                heroTag: 'Reset',
                label: Text('RESET'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
