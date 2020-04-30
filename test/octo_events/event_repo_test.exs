defmodule OctoEvents.EventRepoTest do
  use OctoEventsWeb.ConnCase, async: true

  alias OctoEvents.{EventRepo, Event}

  test "should create a event changeset" do
    params = %{
      action: "tested",
      login_user: "tester",
      issue_id: 5,
      title: "Testing application",
      state: "open",
      body: "",
      created_at: "2020-04-17T17:05:05Z",
      closed_at: nil
    }

    event = EventRepo.creation_changeset(params)

    assert event.valid?
  end

  test "should create a invalid event changeset invalid date" do
    params = %{
      action: "tested",
      login_user: "tester",
      issue_id: 5,
      title: "",
      state: "open",
      body: "",
      created_at: "2020-20-17T17:05:05Z",
      closed_at: nil
    }

    event = EventRepo.creation_changeset(params)

    assert not event.valid?
  end

  test "should create a empty event changeset" do
    event = EventRepo.creation_changeset(%{})

    assert event.data == %Event{}
  end
end
