
class Admin::ProgramsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_program, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /programs
  def index
    @programs = Program.all
  end

  # GET /programs/1
  def show
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # GET /programs/1/edit
  def edit
  end

  # POST /programs
  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to admin_programs_url, notice: "El Programa ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programs/1
  def update
    if @program.update(program_params)
      redirect_to admin_programs_url, notice: "El Programa ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /programs/1
  def destroy
    @program.destroy!
    redirect_to admin_programs_url, notice: "El Programa ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_program
      @program = Program.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def program_params
      params.require(:program).permit(:name, :description, :year, :school, :url)
    end
end
