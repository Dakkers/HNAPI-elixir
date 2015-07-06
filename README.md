# hnapi-elixir
elixir wrapper for the HackerNews API

## Usage
Because I have no idea how to really use Elixir properly (at least the module system), HNAPI must be started:

```
iex> HNAPI.start
```

(This is to initialize HTTPotion). Then any of the methods can be called.

## API
The Poison module has two ways of decoding JSON data; one way is by putting the data into a previously defined struct, and the other way is by parsing the data on-the-fly. Both ways are supported here; several structs are predefined for convenience, and they have the same fields as described in the HN API.

### Structs
The following structs are defined:

`Ask(:by, :descendants, :id, :kids, :score, :text, :time, :title, :type, :url)`

`Comment(:by, :id, :kids, :parent, :text, :time, :title, :type)`

`Job(:by, :id, :score, :text, :time, :title, :type, :url)`

`Poll(:by, :descendants, :id, :kids, :parts, :score, :text, :time, :title, :type)`

`PollOption(:by, :id, :parent, :score, :text, :time, :type)`

`Story(:by, :descendants, :id, :kids, :score, :time, :title, :type, :url)`

`User(:about, :created, :delay, :id, :karma, :submitted)`

### Methods
Methods with a `!` at the end return a predefined struct.

#### `get_item(id)`
Gets the item with the specified ID. `id` can be an integer or a string. A map is returned.

#### `get_user(id)`
Gets the user with the specified ID. `id` can be an atom or a string. A map is returned.

#### `get_ask!(id)`
Gets the ask item with the specified ID. `id` can be an integer or a string. An `Ask` struct is returned.

#### `get_comment!(id)`
Gets the comment item with the specified ID. `id` can be an integer or a string. A `Comment` struct is returned.

#### `get_job!(id)`
Gets the job item with the specified ID. `id` can be an integer or a string. A `Job` struct is returned.

#### `get_poll!(id)`
Gets the poll item with the specified ID. `id` can be an integer or a string. A `Poll` struct is returned.

#### `get_poll_option!(id)`
Gets the poll_option item with the specified ID. `id` can be an integer or a string. A `PollOption` struct is returned.

#### `get_story!(id)`
Gets the story item with the specified ID. `id` can be an integer or a string. A `Story` struct is returned.

#### `get_user!(id)`
Gets the user item with the specified ID. `id` can be an integer or a string. A `User` struct is returned.

#### `get_max_item`
Gets the current largest item ID as an integer.

#### `top_stories_by_id`
Gets the IDs of the top 500 stories as a list of integers.

#### `top_stories_by_id(limit)`
Gets the IDs of the top `limit` stories as a list of integers. `limit` must be an integer.

#### `top_stories_by_id(item_type)`
Gets the IDs of the top 500 stories as a list of integers that are of the type `item_type`. `item_type` must be a string.

#### `top_stories_by_id(item_type, limit)`
Gets the IDs of the top `limit` stories as a list of integers that are of the type `item_type`. `item_type` must be a string, and `limit` must be an integer.

#### `top_stories_detailed`
Gets all information of the top 500 stories as a list of integers.

#### `top_stories_detailed(limit)`
Gets all information of the top `limit` stories as a list of integers. `limit` must be an integer.

#### `top_stories_detailed(item_type)`
Gets all information of the top 500 stories as a list of integers that are of the type `item_type`. `item_type` must be a string.

#### `top_stories_detailed(item_type, limit)`
Gets all information of the top `limit` stories as a list of integers that are of the type `item_type`. `item_type` must be a string, and `limit` must be an integer.

#### `new_stories_by_id`
Gets the IDs of the newest 500 stories as a list of integers.

#### `new_stories_by_id(limit)`
Gets the IDs of the newest `limit` stories as a list of integers. `limit` must be an integer.

#### `new_stories_by_id(item_type)`
Gets the IDs of the newest 500 stories as a list of integers that are of the type `item_type`. `item_type` must be a string.

#### `new_stories_by_id(item_type, limit)`
Gets the IDs of the newest `limit` stories as a list of integers that are of the type `item_type`. `item_type` must be a string, and `limit` must be an integer.

#### `new_stories_detailed`
Gets all information of the 500 newest stories as a list of integers.

#### `new_stories_detailed(limit)`
Gets all information of the `limit` newest stories as a list of integers. `limit` must be an integer.

#### `new_stories_detailed(item_type)`
Gets all information of the 500 newest stories as a list of integers that are of the type `item_type`. `item_type` must be a string.

#### `new_stories_detailed(item_type, limit)`
Gets all information of the `limit` newest stories as a list of integers that are of the type `item_type`. `item_type` must be a string, and `limit` must be an integer.

## License
GPL
