defmodule ConstraintOrderExample.Repo.Migrations.AddTableAndIndices do
  use Ecto.Migration

  def change do
    create table("team_members") do
      add :member_id, :integer
      add :team_id, :integer
      add :role, :string
    end

    create unique_index("team_members", [:team_id, :member_id])
    create unique_index("team_members", :member_id, where: "role IN ('member', 'owner')")
  end
end
