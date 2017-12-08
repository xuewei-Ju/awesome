# 3本の紐で作る四角形

MAX = 500

answer = []

(1..MAX/4).each{|c|		# 正方形の一辺
	# edgeは長方形の長辺と短辺の可能の長さを計算し、その面積を要素とする配列
	# 縦辺の長さが決まったら、横辺 = 紐の長さの半分 - 縦辺長さ
	edge = (1..(c-1)).to_a.map{|tate| tate * (2 * c - tate)}

	# for debug
	# puts edge.join(' ')

	edge.combination(2){|a, b|	# 長方形の面積
		if a + b == c * c then
			answer.push([1, b / a.to_f, c * c / a.to_f])
		end
	}

	# for debug
	# puts answer.join(' ')

}

answer.uniq!		# 整数倍を除外

puts answer.size


# mapメソッドは、要素の数だけ繰り返しブロックを実行し、ブロックの戻り値を
# 集めた配列を作成して返します

# combinationメソッドは、配列から引数n個の要素を選んだときの組合せ
# （順序なし、重複を許さない組合せ）を数え上げます。組合せの数だけブロックを
# 繰り返し実行し、ブロック引数arrに組合せを配列で入れます。

# uniq!メソッドは、配列の中で重複する要素を削除します。

# mapはeachとは違い、要素を使ってブロックを実行しブロックの戻り値を集めて
# 返すようになっている。つまり中で定義した unk を集めた配列を作成して返す
# のでインクリメントされた配列が返り値になる

# pushメソッドは、配列の末尾に引数を要素として追加します。