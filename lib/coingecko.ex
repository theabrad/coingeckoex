defmodule Coingecko do
  @moduledoc """
  Simple wrapper around the Coingecko API.
  """

  @doc """
  Check API server status
  Example:
    iex> Coingecko.ping
    {:ok, {\"gecko_says\":\"(V3 To the moon!\"}"}
  """
  def ping do
    Request.one("ping")
  end
end
