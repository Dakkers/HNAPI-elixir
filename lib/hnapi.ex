defmodule HNAPI do
  def start do
    HTTPotion.start
  end

  # helper functions
  defp get_first_n(l,  n) when n >= length(l) do
    l
  end

  defp get_first_n(_l, n) when n <= 0 do
    []
  end

  defp get_first_n([head|tail], n) do
    [head | get_first_n(tail, n - 1)]
  end

  # Structs for different JSON results
  defmodule Story do
    defstruct [:by, :descendants, :id, :kids, :score, :time, :title, :type, :url]
  end

  defmodule Comment do
    defstruct [:by, :id, :kids, :parent, :text, :time, :title, :type]
  end

  defmodule Ask do
    defstruct [:by, :descendants, :id, :kids, :score, :text, :time, :title, :type, :url]
  end

  defmodule Job do
    defstruct [:by, :id, :score, :text, :time, :title, :type, :url]
  end

  defmodule Poll do
    defstruct [:by, :descendants, :id, :kids, :parts, :score, :text, :time, :title, :type]
  end

  defmodule PollOption do
    defstruct [:by, :id, :parent, :score, :text, :time, :type]
  end

  defmodule User do
    defstruct [:about, :created, :delay, :id, :karma, :submitted]
  end

  # Gets the item (of any type) with the specified ID
  def get_item(id) do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
    Poison.Parser.parse! response.body
  end

  def get_user(id) do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/user/#{id}.json"
    Poison.Parser.parse! response.body
  end

  defp get_item!(id, s) do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
    Poison.decode!(response.body, as: s)
  end

  def get_story!(id) do
    get_item!(id, Story)
  end

  def get_comment!(id) do
    get_item!(id, Comment)
  end

  def get_ask!(id) do
    get_item!(id, Ask)
  end

  def get_job!(id) do
    get_item!(id, Job)
  end

  def get_poll!(id) do
    get_item!(id, Poll)
  end

  def get_poll_option!(id) do
    get_item!(id, PollOption)
  end

  def get_user!(id) do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/item/#{id}.json"
    Poison.decode!(response.body, as: User)
  end

  def get_max_item do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/maxitem.json"
    Poison.Parser.parse! response.body
  end

  # top (500) stories by ID number only
  def top_stories_by_id do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/topstories.json"
    Poison.Parser.parse! response.body
  end

  # top stories limited to a specified amount, by ID number only
  def top_stories_by_id(limit) when is_integer(limit) do
    top_stories_by_id() |> get_first_n(limit)
  end

  # top stories of a specified type, by ID number only
  def top_stories_by_id(item_type) when is_bitstring(item_type) do
    top_stories_by_id() |> Enum.filter(&(get_item(&1)["type"] == item_type))
  end

  # top stories of a specified type limited to a specified amount, by ID number only
  def top_stories_by_id(item_type, limit) do
    top_stories_by_id(limit) |> Enum.filter(&(get_item(&1)["type"] == item_type))
  end

  # top (500) stories with all associated information
  def top_stories_detailed do
    top_stories_by_id() |> Enum.map(&(get_item(&1)))
  end

  def top_stories_detailed(limit) when is_integer(limit) do
    top_stories_by_id(limit) |> Enum.map(&(get_item(&1)))
  end

  def top_stories_detailed(item_type) when is_bitstring(item_type) do
    top_stories_detailed() |> Enum.filter(&(&1["type"] == item_type))
  end

  def top_stories_detailed(item_type, limit) do
    top_stories_detailed(limit) |> Enum.filter(&(&1["type"] == item_type))
  end
  
  # new (500) stories by ID number only
  def new_stories_by_id do
    response = HTTPotion.get "https://hacker-news.firebaseio.com/v0/newstories.json"
    Poison.Parser.parse! response.body
  end

  def new_stories_by_id(limit) when is_integer(limit) do
    new_stories_by_id() |> get_first_n(limit)
  end

  def new_stories_by_id(item_type) when is_bitstring(item_type) do
    new_stories_by_id() |> Enum.filter(&(get_item(&1)["type"] == item_type))
  end

  def new_stories_by_id(item_type, limit) do
    new_stories_by_id(limit) |> Enum.filter(&(get_item(&1)["type"] == item_type))
  end

  def new_stories_detailed do
    new_stories_by_id() |> Enum.map(&(get_item(&1)))
  end

  def new_stories_detailed(limit) when is_integer(limit) do
    new_stories_by_id(limit) |> Enum.map(&(get_item(&1)))
  end

  def new_stories_detailed(item_type) when is_bitstring(item_type) do
    new_stories_detailed() |> Enum.filter(&(get_item(&1)["type"] == item_type))
  end
  
  def new_stories_detailed(item_type, limit) do
    new_stories_detailed(limit) |> Enum.filter(&(&1["type"] == item_type))
  end
end
