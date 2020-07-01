defmodule ThetaMedia do
  @moduledoc """
  Documentation for `ThetaMedia`.
  """

  defmacro __using__(_) do
    quote do
      alias ThetaMedia.Base
      alias ThetaMedia.Dir
    end
  end
end
