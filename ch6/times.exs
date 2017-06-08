
defmodule Times do
	def double(n) do
		n * 2
	end

	def ldouble(n), do: n * 2

	def triple(n), do: n * 3

	def quadruple(n), do: 2 * double(n) 
end

IO.puts(Times.double(5))
IO.puts(Times.ldouble(6))
IO.puts(Times.triple(7))
IO.puts(Times.quadruple(8))