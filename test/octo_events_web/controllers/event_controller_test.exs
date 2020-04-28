defmodule OctoEventsWeb.EventControllerTest do
  use OctoEventsWeb.ConnCase
  use Mimic

  alias OctoEvents.{EventDomain}

  test "GET /issue/:issue_id/event " do
    conn = build_conn()

    EventDomain
    |> expect(:get_event, fn(_) -> [%{action: "tested", login_user: "tester", issue_id: 5, title: "Testing application",
    state: "open", body: "", created_at: "2020-04-17T17:05:05Z", closed_at: nil}] end )

    conn = get(conn, "/issue/5/event")

    assert json_response(conn, 200) == %{ "data" => [
      %{"action" => "tested",
        "login_user" => "tester",
        "issue_id" => 5,
        "title" => "Testing application",
        "state" => "open",
        "body" => "",
        "created_at" => "2020-04-17T17:05:05Z",
        "closed_at" => nil }]}
  end

  test "POST /event" do
    conn = build_conn()
    params = %{
      "action" => "created",
      "issue" => %{
      "id" => 602114743,
      "node_id" => "MDExOlB1bGxSZXF1ZXN0NDA1MjQ0NjQ3",
      "number" => 9,
      "title" => "fix(schemas): retirar o schema de issue",
      "user" => %{
        "login" => "elainepportela",
        "id" => 11272291,
        "node_id" => "MDQ6VXNlcjExMjcyMjkx",
      },
      "labels" => [],
      "state" => "open",
      "body" => "",
      "created_at" => "2020-04-17T17:05:05Z",
      "updated_at" => "2020-04-22T12:43:26Z",
      "closed_at" => nil,
      }}

    EventDomain
    |> expect(:create_event, fn(_) -> {:ok, params} end )

    conn = post(conn, "/event", params)

    assert text_response(conn, 200) == ""
  end

end
