class TopicPdfGenerator
  def initialize(topic)
    @topic = topic
  end

  def generate
    WickedPdf.new.pdf_from_string(
      render_template,
      page_size: 'Letter',
      orientation: 'Landscape',
      margin: { top: 20, bottom: 20, left: 20, right: 20 }
    )
  end

  private

  def render_template
    ApplicationController.renderer.render(
      template: 'topics/pdf',
      layout: 'pdf',
      locals: { topic: @topic }
    )
  end
end 