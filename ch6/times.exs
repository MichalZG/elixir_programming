
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

defmodule Fractorial do
	def of(0), do: 1
	def of(n), do: n * of(n-1)
end

IO.puts(Fractorial.of(0))
IO.puts(Fractorial.of(10))

defmodule Sum do
	def sum(0), do: 0
	def sum(1), do: 1
	def sum(n), do: n + sum(n-1)
end

IO.puts(Sum.sum(0))
IO.puts(Sum.sum(1))
IO.puts(Sum.sum(3))

defmodule GCD do
	def gcd(x, 0), do: x
	def gcd(x, y), do: gcd(y, rem(x, y))
end

IO.puts(GCD.gcd(10, 0))
IO.puts(GCD.gcd(25324, 24588))


#Guard clauses

defmodule Guard do
	def what_is(n) when is_number(n) do
		IO.puts("#{n} is a number")
	end
	def what_is(n) when is_list(n) do
		IO.puts("#{n} is a list")
	end
end

defmodule FractorialG do
	@moduledoc """
	Fractional with guard
	"""
	def of(0), do: 1
	def of(n) when n > 0 do
		n * of(n-1)
	end
end

IO.puts(FractorialG.of(5))
#IO.puts(FractorialG.of(-5))

defmodule Defparam do
	def func(p1, p2 \\ 2, p3 \\ 3, p4) do
		IO.inspect([p1, p2, p3, p4])
	end
end

Defparam.func("a", "b")

#def param multiple heads

defmodule Defparam2 do
	def func(p1, p2 \\ 100) #no body because of def value

	def func(p1, 99) do
		IO.puts("#{p1} with p2=99")
	end

	def func(p1, p2) do
		IO.puts("#{p1} and #{p2}")
	end
end

Defparam2.func(3, 4)
Defparam2.func(20, 99)
Defparam2.func(2)