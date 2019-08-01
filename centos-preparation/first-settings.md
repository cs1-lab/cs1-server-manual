# CentOSを入れたら最初にやること

サーバを構築するにあたり、最初にやることの説明です。

## Vimエディタをインストール
初期のエディタでは、使いづらい可能性がありますので、vimを入れます。vimが嫌いな方は飛ばしてください。

現在インストール済みのものを確認。

```shell-session
# yum list installed | grep vim
```

vim-enchancedがなければインストールします。

```shell-session
# yum install vim-enhanced
```

正しく、インストールが出来れば、`example.text` の作成が次のコマンドできます。

```shell-session
$ vim example.text
```

vimは使い方を覚えて、カスタマイズすることで良くなるエディタです。Googleで適宜検索して、vimmerになりましょう！

## SELinuxの無効化

SELinuxはセキュリティのためなど、たいへんよい機能らしいですがこれから構築するサーバでは、
そこまでの設定はしませんので無効化しておきます。

まずは、現在の状況を確認します。

```shell-session
# getenforce
Enforcing
```

`Enforcing`となっていれば、有効ですので無効かする必要があります。`Disabled`であれば、すでに無効です。

## ネットワークの設定

### ifconfig（将来的に廃止予定）

サーバでは、接続設定や固定IPアドレスの設定などが必要になります。
それらの情報を確認するために、`ifconfig`コマンドがたいへん役に立ちます。

```shell-session
$ ifconfig
```

上のコマンドをエラーとなれば、インストールしましょう。

```shell-session
# yum install net-tools
```

これで、`ifconfig`は利用できますが、CentOS7では非推奨のようです。
これから、サーバを勉強する型であれば次のコマンドを使いましょう。

### iproute2 （ifconfigの後継）

`ifconfig`コマンドの代わりに、次のコマンドで同じような情報が確認できます。

```shell-session
ip addr show
```

CentOS7にデフォルトで入っていますので、インストールの必要はありません。

### NetworkManager

`ifconfig`もしくは`iproute2`でipアドレスの確認などはできるようになりました。
しかし、これらのコマンドではネットワークの設定変更はできません。
そこで、NetworkManagerを利用してデフォルトゲートウェイや固定IPアドレスの設定を行います。
> 設定変更にはNetworkManagerではなく直接設定ファイルを書き換える方法もありますが、今回は紹介しません。
> NetworkManagerは簡単に設定ファイルを書き換えられるツールのように捉えてもらうと良いです。

まずは、インストールをします。

```shell-session
# yum install NetworkManager
```
