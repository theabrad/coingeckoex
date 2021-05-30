defmodule Coingecko.Derivatives do
  @doc """
  List all derivative tickers
  Example:
    iex> Coingecko.Derivatives.derivatives
    {:ok, {[...]}}
  """
  def derivatives do
    Request.one("derivatives")
  end

  @doc """
  List all derivative exchanges
  Example:
    iex> Coingecko.Derivatives.exchanges
    {:ok, {[...]}}
  """
  def exchanges do
    Request.one("exchanges")
  end

  @doc """
  Show derivative exchange data
  Example:
    iex> Coingecko.Derivatives.exchanges("binance_futures")
    {:ok, {[...]}}
  """
  def exchanges(id) do
    Request.one("exchanges/#{id}")
  end

  @doc """
  List all derivative exchanges name and identifier
  Example:
    iex> Coingecko.Derivatives.list
    {:ok, {[...]}}
  """
  def exchanges_list do
    Request.one("exchanges/list")
  end
end
