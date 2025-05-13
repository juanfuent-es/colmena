class TopicsController < ApplicationController
  include PdfHelper
  before_action :set_topic, only: [:show]

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "topic_#{@topic.id}",
               #template: "topics/pdf",
               layout: "pdf",
               disposition: "inline",
               page_size: "Letter",
               orientation: "Landscape",
               margin: { top: 0, bottom: 0, left: 0, right: 0 }
      end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

end 