class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]

  def show
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

end 