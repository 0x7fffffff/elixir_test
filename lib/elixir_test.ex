defmodule ElixirTest do
	def main(args) do
		IO.puts("hello, world!")
	end
end

defmodule ElixirTest.Api do  
	use Application

	def start(_type, _args) do
		import Supervisor.Spec, warn: false

		children = [
			worker(ElixirTest.Web, [])
		]

		opts = [strategy: :one_for_one, name: ElixirTest.Supervisor]
		Supervisor.start_link(children, opts)
	end
end 