

#doesnt work for range start
defmodule Chop do

	def guess(_, range) when not is_map(range) do
		IO.puts("Give me the range")
	end

	def guess(actual, _) when not is_integer(actual) do
		IO.puts("The choice must be integer")
	end 

	def guess(actual, range) do

		first..last = range
		shot = div(first, 2) + div(last, 2) + 1
		IO.puts("Is it #{shot} ?")

		cond do
			actual == shot ->
				IO.puts("#{shot}")
			actual > shot ->
				IO.puts("Too small")
				guess(actual, shot..last)
			actual < shot ->
				IO.puts("Too big")
				guess(actual, first..shot)
		end
	end
end

Chop.guess(44, 1..100)

IO.puts("**********")
# This work with low..high

defmodule Chopp do
	def guess(actual, low..high) when (actual in low..high) and (low <= high) do
		shot = shoot(low..high)
		IO.puts("IS it #{shot} ?")
		guess(actual, shot, low..high)
	end

	defp guess(actual, shot, _) when (actual == shot), do: IO.puts("#{shot}") 

	defp guess(actual, shot, low.._) when (shot > actual), do: guess actual, low..(shot - 1) 

	defp guess(actual, shot, _..high) when (shot < actual), do: guess actual, (shot + 1)..high

	defp shoot(low..high) do
		low + div((high - low), 2)
	end


end

Chopp.guess(44, 1..100)