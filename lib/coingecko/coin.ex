defmodule Coingecko.Coin do
  @doc """
  List all supported coins id, name and symbol.
  Example:
    iex> Coingecko.Coins.list
    {:ok, {[...]}}
  """
  def list do
    Request.one("coins/list")
  end

  @doc """
  List all supported coins price, market cap, volume, and market related data
  Example:
    iex> Coingecko.Coin.markets("usd")
    {:ok, {[...]}}
  """
  def markets(vs_currency) do
    query_string = URI.encode_query(vs_currency: vs_currency)

    Request.one("coins/markets", query_string)

  end

  @doc """
  Get current data(name, price, market, ... including exchange tickers) for a coin
  Example:
    iex> Coingecko.Coin.coins("bitcoin")
    {:ok, {[...]}}
  """
  def coins(id) do
    Request.one("coins/#{id}")
  end

  @doc """
  Get coin tickers (paginated to 100 items)
  Example:
    iex> Coingecko.Coin.tickers("bitcoin")
    {:ok, {[...]}}
  """
  def tickers(id) do
    Request.one("coins/#{id}/tickers")
  end

  @doc """
  Gets coin history by id and date
  Date in the format of dd-mm-yyyy
  Example:
    iex> Coingecko.Coin.history("bitcoin", "30-12-2017")
  """
  def history(id, date) do
    query_string = URI.encode_query(date: date)

    Request.one("coins/#{id}/history", query_string)
  end

  @doc """
  Get historical market data include price, market cap, and 24h volume
  Example:
    iex> Coingecko.Coin.market_chart("bitcoin", "usd", 10)
  """
  def market_chart(id, vs_currency, days) do
    query_string = URI.encode_query(vs_currency: vs_currency, days: days)

    Request.one("coins/#{id}/market_chart", query_string)
  end

  @doc """
  Get historical market data include price, market cap, and 24h volume within a range of timestamp
  Date uses UNIX Timestamp
  Example:
    iex> Coingecko.Coin.market_chart_range("bitcoin", "usd", 1392577232, 1422577232)
  """
  def market_chart_range(id, vs_currency, from, to) do
    query_string = URI.encode_query(vs_currency: vs_currency, from: from, to: to)
    Request.one("coins/#{id}/market_chart/range", query_string)
  end

  @doc """
  Get historical market data include price, market cap, and 24h volume within a range of timestamp
  Date uses UNIX Timestamp
  Example:
    iex> Coingecko.Coin.status_updates("bitcoin", "usd", 1392577232, 1422577232)
  """
  def status_updates(id) do
    Request.one("coins/#{id}/status_updates")
  end

  @doc """
  Get coin's OHLC
  Example:
    iex> Coingecko.Coin.ohlc("bitcoin", "usd", 1392577232, 1422577232)
  """
  def ohlc(id, vs_currency, days) do
    query_string = URI.encode_query(vs_currency: vs_currency, days: days)

    Request.one("coins/#{id}/ohlc", query_string)
  end

  @doc """
  List all categorties with market data
  Example:
    iex> Coingecko.Coin.categories
  """
  def categories do
    Request.one("coins/categories")
  end

  @doc """
  List all categorties 
  Example:
    iex> Coingecko.Coin.categories_list
  """
  def categories_list do
    Request.one("coins/categories/list")
  end
end
