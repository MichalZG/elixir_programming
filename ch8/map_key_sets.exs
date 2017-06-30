defmodule Canvas do
	
	@defaults [ fg: "black", bg: "white", font: "Merri"]

	def draw_text(text, options \\ []) do
		options = Keyword.merge(@defaults, options)
		IO.puts "text: #{text}"
		IO.puts "bg: #{options[:bg]}"
		IO.puts "style: #{Keyword.get(options, :style)}"
		IO.puts "font: #{Keyword.get(options, :font)}"
	end
end

Canvas.draw_text("check check", style: "style2", font: "Arial")


people = [
	%{ name: "Grumpy", height: 1.91 },
	%{ name: "Patty", height: 1.25 },
	%{ name: "Pi", height: 1.81 }
]

IO.inspect(for person = %{ height: height } <- people, height > 1.7, 
	do: person)


defmodule HotelRoom do
	
	def book(%{name: name, height: height})
	when height > 1.9 do
		IO.puts("Need extra long bed for #{name}")
	end

	def book(%{name: name, height: height})
	when height < 1.3 do
		IO.puts("Low shower")
	end

	def book(person) do
		IO.puts("Regular")
	end
end

people |> Enum.each(&HotelRoom.book/1)