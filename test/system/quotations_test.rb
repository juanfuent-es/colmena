require "application_system_test_case"

class QuotationsTest < ApplicationSystemTestCase
  setup do
    @quotation = quotations(:one)
  end

  test "visiting the index" do
    visit quotations_url
    assert_selector "h1", text: "Quotations"
  end

  test "should create quotation" do
    visit quotations_url
    click_on "New quotation"

    fill_in "Client", with: @quotation.client
    fill_in "Description", with: @quotation.description
    fill_in "Footer", with: @quotation.footer
    fill_in "Logo", with: @quotation.logo
    fill_in "Project", with: @quotation.project
    fill_in "Slug", with: @quotation.slug
    fill_in "Title", with: @quotation.title
    fill_in "Total", with: @quotation.total
    fill_in "Weeks", with: @quotation.weeks
    click_on "Create Quotation"

    assert_text "Quotation was successfully created"
    click_on "Back"
  end

  test "should update Quotation" do
    visit quotation_url(@quotation)
    click_on "Edit this quotation", match: :first

    fill_in "Client", with: @quotation.client
    fill_in "Description", with: @quotation.description
    fill_in "Footer", with: @quotation.footer
    fill_in "Logo", with: @quotation.logo
    fill_in "Project", with: @quotation.project
    fill_in "Slug", with: @quotation.slug
    fill_in "Title", with: @quotation.title
    fill_in "Total", with: @quotation.total
    fill_in "Weeks", with: @quotation.weeks
    click_on "Update Quotation"

    assert_text "Quotation was successfully updated"
    click_on "Back"
  end

  test "should destroy Quotation" do
    visit quotation_url(@quotation)
    click_on "Destroy this quotation", match: :first

    assert_text "Quotation was successfully destroyed"
  end
end
