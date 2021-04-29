defmodule Coingecko.Simple do
  @doc """
  Get the current price of any cryptocurrencies in any other supported currencies that you need.
  ids and vs_currencies can be a single string seperated by a comma
  Example:
    iex> Coingecko.Simple.price("bitcoin", "usd,eur")
    {:ok, {[...]}}
  """
  def price(ids, vs_currencies) do
    query_string = URI.encode_query(ids: ids, vs_currencies: vs_currencies)
    Request.one("simple/price", query_string)
  end

  @doc """
  Get current price of tokens (using contract addresses) for a given platform in any other currency that you need.
  Only Ethereum is supported now.
  Example:
    iex> Coingecko.Simple.price_token("ethereum", ADDRESS, "usd")
    {:ok, {[...]}}
  """
  def price_token(id \\ "ethereum", contract_addresses, vs_currencies) do
    query_string = URI.encode_query(contract_addresses: contract_addresses, vs_currencies: vs_currencies)
    Request.one("simple/token_price/#{id}", query_string)
  end

  @doc """
  Get list of supported_vs_currencies.
  Example:
    iex> Coingecko.Simple.supported_vs_currencies()
    {:ok, {[...]}}
  """
  def supported_vs_currencies() do
    Request.one("simple/supported_vs_currencies")
  end
end
