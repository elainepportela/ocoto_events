defmodule OctoEvents.CreateEventTest do
  use OctoEventsWeb.ConnCase, async: true
  use Mimic

  alias OctoEvents.CreateEvent


  test "should return a valid formatted map" do
    params = %{
      "action" => "created",
      "issue" => %{
        "id" => 602_114_743,
        "node_id" => "MDExOlB1bGxSZXF1ZXN0NDA1MjQ0NjQ3",
        "number" => 9,
        "title" => "fix(schemas): retirar o schema de issue",
        "user" => %{
          "login" => "elainepportela",
          "id" => 11_272_291,
          "node_id" => "MDQ6VXNlcjExMjcyMjkx"
        },
        "labels" => [],
        "state" => "open",
        "body" => "",
        "created_at" => "2020-04-17T17:05:05Z",
        "updated_at" => "2020-04-22T12:43:26Z",
        "closed_at" => nil
      }
    }

    formatted_event = CreateEvent.format_params_event(params)

    assert Map.keys(formatted_event) == [
             :action,
             :body,
             :closed_at,
             :created_at,
             :issue_id,
             :login_user,
             :state,
             :title
           ]
  end
end
