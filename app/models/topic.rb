class Topic < ApplicationRecord
  belongs_to :theme

  enum content_type: {
    video_studio: "Video (Studio)",
    screencast: "Screencast",
    pdf_ppt: "PDF PPT",
    quiz: "Quiz",
    tarea_texto: "Tarea - Texto",
    survey: "Survey",
    na: "N/A",
    video_screencast: "Video/Screencast",
    video_grabado: "Video ya grabado"
  }

  # validates :content_type, inclusion: { in: content_types.keys }

  def generate_pdf
    TopicPdfGenerator.new(self).generate
  end

end