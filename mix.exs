defmodule HNAPI.Mixfile do
  use Mix.Project

  def project do
    [app: :hnapi,
     version: "0.0.2",
     elixir: "~> 1.0",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:ibrowse, github: "cmullaparthi/ibrowse", tag: "v4.1.1"},
      {:httpotion, "~> 2.1.0"},
      {:poison, "~> 1.4.0"}
    ]
  end
end
