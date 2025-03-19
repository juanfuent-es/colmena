
class Admin::QuotationsController < ApplicationController

  # before_action :authenticate_admin!
  before_action :set_quotation, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /quotations
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/1
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations
  def create
    @quotation = Quotation.new(quotation_params)

    if @quotation.save
      redirect_to admin_quotations_url, notice: "Quotation ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotations/1
  def update
    if @quotation.update(quotation_params)
      redirect_to admin_quotations_url, notice: "Quotation ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /quotations/1
  def destroy
    @quotation.destroy!
    redirect_to admin_quotations_url, notice: "Quotation ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quotation_params
      params.require(:quotation).permit(:client, :logo, :project, :description, :title, :slug, :footer, :weeks, :total)
    end
end
