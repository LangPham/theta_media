defmodule ThetaMedia do
  @moduledoc """
  Documentation for `ThetaMedia`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ThetaMedia.hello()
      :world

  """
  def hello do
    store = Application.get_env(:theta_media, :storage)
    list = File.ls!(store)
    dirs = Enum.filter(list, fn(x) -> File.stat!(Path.join(store,x)).type == :directory end)
    files = Enum.filter(list, fn(x) -> File.stat!(Path.join(store,x)).type != :directory end)
    IO.inspect dirs, label: "Directory:"
    IO.inspect files, label: "Files:"
  end

end
