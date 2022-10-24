# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     OnlineDr.Repo.insert!(%OnlineDr.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


alias OnlineDr.Center

for type <- ~w(General-Practitioner Mental-Health Primary-Care Addication-Services Community-Health Retail-Clinic) do
  Center.create_type!(type)
end
