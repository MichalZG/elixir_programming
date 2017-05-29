
list_concat = fn (l1, l2) -> l1 ++ l2 end
IO.puts list_concat.([1, 2], [3, 4])

sum = fn a, b, c -> a + b + c end
IO.puts sum.(1,2,3)

pair_tuple_to_list = fn tuple -> Tuple.to_list(tuple) end
IO.puts pair_tuple_to_list.({1234, 5678})
