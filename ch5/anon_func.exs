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