
class Admin::BlocksController < ApplicationController

  before_action :authenticate_user!
  before_action :set_block, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /blocks
  def index
    @blocks = Block.all
  end

  # GET /blocks/1
  def show
  end

  # GET /blocks/new
  def new
    @block = Block.new
  end

  # GET /blocks/1/edit
  def edit
  end

  # POST /blocks
  def create
    @block = Block.new(block_params)

    if @block.save
      redirect_to admin_blocks_url, notice: "Block ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blocks/1
  def update
    if @block.update(block_params)
      redirect_to admin_blocks_url, notice: "Block ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /blocks/1
  def destroy
    @block.destroy!
    redirect_to admin_blocks_url, notice: "Block ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_block
      @block = Block.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def block_params
      params.require(:block).permit(:title, :number, :block_type, :image, :description)
    end
end
