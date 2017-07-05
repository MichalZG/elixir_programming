list = Enum.to_list 1..5
IO.inspect(list)

IO.inspect(Enum.map(list, &(&1 * 10)))
IO.inspect(Enum.filter(list, &(&1 > 3)))

str_list = ["aaa", "bb", "ccccc", "d"]

IO.inspect(
	Enum.sort(
		str_list, &(String.length(&1) <= String.length(&2))
		)
	)

IO.inspect(
	Enum.all?(
		list, &(&1 < 4)
		)
	)

IO.inspect(
	Enum.reduce(
		1..100, &(&1+&2)
		)
	)


#card deck

deck = for rank <- '2345678910JQKA', suit <- 'CDHS', do: [suit, rank]

IO.inspect(deck)

deck |> Enum.shuffle |> Enum.take(14) |> IO.inspect


defmodule Enum2 do

	def all?([], _), do: true
	def all?([ head | tail ], fun) do
		fun.(head) && Enum2.all?(tail, fun)
	end

	def each([], _), do: :ok
	def each([ head | tail ], fun) do
		fun.(head)
		Enum2.each(tail, fun)
	end

	def filter([], _), do: []
	def filter([ head | tail ], fun) do
		if fun.(head) do
			[ head | filter(tail,fun) ]
		else 
			filter(tail, fun)
		end
	end

end


IO.inspect(
	Enum2.all?([1, 2, 3], &(&1 < 4)))


IO.inspect(
	Enum2.each(["a", "b", "c"], fn(x) -> IO.puts(x) end))

IO.inspect(
	Enum2.filter([1, 2, 3, 5, 6], &(&1 < 3)))