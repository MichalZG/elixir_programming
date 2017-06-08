
defmodule Chop do

	def guess(_, range) when not is_map(range) do
		IO.puts("Give me the range")
	end

	def guess(actual, _) when not is_integer(actual) do
		IO.puts("The choice must be integer")
	end

	def guess(actual, range) do

		first..last = range
		shot = div(first, 2) + round(Float.ceil(last / 2))
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

Chop.guess(1, 1..100)