 defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do #if params is undefined, default params to an empty map
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
 end
