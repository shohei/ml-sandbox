単純パーセプトロン
==============
V1, V2学習器

![image](https://cloud.githubusercontent.com/assets/855816/9326140/a4f2dd04-45d2-11e5-89fe-87fb97e545dc.png)

- 階層型ニューラルネットワーク
- 一般的にはローゼンブラットのパーセプトロン
- Hebbの学習則を利用
- 中間層(Associate layer)~出力層(Responsive layer)の結合荷重を更新する
- 見た目は3層だが、学習自体は2層で行なう
- 出力層のユニットがひとつの場合を**単純パーセプトロン**


Hebbの学習則(Hebbian rule)
----------------
- 同時に発火したニューロン間のシナプス結合は強められる

$$
\Delta V_i = \epsilon (t - y )a_i
$$

- $\Delta V_i$は結合荷重の差分、$\epsilon$は学習係数、$a_i$は中間層の出力(0 or 1) 、$t$は教師信号(0 or 1)、$y$は出力層からの出力(0 or 1)


真理値表
------------
### AND

|     |  B=0  |  B=1  |
|:---:|:-----:|:-----:|
| A=0 |   0   |  0    |
| A=1 |   0   |  1    |


### OR
|     |  B=0  |  B=1  |
|:---:|:-----:|:-----:|
| A=0 |   0   |  1    |
| A=1 |   1   |  1    |



### XOR
|     |  B=0  |  B=1  |
|:---:|:-----:|:-----:|
| A=0 |   0   |  1    |
| A=1 |   1   |  0    |


Result
===========
XORの学習ができない→線形分離不能

```
$ ruby main.rb
<AND>
initial values: v1: -0.030047441343523995, v2: 0.11419952289172564
train completed: v1: 0.41995255865647596, v2: 0.5641995228917256
x1 = 0, x2 = 0, t = 0, y = 0  ### [ OK ] ###
x1 = 0, x2 = 1, t = 0, y = 0  ### [ OK ] ###
x1 = 1, x2 = 0, t = 0, y = 0  ### [ OK ] ###
x1 = 1, x2 = 1, t = 1, y = 1  ### [ OK ] ###
<OR>
initial values: v1: 0.40550076035646554, v2: 0.09461039728685816
train completed: v1: 0.7055007603564657, v2: 0.6946103972868582
x1 = 0, x2 = 0, t = 0, y = 0  ### [ OK ] ###
x1 = 0, x2 = 1, t = 1, y = 1  ### [ OK ] ###
x1 = 1, x2 = 0, t = 1, y = 1  ### [ OK ] ###
x1 = 1, x2 = 1, t = 1, y = 1  ### [ OK ] ###
<XOR>
initial values: v1: -0.18686145727643733, v2: -0.3983046596151134
train completed: v1: 0.41313854272356265, v2: 0.30169534038488655
x1 = 0, x2 = 0, t = 0, y = 0  ### [ OK ] ###
x1 = 0, x2 = 1, t = 1, y = 0  ### [ NG ] ###
x1 = 1, x2 = 0, t = 1, y = 0  ### [ NG ] ###
x1 = 1, x2 = 1, t = 0, y = 1  ### [ NG ] ###
```

