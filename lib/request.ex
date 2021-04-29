defmodule Request do
  alias HTTPoison.Response

  def one(url) do
    url 
    |> get_data
  end

  def one(url, query_string) do
    url
    |> URI.parse
    |> Map.put(:query, query_string)
    |> URI.to_string
    |> get_data
  end

  defp get_data(url) do
    url
    |> fetch
    |> HTTPoison.get
    |> get_body
  end

  defp base_url() do
    "https://api.coingecko.com/api/v3/"
  end

  defp fetch(url) do
    base_url() <> url
  end

  defp get_body({:ok, %Response{status_code: 404}}), do: {:error, "Resource not found"}
  defp get_body({:ok, %Response{body: body}}), do: {:ok, body}
end
