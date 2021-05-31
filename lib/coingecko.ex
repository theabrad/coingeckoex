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

  @doc """
  Get BTC-to-Currency exchange rates
  Example:
    iex> Coingecko.exchange_rates
    {:ok,"{\"rates\":{\"btc\":{\"name\":\"Bitcoin\",\"unit\":\"BTC\",\"value\":1.0,\"type\":\"crypto\"},\"eth\":{\"name\":\"Ether\",\"unit\":\"ETH\",\"value\":14.364,\"type\":\"crypto\"}}
  """
  def exchange_rates do
    Request.one("exchange_rates")
  end

  @doc """
  Get trending search coins (Top-7) on CoinGecko in the last 24 hours
  Example:
    iex> Coingecko.trending
    {:ok, "{\n\coins\": [{\"item\":{\"id\":\"polydoge\",\"coin_id\":15146,\"name\":\"PolyDoge\",\"symbol\":\"POLYDOGE\",\"market_cap_rank\":733,\"thumb\":\"https://assets.coingecko.com/coins/images/15146/thumb/p1kSco1h_400x400.jpg?1619842715\",\"small\":\"https://assets.coingecko.com/coins/images/15146/small/p1kSco1h_400x400.jpg?1619842715\",\"large\":\"https://assets.coingecko.com/coins/images/15146/large/p1kSco1h_400x400.jpg?1619842715\",\"slug\":\"polydoge\",\"price_btc\":5.29153993051868e-13,\"score\":0}},{\"item\":{\"id\":\"seedify-fund\",\"coin_id\":14614,\"name\":\"Seedify.fund\",\"symbol\":\"SFUND\",\"market_cap_rank\":662,\"thumb\":\"https://assets.coingecko.com/coins/images/14614/thumb/sfund.jpg?1617253700\",\"small\":\"https://assets.coingecko.com/coins/images/14614/small/sfund.jpg?1617253700\",\"large\":\"https://assets.coingecko.com/coins/images/14614/large/sfund.jpg?1617253700\",\"slug\":\"seedify-fund\",\"price_btc\":5.5780890797339604e-05,\"score\":1}}"]}

  """
  def trending do
    Request.one("search/trending")
  end
end
