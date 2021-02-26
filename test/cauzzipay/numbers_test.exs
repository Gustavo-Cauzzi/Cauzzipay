defmodule Cauzzipay.NumbersTest do
  use ExUnit.Case

  alias Cauzzipay.Numbers, as: CN

  describe "sum_all_numbers_from_file/1" do
    test "when it's given a valid file name, it should return the sum of all values" do
      response = CN.sum_all_numbers_from_file("numbers")

      expected_response = {:ok, %{result: 55}}

      assert response == expected_response
    end

    test "when it's not given a valid file name, it should return an error" do
      response = CN.sum_all_numbers_from_file("invalidName")

      expected_response = {:error, %{message: "File doesn't exists"}}

      assert response == expected_response
    end
  end
end
