defmodule OctoEventsWeb.PageViewTest do
  use OctoEventsWeb.ConnCase, async: true

  alias OctoEventsWeb.EventView
  alias OctoEvents.Event

  test "show.json" do
    dt = DateTime.now("Etc/UTC")
    events = [%Event{action: "testing",
      login_user: "tester",
      issue_id: 5,
      title: "Testting the OctoEvents",
      state: "open",
      body: "",
      created_at: dt,
      closed_at: ""}]

    rendered_event = EventView.render("show.json", %{events: events})

    assert rendered_event == %{
      data: [%{action: "testing",
      login_user: "tester",
      issue_id: 5,
      title: "Testting the OctoEvents",
      state: "open",
      body: "",
      created_at: dt,
      closed_at: ""}]
    }
  end

end
