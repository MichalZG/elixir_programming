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