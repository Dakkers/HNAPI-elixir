defmodule HNAPITest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  # there is a possibility this is wrong, just due to the time of a GET request, but... eh.
  test "getting top stories" do
    HNAPI.start
    l1 = HNAPI.top_stories_by_id(3)       # top 3
    l2 = HNAPI.top_stories_by_id()        # all 500
    l3 = HNAPI.top_stories_by_id(0)       # empty list
    l4 = HNAPI.top_stories_by_id(1000)    # all 500

    top_three = [hd(l2), hd(tl(l2)), hd(tl(tl(l2)))]   # top 3 stories

    assert l1 == top_three
    assert l3 == []
    assert l4 == l2
  end
end
