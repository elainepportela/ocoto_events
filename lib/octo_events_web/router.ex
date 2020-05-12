defmodule OctoEventsWeb.Router do
  use OctoEventsWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OctoEventsWeb do
    pipe_through [:api]

    post "/event", EventController, :create

    get "/issue/:issue_id/events", EventController, :show
  end
end
