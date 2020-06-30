defmodule ThetaMedia.Base do
  @moduledoc """
    pwd: "uploads"
    dirs: [dirA,dirB]
    files: [file1, file2]
  """
  defstruct base: "",
            dirs: [],
            files: []

  @doc """
  Returns the list of school.

  ## Examples

      iex> new()
      [%School{}, ...]

  """
  def new() do
    store = Application.get_env(:theta_media, :storage)
    put_in(%__MODULE__{}.base, store)
  end


end
