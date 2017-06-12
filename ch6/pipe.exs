
(1..10) |> Enum.map(&(&1*&1)) |> Enum.filter(&(&1 < 40)) |> IO.inspect

#import

defmodule Example do
	def fun1 do
		List.flatten [1, [2,3,4]]
	end

	def imfun do
		import List, only: [flatten: 1]
		IO.inspect(flatten([4, [1,2,3]]))
	end
end

Example.imfun


#atributes

defmodule Example2 do
	@author "pi"
	def get_autor do
		@author
	end
	@author "omega"
	def get_next_author do
		@author
	end
end

IO.puts(Example2.get_autor)
IO.puts(Example2.get_next_author)

#erlang lib
:io.format("~.2f~n", [5.7656])

System.get_env("CUDA_ROOT") |> IO.inspect
Path.extname("/home/pi/test.ext") |> IO.puts