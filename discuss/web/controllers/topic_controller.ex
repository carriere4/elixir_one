defmodule Discuss.TopicController do
  use Discuss.Web, :controller #this command automatically aliases Repo for us - we already aliased Topic in next line

  alias Discuss.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics #make available property of topics equal to list of topics.
  end

  def new(conn, _params) do  #new function needs to have a new template new.html.eex
    changeset = Topic.changeset(%Topic{}, %{}) #we are passing these as struct and params; created changeset with Topic module and Topic struct

    render conn, "new.html", changeset: changeset #b/c we are in TopicController it gets this from Topic Folder
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end

  def edit(conn, %{"id" => topic_id}) do  #creates a map with funky key/value syntax in params
    topic = Repo.get(Topic, topic_id)  #pull topic out of the database with the Repo.get helper
    changeset = Topic.changeset(topic) #we then create a changeset out of that topic

    render conn, "edit.html", changeset: changeset, topic: topic 
  end
end

#passes in changeset or other custom data into new.html.eex
# by defaults, templates always pass in conn as conn
