defmodule OctoEventsWeb.PingController do
  use OctoEventsWeb, :controller

  import Ecto.Changeset

  alias OctoEvents.User

  def ping(conn, params) do
    sender =
      %User{}
      |> cast(params["sender"], [:id, :avatar_url, :events_url, :followers_url, :following_url, :gists_url, :gravatar_id, :html_url, :login, :node_id, :organizations_url, :received_events_url, :repos_url, :site_admin, :starred_url, :subscriptions_url, :type, :url])
      |> validate_required([:id, :login, :node_id, :site_admin, :type, :url])
    # IO.puts("params")
    IO.inspect(sender)
    render(conn, "index.html")
  end
end
