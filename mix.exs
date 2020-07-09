defmodule ThetaMedia.MixProject do
  use Mix.Project

  @version "0.1.0"
  def project do
    [
      app: :theta_media,
      name: "Theta Media",
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  defp description do
    """
    Library for media upload.
    """
  end
  defp package do
    [
      files: ~w(lib mix.exs README LICENSE .formatter.exs),
      maintainers: ["LangPham"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/LangPham/theta_media.git"}
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
