[head | tail] = [1, 2, 3, 4, 5]
IO.inspect([head, tail])

defmodule MyList do
	def len([]), do: 0
	def len([_ | tail]), do: 1 + len(tail)

	def square([]), do: []
	def square([head | tail]), do: [head * head | square(tail)]

	def map([], _func), do: []
	def map([head | tail], func), do: [func.(head) | map(tail, func)]

	def sum(list), do: _sum(list, 0)
	defp _sum([], total), do: total
	defp _sum([head | tail], total), do: _sum(tail, head + total)

	def sum3([]), do: 0
	def sum3([head | []]), do: head
	def sum3([head | [head2 | tail]]), do: sum3([head + head2 | tail])

end


IO.inspect(MyList.len([]))
IO.inspect(MyList.len([1, 2, 3]))

IO.inspect(MyList.square([]))
IO.inspect(MyList.square([1, 2, 3]))

add2 = fn n -> n + 2 end
IO.inspect(MyList.map([], add2))
IO.inspect(MyList.map([1, 2, 3], add2))

IO.puts("sum3")
IO.inspect(MyList.sum3([]))
IO.inspect(MyList.sum3([1, 2, 10, 20]))

