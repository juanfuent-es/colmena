require "application_system_test_case"

class TopicsTest < ApplicationSystemTestCase
  setup do
    @topic = topics(:one)
  end

  test "visiting the index" do
    visit topics_url
    assert_selector "h1", text: "Topics"
  end

  test "should create topic" do
    visit topics_url
    click_on "New topic"

    fill_in "Comments", with: @topic.comments
    fill_in "Content type", with: @topic.content_type
    fill_in "Credits and sources", with: @topic.credits_and_sources
    fill_in "Estimated time", with: @topic.estimated_time
    fill_in "Exercises", with: @topic.exercises
    fill_in "Homework", with: @topic.homework
    fill_in "Objective", with: @topic.objective
    fill_in "Reference material", with: @topic.reference_material
    fill_in "Theme", with: @topic.theme_id
    fill_in "Title", with: @topic.title
    click_on "Create Topic"

    assert_text "Topic was successfully created"
    click_on "Back"
  end

  test "should update Topic" do
    visit topic_url(@topic)
    click_on "Edit this topic", match: :first

    fill_in "Comments", with: @topic.comments
    fill_in "Content type", with: @topic.content_type
    fill_in "Credits and sources", with: @topic.credits_and_sources
    fill_in "Estimated time", with: @topic.estimated_time
    fill_in "Exercises", with: @topic.exercises
    fill_in "Homework", with: @topic.homework
    fill_in "Objective", with: @topic.objective
    fill_in "Reference material", with: @topic.reference_material
    fill_in "Theme", with: @topic.theme_id
    fill_in "Title", with: @topic.title
    click_on "Update Topic"

    assert_text "Topic was successfully updated"
    click_on "Back"
  end

  test "should destroy Topic" do
    visit topic_url(@topic)
    click_on "Destroy this topic", match: :first

    assert_text "Topic was successfully destroyed"
  end
end
