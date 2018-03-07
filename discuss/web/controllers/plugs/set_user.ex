defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller


  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do
  end

  def call(conn, _params) do  #params is the return value from the init function, but we won't care about them
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id  && Repo.get(User, user_id) ->
        assign(conn, :user, user)

      true ->
          assign(conn, :user, nil)
    end

    # if we have a user_id AND if Repo.get(User, user_id) returns a user, Repo.get part is assigned to user
    # cond statements "true" are always executed if they are last
    # implicit return is a modified connection (conn)

  end
end
