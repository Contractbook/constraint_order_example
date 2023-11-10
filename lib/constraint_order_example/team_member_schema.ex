defmodule ConstraintOrderExample.TeamMember do
  use Ecto.Schema

  import Ecto.Changeset

  schema "team_members" do
    field(:team_id, :integer)
    field(:member_id, :integer)
    field(:role, :string)
  end

  def insert(params) do
    %__MODULE__{}
    |> cast(params, [:member_id, :team_id, :role])
    |> unique_constraint(
      :member_id,
      name: :team_members_member_id_index,
      message: "already a member of another team"
    )
    |> unique_constraint(
      :member_id,
      name: :team_members_team_id_member_id_index,
      message: "already a member of the team"
    )
    |> ConstraintOrderExample.Repo.insert()
  end
end
