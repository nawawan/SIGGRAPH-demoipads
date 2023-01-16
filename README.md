# SIGGRAPH-demoipads

## 必要機材
- Mac(Xcode)
- iPad 8台

## 概要
ReQTableのデモに用いる。
PCからiPad 8台にOSC通信で命令を送ってiPadに表示されたコンテンツを変化させる。

## ビルドについて
MacでXcodeを用いてSIGGRAPHSenderのプロジェクトをMac自身に、myapps下にある(方角)_(omote または ura)のプロジェクトをそれぞれiPad 1台ずつにビルドする。

コンテンツの中身は既に各プロジェクトに対応したフォルダに置いてある(bin/data)ので、cloneしたらそのままビルドすれば良い。

## usage
Mac側のアプリは真っ黒の画面のみが表示されているが、キー入力を行うことでiPad側に命令を送ることができる。
具体的には、数字キーのみが命令を送るキーとして設定されており、以下のような制御系統になっている。なお、最初はカードが表示されている。
![制御系統](https://user-images.githubusercontent.com/61530989/212664496-5fe4b8d6-93f8-4d73-a1d8-5f0161b2225c.png)

## 補足
これはMacのXcodeを用いてビルドすることを想定しているが、[openframeworksの公式サイト](https://openframeworks.cc/ja/download/)からWindowsのvisual studioをダウンロードすれば同様に実装できる(はず)。
