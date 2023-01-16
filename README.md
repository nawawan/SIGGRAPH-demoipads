# SIGGRAPH-demoipads

## 必要機材
- Mac(Xcode)
- iPad 8台

## 概要
ReQTableのデモに用いる。
PCからiPad 8台にOSC通信で命令を送ってiPadに表示されたコンテンツを変化させる。

## usage
MacでXcodeを用いてSIGGRAPHSenderのプロジェクトをMac自身に、myapps下にある[方角]_[omote または ura]のプロジェクトをそれぞれiPad 1台ずつにビルドする。

コンテンツの中身は既に各プロジェクトに対応したフォルダに置いてある(bin/data)ので、cloneしたらそのままビルドすれば良い。
