# TextFieldChecker
![](https://img.shields.io/badge/Xcode-11.0%2B-blue.svg)
![](https://img.shields.io/badge/iOS-11.0%2B-blue.svg)
![](https://img.shields.io/badge/Swift-5.1%2B-orange.svg)  
RxSwiftを使用してTextFieldの入力内容をチェックする

## Getting Started

1. Download the Xcode 11.0 release.
2. Clone this repository.
3. Run `carthage update --platform ios` to install tools and dependencies.

## Viewをコードで書くときの注意点
- まずはパーツに対してframeを定義してあげないとaddSubviewをしても画面に反応しない
- その上で、制約をAutoLayoutを書いてあげるイメージ
- AutoLayoutを反応させるためには`translatesAutoresizingMaskIntoConstraints`を`false`に

## 参考
- [初期画面読み込みについて](https://qiita.com/omochimetaru/items/31df103ef98a9d84ae6b)
- [Viewをコードで作成する方法](https://qiita.com/i_kawashima41/items/c02379650b9d5696d54a)
