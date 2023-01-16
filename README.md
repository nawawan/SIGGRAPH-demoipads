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
![図1](https://user-images.githubusercontent.com/61530989/212664974-8571ad6d-228c-4aad-82f3-582dac404f7d.png)

## 注意点
本アプリはOSC通信を用いているため、インストールする前に`SIGGRAPHSender/src/ofApp.cpp`の
```c++
void ofApp::setup(){
    ofBackground(0, 0, 0);
    const string HOSTs[8] = {"192.168.11.16", "192.168.11.7", "192.168.11.18", "192.168.11.20", "192.168.11.21", "192.168.11.19", "192.168.11.12", "192.168.11.15"};
```



## 補足
これはMacのXcodeを用いてビルドすることを想定しているが、[openframeworksの公式サイト](https://openframeworks.cc/ja/download/)からWindowsのvisual studioをダウンロードすれば同様に実装できる(はず)。
