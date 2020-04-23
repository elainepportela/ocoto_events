defmodule OctoEvents.EventRepoTest do
  use OctoEventsWeb.ConnCase, async: true
  use Mimic

  alias OctoEvents.{EventRepo, Event, Repo}

  test "should not find a valid event in database" do
    issue_id_invalid = 2
    assert EventRepo.get_by_issue_id(issue_id_invalid) == []
  end

  test "should return a valid event " do
    Repo
    |> expect(:all, fn(_) -> [%Event{action: "tested", login_user: "tester", issue_id: 5, title: "Testing application",
    state: "open", body: "", created_at: "2020-04-17T17:05:05Z", closed_at: nil}] end )

    event = EventRepo.get_by_issue_id(5)

    assert event == [%Event{action: "tested", login_user: "tester", issue_id: 5, title: "Testing application",
    state: "open", body: "", created_at: "2020-04-17T17:05:05Z", closed_at: nil}]
  end

  test "should create a event changeset" do
    params = %{ action: "tested", login_user: "tester", issue_id: 5, title: "Testing application",
    state: "open", body: "", created_at: "2020-04-17T17:05:05Z", closed_at: nil}
    event = EventRepo.creation_changeset(%Event{}, params)

    assert event.valid?
  end

  test "should create a empty event changeset" do
    event = EventRepo.creation_changeset(%Event{}, %{})

    assert event.data == %Event{}
  end

end
