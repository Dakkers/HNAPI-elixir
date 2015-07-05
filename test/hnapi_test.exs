defmodule HNAPITest do
  use ExUnit.Case

  test "the truth" do
    assert 1 + 1 == 2
  end

  # test "truncating list" do
  #   l = [1,2,3,4,5]
  #   assert HNAPI.get_first_n(l, 3) == [1,2,3]
  #   assert HNAPI.get_first_n(l, 0) == []
  #   assert HNAPI.get_first_n(l, 6) == l
  #   assert HNAPI.get_first_n([], 3) == []
  # end
end
