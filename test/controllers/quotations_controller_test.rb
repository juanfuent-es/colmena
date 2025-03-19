require "test_helper"

class QuotationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quotation = quotations(:one)
  end

  test "should get index" do
    get quotations_url
    assert_response :success
  end

  test "should get new" do
    get new_quotation_url
    assert_response :success
  end

  test "should create quotation" do
    assert_difference("Quotation.count") do
      post quotations_url, params: { quotation: { client: @quotation.client, description: @quotation.description, footer: @quotation.footer, logo: @quotation.logo, project: @quotation.project, slug: @quotation.slug, title: @quotation.title, total: @quotation.total, weeks: @quotation.weeks } }
    end

    assert_redirected_to quotation_url(Quotation.last)
  end

  test "should show quotation" do
    get quotation_url(@quotation)
    assert_response :success
  end

  test "should get edit" do
    get edit_quotation_url(@quotation)
    assert_response :success
  end

  test "should update quotation" do
    patch quotation_url(@quotation), params: { quotation: { client: @quotation.client, description: @quotation.description, footer: @quotation.footer, logo: @quotation.logo, project: @quotation.project, slug: @quotation.slug, title: @quotation.title, total: @quotation.total, weeks: @quotation.weeks } }
    assert_redirected_to quotation_url(@quotation)
  end

  test "should destroy quotation" do
    assert_difference("Quotation.count", -1) do
      delete quotation_url(@quotation)
    end

    assert_redirected_to quotations_url
  end
end
