class Admin::PagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_page, only: %i[ show edit update destroy ]

  layout "admin"

  def index
    @pages = Page.all 
    if params[:category].present?
      @pages = @pages.where(category: params[:category])
    else
      @pages = @pages.where(category: "static")
    end
  end

  def show
    redirect_to admin_pages_url
  end

  def edit
  end

  def new
    @page = Page.new()
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_page_url(@page), notice: "La página #{@page.title} ha sido creada."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_url, notice: "La página '#{@page.title}' ha sido actualizada."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @page.restricted
      redirect_to admin_pages_url, notice: "Página restringida. #{@page.title} no se puede eliminar."
    else
      @page.destroy
      redirect_to admin_pages_url, notice: "La página #{@page.title} ha sido eliminada."
    end
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params.require(:page).permit(:slug, :category, :title, :content, :og_title, :og_description, :og_image, :keywords, :published, :restricted)
    end

end