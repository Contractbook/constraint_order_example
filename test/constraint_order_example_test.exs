defmodule ConstraintOrderExampleTest do
  use ExUnit.Case
  doctest ConstraintOrderExample

  test "greets the world" do
    assert ConstraintOrderExample.hello() == :world
  end

  # This test behaves differently if ran like this:
  #
  #   1. env MIX_ENV=test mix do ecto.drop + ecto.create + ecto.migrate + test
  #   2. env MIX_ENV=test mix do ecto.dump + ecto.drop + ecto.create + ecto.load + test
  #
  test "depicts ordering issue" do
    ConstraintOrderExample.Repo.delete_all(ConstraintOrderExample.TeamMember)

    ConstraintOrderExample.TeamMember.insert(%{
      member_id: 1,
      team_id: 1,
      role: "member"
    })

    result =
      ConstraintOrderExample.TeamMember.insert(%{
        member_id: 1,
        team_id: 1,
        role: "member"
      })

    assert {"already a member of the team",
            [constraint: :unique, constraint_name: "team_members_team_id_member_id_index"]} ==
             elem(result, 1).errors[:member_id]
  end
end
