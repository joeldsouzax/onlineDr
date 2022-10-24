defmodule OnlineDrWeb.PractitionerView do
  use OnlineDrWeb, :view

  def kind_select_options(kinds) do
    for kind <- kinds, do: {kind.name, kind.id}
  end
end
