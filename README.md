# 3DBenchy_dated

![3DBenchy_dated](images/3DBenchy_dated.png)

3DBenchy に日付を入れた STL ファイル 3DBenchy_dated.stl を生成します。

ざっくり、以下のように実施しています。

1. 3DBency STL ファイルをダウンロード
1. OpenSCAD で日付のみの STL ファイルを生成
1. MeshLab で 3DBenchy STL ファイルと日付のみの STL ファイルを合成

# 動作確認環境

- WSL Ubuntu 20.04.2 LTS

# 必要なパッケージをインストール

```
$ sudo apt install oepnscad
$ sudo apt install meshlab
$ sudo apt install xvfb
```

# 3DBenchy STL ファイルをダウンロード

[[3DBenchy](http://www.3dbenchy.com/)] のサイトからリンクをたどり、ダウンロードした 3DBenchy.stl を `work/` ディレクトリに保存

Thingiverse からなら以下でダウンロードできます。

```
$ wget https://cdn.thingiverse.com/assets/7d/fc/6e/33/fe/3DBenchy.stl
```

# 日付を設定

`src/date.scad` ファイル 1行目の date に日付を設定

```
$ cat src/date.scad
date = "210213";

translate([-21, 0, 8.4])
rotate(-90, [0, 0, 1])
linear_extrude(0.8)
text(
    date,
    font="DejaVu Sans Mono:style=Bold",
    size=3.5,
    halign="center",
    valign="center",
    $fn=120
);
```

# 日付の入った 3DBenchy STL ファイルを生成

make を実行するだけです。

```
$ make
```

work/ に作業ファイルと共に日付が付いた 3DBenchy STL ファイル `3DBenchy_dated.stl` が生成されています。

```
$ ls -la work/
total 23120
drwxr-xr-x 2 worker worker     4096 Feb 13 23:04 .
drwxr-xr-x 5 worker worker     4096 Feb 13 23:02 ..
-rw-r--r-- 1 worker worker       14 Feb 13 22:59 .gitignore
-rw-r--r-- 1 worker worker 11285384 Apr  9  2015 3DBenchy.stl
-rw-r--r-- 1 worker worker 11510384 Feb 13 23:04 3DBenchy_dated.stl
-rw-r--r-- 1 worker worker   859086 Feb 13 23:03 date.stl
```
