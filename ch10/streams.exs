[1,2,3,4] 
|> Stream.map(&(&1*&1))
|> Stream.map(&(&1+1))
|> Stream.filter(fn x -> rem(x,2)  == 1 end)
|> Enum.to_list
|> IO.inspect

IO.puts File.open!("test.dat")
|> IO.stream(:line)
|> Enum.max_by(&String.length/1)

#shorter, no intermediate storage, but 2 x slower
IO.puts File.stream!("test.dat") |> Enum.max_by(&String.length/1)

# no need for whole collection to be available
Stream.map(1..10_000_000, &(&1+1)) |> Enum.take(5) |> IO.inspect

#Stream cycle
Stream.cycle(~w{a b c})
|> Stream.zip(1..10)
|> Enum.map(fn {class, value} -> ~s(#{class}:#{value} ) end)
|> IO.puts

#Stream repeatedly
Stream.repeatedly(&:random.uniform/0) |> Enum.take(3) |> IO.inspect

#Stream.iterate
Stream.iterate(2, &(&1*&1)) |> Enum.take(5) |> IO.inspect

Stream.resource(fn -> File.open!("test.dat") end,
				fn file ->
					case IO.read(file, :line) do
						data when is_binary(data) -> {[data], file}
						_ -> {:halt, file}
					end
				end,
				fn file -> File.close(file) end) 
|> Enum.take(5) |> IO.inspect
