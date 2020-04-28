defmodule OctoEvents.EventDomainTest do
  use OctoEventsWeb.ConnCase, async: true
  use Mimic

  alias OctoEvents.{EventDomain, EventRepo}

  test "should not find a valid event in database" do
    EventRepo |> expect(:get_by_issue_id, fn(_) -> [] end )
    issue_id_invalid = 2

    assert EventDomain.get_event(issue_id_invalid) == []
  end

  test "should return a valid event " do
    EventRepo
    |> expect(:get_by_issue_id, fn(_) -> [%{action: "tested", login_user: "tester", issue_id: 5, title: "Testing application",
    state: "open", body: "", created_at: "2020-04-17T17:05:05Z", closed_at: nil}] end )

    event = EventDomain.get_event(5)

    assert event == [%{action: "tested", login_user: "tester", issue_id: 5, title: "Testing application",
    state: "open", body: "", created_at: "2020-04-17T17:05:05Z", closed_at: nil}]
  end

  test "should return a valid formatted map" do
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
    formatted_event = EventDomain.format_params_event(params)

    assert Map.keys(formatted_event) == [:action, :body, :closed_at, :created_at, :issue_id, :login_user, :state, :title]
  end

end
