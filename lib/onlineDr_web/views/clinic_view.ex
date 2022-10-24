defmodule OnlineDrWeb.ClinicView do
  use OnlineDrWeb, :view

  def type_select_options(types) do
    for type <- types, do: {type.name, type.id}
  end
end
