defmodule Coingecko do
  @moduledoc """
  Simple wrapper around the Coingecko API.
  """

  alias HTTPoison.Response

  @doc """
  Check API server status
  Example:
    iex> Coingecko.ping
    {:ok, {\"gecko_says\":\"(V3 To the moon!\"}"}
  """
  def ping do
    get_url() <> "ping"
    |> get_data
  end

  @doc """
  Get the current price of any cryptocurrencies in any other supported currencies that you need.
  ids and vs_currencies can be a single string seperated by a comma
  Example:
    iex> Coingecko.get_simple_price("bitcoin", "usd,eur")
    {:ok, {[...]}}
  """
  def get_simple_price(ids, vs_currencies) do
    base = get_url() <> "simple/price"
    query_string = URI.encode_query(ids: ids, vs_currencies: vs_currencies)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  @doc """
  Get current price of tokens (using contract addresses) for a given platform in any other currency that you need.
  Only Ethereum is supported now.
  Example:
    iex> Coingecko.get_simple_price_token("ethereum", ADDRESS, "usd")
    {:ok, {[...]}}
  """
  def get_simple_token_price(id \\ "ethereum", contract_addresses, vs_currencies) do
    base = get_url() <> "simple/token_price/#{id}"
    query_string = URI.encode_query(contract_addresses: contract_addresses, vs_currencies: vs_currencies)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  @doc """
  Get list of supported_vs_currencies.
  Example:
    iex> Coingecko.get_simple_supported_vs_currencies()
    {:ok, {[...]}}
  """
  def get_simple_supported_vs_currencies() do
    get_url() <> "simple/supported_vs_currencies"
    |> get_data
  end

  @doc """
  List all supported coins id, name and symbol.
  Example:
    iex> Coingecko.get_coins_list
    {:ok, {[...]}}
  """
  def get_coins_list do
    get_url() <> "coins/list"
    |> get_data
  end

  @doc """
  List all supported coins price, market cap, volume, and market related data
  Example:
    iex> Coingecko.get_coins_markets("usd")
    {:ok, {[...]}}
  """
  def get_coins_markets(vs_currency) do
    base = get_url() <> "coins/markets"
    query_string = URI.encode_query(vs_currency: vs_currency)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  @doc """
  Get current data(name, price, market, ... including exchange tickers) for a coin
  Example:
    iex> Coingecko.get_coin_by_id("bitcoin")
    {:ok, {[...]}}
  """
  def get_coin_by_id(id) do
    get_url() <> "coins/#{id}"
    |> get_data
  end

  @doc """
  Get coin tickers (paginated to 100 items)
  Example:
    iex> Coingecko.get_coin_ticker_by_id("bitcoin")
    {:ok, {[...]}}
  """
  def get_coin_ticker_by_id(id) do
    get_url() <> "coins/#{id}/tickers"
    |> get_data
  end

  @doc """
  Gets coin history by id and date
  Date in the format of dd-mm-yyyy
  Example:
    iex> Coingecko.get_coin_history_by_id("bitcoin", "30-12-2017")
  """
  def get_coin_history_by_id(id, date) do
    base = get_url() <> "coins/#{id}/history"
    query_string = URI.encode_query(date: date)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  @doc """
  Get historical market data include price, market cap, and 24h volume
  Example:
    iex> Coingecko.get_coin_market_chart("bitcoin", "usd", 10)
  """
  def get_coin_market_chart(id, vs_currency, days) do
    base = get_url() <> "coins/#{id}/market_chart"
    query_string = URI.encode_query(vs_currency: vs_currency, days: days)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  @doc """
  Get historical market data include price, market cap, and 24h volume within a range of timestamp
  Date uses UNIX Timestamp
  Example:
    iex> Coingecko.get_coin_market_chart_range("bitcoin", "usd", 1392577232, 1422577232)
  """
  def get_coin_market_chart_range(id, vs_currency, from, to) do
    base = get_url() <> "coins/#{id}/market_chart/range"
    query_string = URI.encode_query(vs_currency: vs_currency, from: from, to: to)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  @doc """
  Get historical market data include price, market cap, and 24h volume within a range of timestamp
  Date uses UNIX Timestamp
  Example:
    iex> Coingecko.get_coin_status_updates("bitcoin", "usd", 1392577232, 1422577232)
  """
  def get_coin_status_updates(id) do
    get_url() <> "coins/#{id}/status_updates"
    |> get_data
  end

  @doc """
  Get coin's OHLC
  Example:
    iex> Coingecko.get_coin_status_updates("bitcoin", "usd", 1392577232, 1422577232)
  """
  def get_coin_ohlc(id, vs_currency, days) do
    base = get_url() <> "coins/#{id}/ohlc"
    query_string = URI.encode_query(vs_currency: vs_currency, days: days)

    URI.parse(base)
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  defp get_url() do
    "https://api.coingecko.com/api/v3/"
  end

  defp get_data(url) do
    url
    |> HTTPoison.get
    |> get_body
  end

  defp get_body({:ok, %Response{status_code: 404}}), do: {:error, "Resource not found"}
  defp get_body({:ok, %Response{body: body}}), do: {:ok, body}
end
