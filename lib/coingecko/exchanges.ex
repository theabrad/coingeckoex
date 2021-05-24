defmodule Coingecko.Exchanges do
  @doc """
  List all exchanges
  Example:
    iex> Coingecko.Exchanges.exchanges()
    {:ok, {[...]}}
  """
  def exchanges() do
    Request.one("exchanges")
  end

  @doc """
  List all supported markets id and name
  Example:
    iex> Coingecko.Exchanges.list()
    {:ok, {[...]}}
  """
  def list() do
    Request.one("list")
  end

  @doc """
  Get exchange volume in BTC and top 100 tickers only
  Example:
    iex> Coingecko.Exchanges.exchanges("aave")
    {:ok, {[...]}}
  """
  def exchanges(id) do
    Request.one("exchanges/#{id}")
  end

  @doc """
  Get exchange tickers
  Example:
    iex> Coingecko.Exchanges.tickers("aave")
    {:ok, {[...]}}
  """
  def tickers(id) do
    Request.one("exchanges/#{id}/tickers")
  end
  
  @doc """
  Get status updates for a given exchange 
  Example:
    iex> Coingecko.Exchanges.status_updates("aave")
    {:ok, {[...]}}
  """
  def status_updates(id) do
    Request.one("exchanges/#{id}/status_updates")
  end

  @doc """
  Get volume chart data for a given exchange 
  Example:
    iex> Coingecko.Exchanges.volume_chart("aave")
    {:ok, {[...]}}
  """
  def volume_chart(id) do
    Request.one("exchanges/#{id}/volume_chart")
  end
end
