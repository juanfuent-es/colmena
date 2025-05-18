class Admin::TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_program_theme
  before_action :set_topic, only: %i[show edit update destroy]

  layout "admin"

  def index
    @topics = @theme.topics
  end

  def new
    @topic = @theme.topics.build
  end

  def create
    @topic = @theme.topics.build(topic_params)

    if @topic.save
      redirect_to admin_program_theme_topics_path(@program, @theme), notice: "Topic creado con éxito."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "topic_#{@topic.id}",
               layout: "pdf",
               disposition: "inline",
               page_size: "Letter",
               orientation: "Landscape",
               margin: { top: 0, bottom: 0, left: 0, right: 0 }
      end 
    end
  end

  def edit
  end

  def update
    if @topic.update(topic_params)
      redirect_to admin_program_theme_topics_path(@program, @theme), notice: "Topic actualizado con éxito."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
    redirect_to admin_program_theme_topics_path(@program, @theme), notice: "Topic eliminado con éxito."
  end

  private

  def set_program_theme
    @program = Program.find(params[:program_id])
    @theme = @program.themes.find(params[:theme_id])
  end

  def set_topic
    @topic = @theme.topics.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:theme_id,:number,:title,:estimated_time,:content_type,:objective,:exercises,:homework,:comments,:reference_material,:credits_and_sources, :presentation, blocks_attributes: [:id, :title, :description, :image, :block_type, :_destroy])
  end
end