defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, "index.html"
  end

  def new(conn, _params) do  #new function needs to have a new template new.html.eex
    changeset = Topic.changeset(%Topic{}, %{}) #we are passing these as struct and params; created changeset with Topic module and Topic struct

    render conn, "new.html", changeset: changeset #b/c we are in TopicController it gets this from Topic Folder
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

end

#passes in changeset or other custom data into new.html.eex
# by defaults, templates always pass in conn as conn
