for x <- [ 1, 2, 3, 5, 8, 9 ], x < 4, do: x * x
|> IO.inspect

IO.puts('###')

for x <- [ 1, 2 ], y <- [ 5, 6 ], do: x * y
|> IO.inspect

IO.puts('###')

first8 = [ 1, 2, 3, 4, 5, 6, 7, 8 ]

for x <- first8, y <- first8, x >= y, rem(x*y, 10)==0, do: {x, y}
|> IO.inspect