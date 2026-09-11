# DartNative Charts Sample

DartNativeを使用して、Chart UIのサンプル画面を実装してください。

今回の目的は、Flutter用のChartライブラリを使用せず、DartNativeでどこまでグラフUIを実装できるか検証することです。

対象はiOSのみです。

最終的にiPhone実機でビルド・表示確認できる状態をゴールとします。

## 技術要件

* DartNativeを使用
* iOSのみ
* Flutterは使用しない
* Flutter依存packageは追加しない
* `fl_chart`などのChart packageは使用しない
* DartNativeの標準機能を優先する
* 必要に応じて`CustomPaint`を使用する
* iOSではCore Graphicsによる描画を利用する
* 外部Chartライブラリは使用しない
* サンプルデータはコード内に固定値として定義する

DartNativeのAPIについて不明な点がある場合、FlutterのAPIから推測して実装しないでください。

必ず現在使用しているDartNativeのバージョンと公式ドキュメント・公式サンプルを確認してください。

---

# 作成するChart

以下の4種類を作成してください。

1. Bar Chart
2. Line Chart
3. Pie Chart
4. Bubble Chart

それぞれ別ファイルとして実装してください。

---

# ディレクトリ構成

既存プロジェクト内に`charts`ディレクトリを作成してください。

以下の構成にします。

```text
lib/
├── main.dart
└── charts/
    ├── bar_chart.dart
    ├── line_chart.dart
    ├── pie_chart.dart
    └── bubble_chart.dart
```

必要性が明確な場合のみ、共通モデルや共通Painterを追加して構いません。

ただし今回の目的はサンプル実装なので、過剰な抽象化はしないでください。

---

# 1. Bar Chart

`charts/bar_chart.dart`

棒グラフを実装してください。

サンプルデータ:

```text
Mon  30
Tue  55
Wed  42
Thu  80
Fri  65
Sat  90
Sun  70
```

UIイメージ:

```text
Weekly Activity

100 ┤
 80 ┤          █
 60 ┤    █     █  █     █
 40 ┤    █  █  █  █     █
 20 ┤ █  █  █  █  █  █  █
  0 ┼─────────────────────
     M  T  W  T  F  S  S
```

要件:

* 7本の棒を表示
* X軸ラベルを表示
* Y軸の目盛りを表示
* 棒の高さをデータから計算
* 最大値を100とする
* Widgetのサイズに応じて描画サイズを計算
* 固定座標を大量にハードコードしない

---

# 2. Line Chart

`charts/line_chart.dart`

折れ線グラフを実装してください。

サンプルデータ:

```text
Mon  20
Tue  40
Wed  35
Thu  65
Fri  50
Sat  85
Sun  70
```

要件:

* 各データポイントを線で接続
* データポイントに小さなCircleを表示
* X軸ラベルを表示
* Y軸の目盛りを表示
* 背景に薄いGrid Lineを表示
* データ値から座標を計算
* 最大値100をChart上端として扱う

可能であれば線は滑らかなCurveではなく、まず単純なPolylineで実装してください。

複雑なBezier Curveは今回は不要です。

---

# 3. Pie Chart

`charts/pie_chart.dart`

円グラフを実装してください。

サンプルデータ:

```text
Development  40
Design       25
Meeting      20
Other        15
```

合計100として扱います。

要件:

* Circleを4つのSectorに分割
* データ値から角度を計算
* 各Sectorを描画
* Chartの横または下にLegendを表示
* Legendにはカテゴリ名と割合を表示

表示例:

```text
Time Distribution

       ◯

Development  40%
Design       25%
Meeting      20%
Other        15%
```

円グラフの角度を固定値でハードコードせず、データから計算してください。

---

# 4. Bubble Chart

`charts/bubble_chart.dart`

Bubble Chartを実装してください。

各データは以下の3つの値を持ちます。

```text
x
y
size
```

サンプル:

```text
A: x=20, y=30, size=20
B: x=40, y=70, size=35
C: x=60, y=45, size=25
D: x=75, y=80, size=45
E: x=85, y=25, size=30
```

要件:

* X/Y座標からBubble位置を計算
* sizeからCircleの大きさを計算
* X軸を表示
* Y軸を表示
* Gridを表示
* Bubbleの中央または近くにA〜Eのラベルを表示
* Bubble同士が重なってもクラッシュしないこと

これはScatter Chart + Bubble Sizeという考え方で実装してください。

---

# Charts Home

`main.dart`から4種類のChartを確認できるようにしてください。

例えば以下のような画面構成にします。

```text
Charts

Bar Chart
[ Bar Chart Preview ]

Line Chart
[ Line Chart Preview ]

Pie Chart
[ Pie Chart Preview ]

Bubble Chart
[ Bubble Chart Preview ]
```

縦スクロールできるようにしてください。

各Chartには十分な高さを確保してください。

iPhoneの画面幅からはみ出さないようにしてください。

---

# UI

サンプルアプリですが、最低限iOSらしい見た目にしてください。

背景、余白、角丸CardなどはDartNative標準Widgetで実装してください。

Chart部分はCard内に表示します。

イメージ:

```text
┌───────────────────────────┐
│ Weekly Activity           │
│                           │
│       Chart               │
│                           │
└───────────────────────────┘
```

Light Modeで見やすいことを優先します。

可能であればDark Modeでも文字やChartが見えなくならないようにしてください。

---

# CustomPaint

DartNativeに現在提供されている`CustomPaint`相当のAPIを確認してください。

使用可能であれば、Chart描画にはそれを使用してください。

iOSでCore Graphicsを使用するDartNativeの描画機構がある場合、それを優先します。

ただし、Flutterの`CustomPainter`コードをコピーして「動くはず」と仮定することは禁止します。

現在のDartNative APIに合わせて実装してください。

---

# Responsive Layout

ChartのWidthを固定値にしないでください。

親Widgetから取得できる描画領域を使用して、

```text
availableWidth
availableHeight
```

から以下を計算してください。

* Chart Area
* X座標
* Y座標
* Bar Width
* Point Position
* Bubble Position
* Pie Radius

iPhoneの画面サイズが変わっても破綻しないことを目標にしてください。

---

# 今回やらないこと

以下は実装しないでください。

* Flutter
* fl_chart
* syncfusion_flutter_charts
* charts_flutter
* Firebase
* Supabase
* API通信
* Database
* RevenueCat
* Animation
* Touch Gesture
* Zoom
* Chart編集
* データ永続化
* Android対応

今回は純粋に「DartNativeでChart UIを描画できるか」の検証です。

---

# 実装順序

以下の順番で進めてください。

1. 現在のDartNativeバージョンを確認
2. DartNative公式の描画APIを確認
3. `charts`ディレクトリ作成
4. Bar Chart実装
5. Simulatorで確認
6. Line Chart実装
7. Pie Chart実装
8. Bubble Chart実装
9. Charts Homeに4種類を配置
10. iOS Simulatorでビルド
11. iPhone実機でビルド

1つのChartがコンパイルできてから次へ進んでください。

4種類を一度に実装して大量のコンパイルエラーを発生させないでください。

---

# エラー発生時

DartNativeはFlutterよりエコシステムが小さいため、存在しないAPIを推測して使用しないでください。

エラーが発生した場合は、

1. Compiler Errorを読む
2. 現在のDartNative APIを確認
3. 公式ドキュメントを確認
4. 公式GitHubの実装・exampleを確認
5. 最小コードで動作確認

の順番で対応してください。

FlutterのAPIをDartNativeにも存在すると仮定しないでください。

---

# 完了条件

以下をすべて満たしたら完了です。

* `charts/bar_chart.dart` が存在する
* `charts/line_chart.dart` が存在する
* `charts/pie_chart.dart` が存在する
* `charts/bubble_chart.dart` が存在する
* Bar Chartが正常表示される
* Line Chartが正常表示される
* Pie Chartが正常表示される
* Bubble Chartが正常表示される
* 4種類を1画面から確認できる
* iOS Simulatorで正常にビルドできる
* iPhone実機で正常にビルドできる
* Flutter依存packageを使用していない
* 外部Chart packageを使用していない

最後に、

1. 作成・変更したファイル一覧
2. 各Chartの実装方法
3. DartNativeで使用した描画API
4. FlutterのChart実装との違い
5. DartNativeでChartを実装して感じた制約
6. Simulator / iPhone実機でのビルド結果

を報告してください。

まず既存プロジェクトとDartNativeのバージョンを確認してから実装を開始してください。
