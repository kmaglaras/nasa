defmodule NasaTest do
  use ExUnit.Case

  describe "trip/2" do
    test "calculates single landing trip to earth" do
      assert Nasa.trip(28801, [{:land, 9.807}]) == 13447
    end

    test "calculates Apollo 11 trip" do
      equipment_weight = 28801
      trip_steps = [{:launch, 9.807}, {:land, 1.62}, {:launch, 1.62}, {:land, 9.807}]

      assert Nasa.trip(equipment_weight, trip_steps) == 51898
    end

    test "calculates Mission on Mars" do
      equipment_weight = 14606
      trip_steps = [{:launch, 9.807}, {:land, 3.711}, {:launch, 3.711}, {:land, 9.807}]

      assert Nasa.trip(equipment_weight, trip_steps) == 33388
    end

    test "calculates Passenger ship " do
      equipment_weight = 75432

      trip_steps = [
        {:launch, 9.807},
        {:land, 1.62},
        {:launch, 1.62},
        {:land, 3.711},
        {:launch, 3.711},
        {:land, 9.807}
      ]

      assert Nasa.trip(equipment_weight, trip_steps) == 212_161
    end
  end
end
