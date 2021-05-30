defmodule Coingecko.Finance do
  @doc """
  List all finance platforms
  Example:
    iex> Coingecko.Finance.platforms
    {:ok, {[...]}}
  """
  def platforms do
    Request.one("finance_platforms")
  end

  @doc """
  List all finance products
  Example:
    iex> Coingecko.Finance.products
    {:ok, {[...]}}
  """
  def products do
    Request.one("finance_products")
  end
end
