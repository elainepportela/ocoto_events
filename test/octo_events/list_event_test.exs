defmodule OctoEvents.ListEventsTest do
  use OctoEventsWeb.ConnCase, async: true
  use Mimic

  alias OctoEvents.{ListEvents, EventRepo}

  test "should not find a valid event in database" do
    EventRepo |> expect(:list_by, fn _ -> [] end)
    issue_id_invalid = 2

    assert ListEvents.run(issue_id_invalid) == []
  end

  test "should return a valid event " do
    EventRepo
    |> expect(:list_by, fn _ ->
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

    event = ListEvents.run(5)

    assert event == [
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
  end
end
