class QuotationsController < ApplicationController

  # GET /quotations/1 or /quotations/1.json
  def show
    @quotation = Quotation.find_by_slug(params[:id])
  end

end
