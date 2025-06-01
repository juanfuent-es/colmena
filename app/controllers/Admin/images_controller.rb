
class Admin::ImagesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_image, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /images
  def index
    @images = Image.all
  end

  # GET /images/1
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  def create
    @image = Image.create(file: params[:image], processed: false)
    if @image.save
      @image.file.recreate_versions!
      # ProcessImageVersionsJob.perform_later(@image.id) TODO: Implementar background de procesamiento de imágenes
      render json: @image, status: :created
    else
      render json: { errors: @image.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /images/1
  def update
    if @image.update(image_params)
      redirect_to admin_images_url, notice: "Image ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /images/1
  def destroy
    @image.assets.delete_all
    @image.destroy
    redirect_to admin_images_url, notice: "Image ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def image_params
      params.require(:image).permit(:file, :width, :height, :orientation, :processed)
    end

end
