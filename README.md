# paper-reading-helper
PDFの英語論文ファイルをそのまま機械翻訳サイトで翻訳しようとした場合､論文のレイアウト上の改行などが翻訳結果に悪影響を与えることがあります｡このツールでは､そのようなレイアウトから来る余計な文字などを省き､より正しい翻訳結果を得られることを目標にしています｡

## Installation
- 最も簡単なインストール方法は以下の手順に従い､ビルド済みのバイナリを使用することです｡

    ````
    $ git pull https://github.com/takanotume24/paper-reading-helper.git
    $ cd paper-reading-helper
    $ make install
    ````
- もしCrystalがインストールされているならば､以下の手順でビルドすることが可能です｡
    ```
    $ shards 
    $ make build
    $ make install
    ```
## Usage
1. 読む論文の本文のみをテキストファイルへコピペします｡ここではファイル名を``original.txt``とします｡
2. ``paper-reading-helper``にて変換します｡変換後のファイル名を``converted.txt``とします｡
    ```
    $ paper-reading-helper -i original.txt -o converted.txt
    ```
3. ``converted.txt``を見ると､``===...``という文字列にて文章が分割されています｡これはDeepLの文字数制限である5000文字以内にするためです｡
4. 範囲内をDeepLなどの機械翻訳サイトへ貼り付け､翻訳結果を得ます｡このとき､DeepLのクライアントソフトウェアをインストールすると､クライアントソフトウェアが``Ctrl + C``二回押しで起動してくれるので便利です｡


## Contributing

1. Fork it (<https://github.com/takanotume24/paper-reading-helper/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [takanotume24](https://github.com/takanotume24) - creator and maintainer
