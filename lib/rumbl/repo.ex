defmodule Rumbl.Repo do

  alias Rumbl.User

  @moduledoc """
  In memory repository
  """

  def all(Rumbl.User) do
    [
      %User{id: "1", name: "Moritz Lawitschka", username: "lawitschka", password: "strong"},
      %User{id: "2", name: "Colin McRae", username: "colin", password: "strongPW"},
      %User{id: "3", name: "Ayrton Senna", username: "senna", password: "brummbrumm"}
    ]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end

end
