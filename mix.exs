defmodule Pond.MixProject do
  use Mix.Project

  @description """
  Pond is an Elixir library for creating state handling functions without spawning processes.

  Pond functions are same-process, referentially transparent functions, that let you implement
  Finite State Machines, Generators, (push/pull) Reactive Streams, etc.
  """

  def project do
    [
      app: :pond,
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      name: "Pond",
      description: @description,
      version: version(),
      elixirc_paths: elixirc_paths(Mix.env()),
      package: package(),
      docs: [
        main: "Pond"
      ],
      deps: deps()
    ]
  end

  defp version do
    file = Path.expand("CHANGELOG.md", __DIR__)
    changelog = File.read!(file)
    [_, version] = Regex.scan(~r/## v(\d+\.\d+\.\d+)/, changelog) |> List.first()
    version
  end

  defp package do
    [
      maintainers: ["Victor Borja <vborja@apache.org>"],
      licenses: ["Apache-2"],
      links: %{"GitHub" => "https://github.com/vic/pond"}
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.0", only: :dev, runtime: false}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
