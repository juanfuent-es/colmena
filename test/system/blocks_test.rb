require "application_system_test_case"

class BlocksTest < ApplicationSystemTestCase
  setup do
    @block = blocks(:one)
  end

  test "visiting the index" do
    visit blocks_url
    assert_selector "h1", text: "Blocks"
  end

  test "should create block" do
    visit blocks_url
    click_on "New block"

    fill_in "Block type", with: @block.block_type
    fill_in "Description", with: @block.description
    fill_in "Image", with: @block.image
    fill_in "Number", with: @block.number
    fill_in "Title", with: @block.title
    click_on "Create Block"

    assert_text "Block was successfully created"
    click_on "Back"
  end

  test "should update Block" do
    visit block_url(@block)
    click_on "Edit this block", match: :first

    fill_in "Block type", with: @block.block_type
    fill_in "Description", with: @block.description
    fill_in "Image", with: @block.image
    fill_in "Number", with: @block.number
    fill_in "Title", with: @block.title
    click_on "Update Block"

    assert_text "Block was successfully updated"
    click_on "Back"
  end

  test "should destroy Block" do
    visit block_url(@block)
    click_on "Destroy this block", match: :first

    assert_text "Block was successfully destroyed"
  end
end
