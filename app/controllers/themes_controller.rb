
class Admin::ThemesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_theme, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /themes
  def index
    @themes = Theme.all
  end

  # GET /themes/1
  def show
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # GET /themes/1/edit
  def edit
  end

  # POST /themes
  def create
    @theme = Theme.new(theme_params)

    if @theme.save
      redirect_to admin_themes_url, notice: "Theme ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /themes/1
  def update
    if @theme.update(theme_params)
      redirect_to admin_themes_url, notice: "Theme ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /themes/1
  def destroy
    @theme.destroy!
    redirect_to admin_themes_url, notice: "Theme ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme
      @theme = Theme.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def theme_params
      params.require(:theme).permit(:title, :description, :activity)
    end
end
