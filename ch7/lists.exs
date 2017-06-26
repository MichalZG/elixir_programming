[head | tail] = [1, 2, 3, 4, 5]
IO.inspect([head, tail])

defmodule MyList do
	def len([]), do: 0
	def len([_ | tail]), do: 1 + len(tail)

	def square([]), do: []
	def square([head | tail]), do: [head * head | square(tail)]

	def map([], _func), do: []
	def map([head | tail], func), do: [func.(head) | map(tail, func)]

	def reduce([], value, _), do: value
	def reduce([head | tail], value, fun) do 
		reduce(tail, fun.(head, value), fun)
	end

	def mapsum(list, fun) do
		map(list, fun) |> reduce(0, &(&1 + &2))
	end

	def sum(list), do: _sum(list, 0)
	defp _sum([], total), do: total
	defp _sum([head | tail], total), do: _sum(tail, head + total)

	def sum3([]), do: 0
	def sum3([head | []]), do: head
	def sum3([head | [head2 | tail]]), do: sum3([head + head2 | tail])

	def mmax([]), do: []
	def mmax([head | tail]), do: _mmax(tail, head)
	defp _mmax([], value), do: value
	defp _mmax([head | tail], value) when (value > head), do: _mmax(tail, value)
	defp _mmax([head | tail], value) when (value < head), do: _mmax(tail, head)
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

IO.puts("mapsum")
IO.inspect(MyList.mapsum([1, 2, 3], &(&1 * &1)))

IO.inspect(MyList.mmax([]))
IO.inspect(MyList.mmax([17, 2, 3]))