defmodule Annacl.Performers.Performer do
  @moduledoc """
  A Performer is an Ecto schema used as the main actor for determining abilities.

  """
  use Ecto.Schema

  import Ecto.Changeset, only: [cast: 3]

  alias Annacl.Permissions.Permission
  alias Annacl.Roles.Role
  alias Annacl.Performers.PerformerPermission
  alias Annacl.Performers.PerformerRole

  schema "annacl_performers" do
    many_to_many(:permissions, Permission, join_through: PerformerPermission)
    many_to_many(:roles, Role, join_through: PerformerRole)

    timestamps()
  end

  @spec changeset(Performer.t(), map) :: Ecto.Changeset.t()
  def changeset(%__MODULE__{} = performer, attrs) when is_map(attrs) do
    performer
    |> cast(attrs, [])
  end
end
