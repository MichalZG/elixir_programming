
test_data =	[
		[923, 26, 15, 2],
		[123, 27, 15, 0],
		[323, 26, 12, 3],
		[143, 26, 12, 4],
		[663, 27, 13, 3],
		[126, 26, 10, 1],
		[223, 26, 11, 1]]



defmodule WeatherHistory do
	
	def for_location([], _target_id), do: []

	def for_location([ head = [_, target_id, _, _] | tail ], target_id) do
		[ head | for_location(tail, target_id) ]
	end

	def for_location([ _ | tail ], target_id), do: for_location(tail, target_id)
end

IO.inspect(WeatherHistory.for_location(test_data, 27))


defmodule MyList do
	
	def span(from, to) when (from > to), do: span(to, from)
	def span(from, to), do: _span([from], to, 1)

	defp _span([ head | _ ], to, step) when (head < to) do
		[ head | _span([head + step], to, step) ]
	end

	defp _span(list, _, _), do: list
end

IO.inspect(MyList.span(10, 4))
