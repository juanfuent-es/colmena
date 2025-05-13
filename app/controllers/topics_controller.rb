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
               margin: { top: 10, bottom: 10, left: 10, right: 10 }
      end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

end 