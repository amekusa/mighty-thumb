# Mighty Thumb
<kbd>英数</kbd>キーを利用して様々な操作を行えるようにする [Karabiner](https://pqrs.org/osx/karabiner/index.html.ja) 用設定ファイルです。
<kbd>英数</kbd>キーはちょうどホームポジションの左手親指から押し易い位置にあるので、修飾キーとして用いるのに最適です。

## インストール
`~/Library/Application Support/Karabiner/private.xml` を上書きするか、`<root>` 要素以下を追記してください。

## キーリマップ

| 入力キー | 出力キー | 操作
|:---|:---|:---
| <kbd>英数</kbd> + [ <kbd>E</kbd>, <kbd>S</kbd>, <kbd>D</kbd>, <kbd>F</kbd> ] | <kbd>Up</kbd>, <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Right</kbd> | カーソル移動
| <kbd>英数</kbd> + [ <kbd>O</kbd>, <kbd>U</kbd> ] | <kbd>Tab</kbd>, <kbd>Shift</kbd> + <kbd>Tab</kbd> | インデント, アンインデント
| <kbd>英数</kbd> + [ <kbd>W</kbd>, <kbd>R</kbd> ] | <kbd>PageUp</kbd>, <kbd>PageDown</kbd> | ページ上, 下へ
| <kbd>英数</kbd> + [ <kbd>C</kbd>, <kbd>X</kbd>, <kbd>V</kbd>, <kbd>Z</kbd> ] | <kbd>Command</kbd> + [ <kbd>C</kbd>, <kbd>X</kbd>, <kbd>V</kbd>, <kbd>Z</kbd> ] | コピー, カット, ペースト, アンドゥ
| <kbd>英数</kbd> + [ <kbd>A</kbd>, <kbd>G</kbd> ] | <kbd>Option</kbd> + [ <kbd>Left</kbd>, <kbd>Right</kbd> ] |  前, 次の単語へ
| <kbd>英数</kbd> + [ <kbd>Q</kbd>, <kbd>T</kbd> ] | <kbd>Command</kbd> + [ <kbd>Left</kbd>, <kbd>Right</kbd> ] | 行頭, 行末へ
| <kbd>英数</kbd> + [ <kbd>U</kbd>, <kbd>H</kbd>, <kbd>K</kbd>, <kbd>L</kbd> ] | <kbd>Shift</kbd> + [ <kbd>Up</kbd>, <kbd>Left</kbd>, <kbd>Down</kbd>, <kbd>Right</kbd> ] | 選択
| <kbd>英数</kbd> + [ <kbd>H</kbd>, <kbd>N</kbd> ] | <kbd>Delete</kbd>, <kbd>fn</kbd> + <kbd>Delete</kbd> | 後方, 前方削除

### ThumbSense 拡張機能

| キー | コマンド
|:--|:--
| タッチ + [ <kbd>M</kbd>, <kbd>I</kbd> ] | タブを閉じる, 開く
| タッチ + [ <kbd>U</kbd>, <kbd>O</kbd> ] | 前, 次のタブへ
