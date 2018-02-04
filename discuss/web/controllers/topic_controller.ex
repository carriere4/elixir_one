defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def new(conn, params) do  #new function needs to have a new template new.html.eex
    changeset = Topic.changeset(%Topic{}, %{}) #we are passing these as struct and params; created changeset with Topic module and Topic struct

    render conn, "new.html", changeset: changeset #b/c we are in TopicController it gets this from Topic Folder
  end

end

#passes in changeset or other custom data into new.html.eex
# by defaults, templates always pass in conn as conn
