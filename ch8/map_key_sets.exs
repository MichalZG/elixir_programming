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

	def book(%{name: _, height: height})
	when height < 1.3 do
		IO.puts("Low shower")
	end

	def book(_) do
		IO.puts("Regular")
	end
end

people |> Enum.each(&HotelRoom.book/1)

data = %{ name: "Dave", state: "TX", likes: "Elixir" }

for key <- [:name, :likes] do
	%{ ^key => value } = data
	IO.puts(value)
end

#update and add to map

m = %{ a: 1, b: 2, c: 3}
new_m = %{ m | b: 5}
new_m2 = Map.put_new(m, :d, 5)

IO.inspect(new_m)
IO.inspect(new_m2)

#structs

defmodule Attendee do
	defstruct name: "", paid: false, over_18: true

	def may_attend_after_party(attendee = %Attendee{}) do
		attendee.paid && attendee.over_18
	end

	def print_vip_badge(%Attendee{name: name}) when name != "" do
		IO.puts "Badge for #{name}"
	end

	def print_vip_badge(%Attendee{}) do
		raise "missing name"
	end
end


#nested dictionares

defmodule Customer do
	defstruct name: "", company: ""
end

defmodule BugReport do
	defstruct owner: %Customer{}, details: "", severity: 1
end


# functions for get field from nested  - little strange...

authors = [
	%{ name: "Pi", lang: "Elixir"},
	%{ name: "Ci", lang: "Go"}
]

lang_with_r = fn (:get, collection, next_fn) ->
	for row <- collection do
		if String.contains?(row.lang, "r") do
			next_fn.(row)
		end
	end
end

IO.inspect get_in(authors, [lang_with_r, :name])


#sets

set1 = 1..5 |> Enum.into(MapSet.new)
set2 = 3..8 |> Enum.into(MapSet.new)
IO.inspect(set1)
IO.inspect(MapSet.member? set1, 3)
IO.inspect(MapSet.union set1, set2)