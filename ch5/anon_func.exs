list_concat = fn (l1, l2) -> l1 ++ l2 end
IO.inspect list_concat.([1, 2], [3, 4])

sum = fn a, b, c -> a + b + c end
IO.inspect sum.(1,2,3)

pair_tuple_to_list = fn tuple -> Tuple.to_list(tuple) end
IO.inspect pair_tuple_to_list.({1234, 5678})


handle_open = fn 
	{:ok, file} -> IO.puts("Read Data #{IO.read(file, :line)}")
	{_,  error} -> IO.puts("Error: #{:file.format_error(error)}")
end

handle_open.(File.open("test.dat"))
handle_open.(File.open("notest.dat"))

buzz = fn 
	(0, 0, _) -> IO.puts("FizzBuzz") 
	(0, _, _) -> IO.puts("Fizz")
	(_, 0, _) -> IO.puts("Buzz")
	(_, _, x) -> IO.puts(x)
end

buzz.(0, 0, 2)
buzz.(0, 2, 2)
buzz.(2, 0, 2)
buzz.(2, 2, 7)

buzzrem = fn 
	n -> buzz.(rem(n, 3), rem(n, 5), n)
end

buzzrem.(10)
buzzrem.(11)
buzzrem.(12)
buzzrem.(13)
buzzrem.(14)
buzzrem.(15)
buzzrem.(16)

#functions can return functions
greeter = fn name -> (fn -> "Hello #{name}" end) end
IO.puts(greeter.("pi").())

add_n = fn n -> (fn n2 -> n + n2 end) end
IO.puts(add_n.(3).(5))

prefix = fn string1 ->
	fn string2 -> string1 <> " " <> string2 end
end

IO.puts(prefix.("Elixir").("Rock"))

#functions as arguments

times_2 = fn n -> n * 2 end
apply = fn (fun, value) -> fun.(value) end

IO.puts(apply.(times_2, 6))

list = [1, 2, 5, 6]
map = Enum.map list, fn elem -> elem * 2 end
IO.inspect(map)

#Pinned valuers and functions parameter

defmodule Greeter do
	
	def for(name, greeting) do
		fn
			(^name) -> "#{greeting} #{name}"
			(_) -> "I don't know you"
		end
	end
end

gret = Greeter.for("Pi", "Yo!")

IO.puts gret.("Pi")
IO.puts gret.("Dave")

# the & operator

rnd = &(Float.round(&1, &2))
IO.inspect(rnd.(2.233442, 2))

l = &length/1
IO.inspect(l.([1,2,3,4]))

IO.inspect(Enum.map [1,2,3,4], &(&1 + 1))

map = &Enum.map/2
IO.inspect(map.([1,2,3], &(&1 + 2)))

each = &Enum.each/2
each.(["Hi", "hello"], &(IO.inspect(&1)))