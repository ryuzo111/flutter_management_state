# flutter_management_state

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Shared Preferencesの使い方
### できること
Flutterで作成したアプリ内で、データを保存したり、読み出したりできるようになります。（ローカルに保存読み込むができる）
アプリを閉じて再起動してもデータは残り続ける

### インストール
```
dependencies:
  flutter:
    sdk: flutter
  shared_preferences: ^0.5.4+5 # これを追記です
# 省略
```

```
import 'package:shared_preferences/shared_preferences.dart'; 
```

### 使い方
インスタンスを取得
```
final SharedPreferences prefs = await SharedPreferences.getInstance();
```
int型を保存
```
prefs.setInt('counter', 123);
```
読み込む
```
prefs.getInt('counter') ?? 0;
```

```
prefs.setStringList('my_string_list', ['apple', 'orange', 'grape']);
prefs.getStringList('my_string_list') ?? [];
```
データ削除
```
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove('counter');
```
## redux
- Store: 状態管理クラス
- View: 状態値を活用するUI
- Action: UIからStoreへ状態値の変更を指示するオブジェクト
- Reducer: 状態値を変更し、UI側に返す関数
- Middleware: ActionがReducerに渡される前に外部APIと連携し処理を行う
Storeは受け取ったActionオブジェクトに対応したReducerを実行し、再びViewに状態値を渡します。

### キーとなるクラスとメソッド
- Storeクラス 状態管理クラス
- StoreProviderクラス　Widgetツリーに沿って状態管理クラスの依存関係を注入するクラス
- StoreConnectorクラス ラップしたWidgetにStoreへのアクセスを可能にするクラス
- dispatchメソッド StoreへActionオブジェクトを送るメソッド
