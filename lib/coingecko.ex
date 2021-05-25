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

  @doc """
  List all asset platforms (Blockchain networks)
  Example:
    iex> Coingecko.asset_platforms
    {:ok, [{\"id\":\"(factom\",\"chain_identifier\":null,\"name"\:\Factom\"}]"}
  """
  def asset_platforms do
    Request.one("asset_platforms")
  end
end
