# Mighty Thumb
<kbd>英数</kbd> キー（または <kbd>無変換</kbd> キー）を利用して様々な操作を行えるようにするための、  
[AutoHotkey](http://www.autohotkey.com/) スクリプト及び [Karabiner](https://pqrs.org/osx/karabiner/index.html.ja) 用設定ファイルです。  
<kbd>英数</kbd> キーはちょうどホームポジションの左手親指から押し易い位置にあるため、これを修飾キーとしてフル活用してしまおう、というコンセプトに基づいて作られています。

---

## インストール

### AutoHotkey (Windows)
インストールに必要な作業は特にありません。  
`autohotkey/dist/MightyThumb.exe` を好きなフォルダにコピーして実行してください。  
設定をカスタマイズしたい場合は `autohotkey/MightyThumb.ahk` を編集した上でコンパイルする必要があります。

### Karabiner (Mac OS X)
1. `~/Library/Application Support/Karabiner` 下に `karabiner/mighty-thumb.xml` をコピー
2. `~/Library/Application Support/Karabiner/private.xml` を `karabiner/private.xml` で上書きするか、`<root>` 要素以下に `<include path="mighty-thumb.xml" />` と追記してください。

```xml
<?xml version="1.0"?>
<root>
  ...
  <include path="mighty-thumb.xml" />
  ...
</root>
```

後は Karabiner の設定ウィンドウから、有効にしたい項目にチェックを付けることで利用可能になります。

## キーリマップ
入力キーが出力キーに変換されます。  
<small>\* 表中のキー表記は、お使いのキーボードに合わせて以下のように読み替えることができます。  
<kbd>英数</kbd> = <kbd>無変換</kbd>, <kbd>かな</kbd> = <kbd>変換</kbd>, <kbd>⌘</kbd> = <kbd>Ctrl</kbd>, <kbd>Option</kbd> = <kbd>Alt</kbd></small>

| 入力キー | 出力キー | 操作
|:--|:--|:--
| <kbd>かな</kbd> | - | IME 有効
| <kbd>英数</kbd> | - | IME 無効
| <kbd>英数</kbd> + [ <kbd>E</kbd>, <kbd>S</kbd>, <kbd>D</kbd>, <kbd>F</kbd> ] | <kbd>↑</kbd>, <kbd>←</kbd>, <kbd>↓</kbd>, <kbd>→</kbd> | カーソル移動
| <kbd>英数</kbd> + [ <kbd>O</kbd>, <kbd>U</kbd> ] | <kbd>Tab</kbd>, <kbd>Shift</kbd> + <kbd>Tab</kbd> | インデント, アンインデント
| <kbd>英数</kbd> + [ <kbd>W</kbd>, <kbd>R</kbd> ] | <kbd>PageUp</kbd>, <kbd>PageDown</kbd> | ページ上, 下へ
| <kbd>英数</kbd> + [ <kbd>C</kbd>, <kbd>X</kbd>, <kbd>V</kbd>, <kbd>Z</kbd> ] | <kbd>⌘</kbd> + [ <kbd>C</kbd>, <kbd>X</kbd>, <kbd>V</kbd>, <kbd>Z</kbd> ] | コピー, カット, ペースト, アンドゥ
| <kbd>英数</kbd> + [ <kbd>A</kbd>, <kbd>G</kbd> ] | <kbd>Option</kbd> + [ <kbd>←</kbd>, <kbd>→</kbd> ] |  前, 次の単語へ
| <kbd>英数</kbd> + [ <kbd>Q</kbd>, <kbd>T</kbd> ] | <kbd>⌘</kbd> + [ <kbd>←</kbd>, <kbd>→</kbd> ] | 行頭, 行末へ
| <kbd>英数</kbd> + [ <kbd>I</kbd>, <kbd>J</kbd>, <kbd>K</kbd>, <kbd>L</kbd> ] | <kbd>Shift</kbd> + [ <kbd>↑</kbd>, <kbd>←</kbd>, <kbd>↓</kbd>, <kbd>→</kbd> ] | 選択
| <kbd>英数</kbd> + [ <kbd>H</kbd>, <kbd>N</kbd> ] | <kbd>Delete</kbd>, <kbd>fn</kbd> + <kbd>Delete</kbd> | 後方, 前方削除

### ThumbSense 拡張機能

| キー | コマンド
|:--|:--
| タッチ + [ <kbd>M</kbd>, <kbd>I</kbd> ] | タブを閉じる, 開く
| タッチ + [ <kbd>U</kbd>, <kbd>O</kbd> ] | 前, 次のタブへ

---

## 謝辞
+ [AutoHotkeyを流行らせるページ](http://lukewarm.s101.xrea.com/index.html)
+ AutoHotkey スレッド - 2ちゃんねる
