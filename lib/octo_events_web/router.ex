defmodule OctoEventsWeb.Router do
  use OctoEventsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :csrf do
    plug :protect_from_forgery
  end

  scope "/", OctoEventsWeb do
    pipe_through [:browser, :api]

    post "/event", PingController, :create

    get "/issue/:issue_id/events", IssuesController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", OctoEventsWeb do
  #   pipe_through :api
  # end
end
