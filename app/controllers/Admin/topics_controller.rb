
class Admin::TopicsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_topic, only: %i[ show edit update destroy ]

  layout "admin"

  # GET /topics
  def index
    @topics = Topic.all
  end

  # GET /topics/1
  def show
  end

  # GET /topics/new
  def new
    @topic = Topic.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to admin_topics_url, notice: "Topic ha sido creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /topics/1
  def update
    if @topic.update(topic_params)
      redirect_to admin_topics_url, notice: "Topic ha sido actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /topics/1
  def destroy
    @topic.destroy!
    redirect_to admin_topics_url, notice: "Topic ha sido eliminado."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topic
      @topic = Topic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def topic_params
      params.require(:topic).permit(:theme_id, :title, :objective, :estimated_time, :content_type, :exercises, :homework, :comments, :reference_material, :credits_and_sources)
    end
end
