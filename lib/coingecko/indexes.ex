defmodule Coingecko.Indexes do
  @doc """
  List all market indexes
  Example:
    iex> Coingecko.Indexes.indexes
    {:ok, {[...]}}
  """
  def indexes do
    Request.one("indexes")
  end

  @doc """
  Get market index by market id and index id 
  Example:
    iex> Coingecko.Indexes.indexes
    {:ok, {[...]}}
  """
  def indexes(market_id, id) do
    Request.one("indexes/#{market_id}/#{id}")
  end

  @doc """
  List market indexes id and name
  Example:
    iex> Coingecko.Indexes.list
    {:ok, {[...]}}
  """
  def list do
    Request.one("indexes/list")
  end
end
