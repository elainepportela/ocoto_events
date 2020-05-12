defmodule OctoEventsWeb.EventControllerTest do
  use OctoEventsWeb.ConnCase
  use Mimic

  alias OctoEvents.{ListEvents, CreateEvent}

  test "GET /issue/:issue_id/event " do
    conn = build_conn()

    ListEvents
    |> expect(:run, fn _ ->
      [
        %{
          action: "tested",
          login_user: "tester",
          issue_id: 5,
          title: "Testing application",
          state: "open",
          body: "",
          created_at: "2020-04-17T17:05:05Z",
          closed_at: nil
        }
      ]
    end)

    conn = get(conn, "/issue/5/events")

    assert json_response(conn, 200) == %{
             "data" => [
               %{
                 "action" => "tested",
                 "login_user" => "tester",
                 "issue_id" => 5,
                 "title" => "Testing application",
                 "state" => "open",
                 "body" => "",
                 "created_at" => "2020-04-17T17:05:05Z",
                 "closed_at" => nil
               }
             ]
           }
  end

  test "POST /event" do
    conn = build_conn()

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

    CreateEvent
    |> expect(:run, fn _ -> {:ok, params} end)

    conn = post(conn, "/event", params)

    assert json_response(conn, 201) == params
  end
end
