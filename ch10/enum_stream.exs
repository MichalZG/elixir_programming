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

defmodule MyEnum do
	def all(list, fun) do
		
	end	
end