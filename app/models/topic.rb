class Topic < ApplicationRecord
  belongs_to :theme
  has_many :blocks, dependent: :destroy
  accepts_nested_attributes_for :blocks, allow_destroy: true

  CONTENT_TYPES = {
    video_studio: "Video (Studio)",
    screencast: "Screencast",
    pdf_ppt: "PDF PPT",
    quiz: "Quiz",
    tarea_texto: "Tarea - Texto",
    survey: "Survey",
    na: "N/A",
    video_screencast: "Video/Screencast",
    video_grabado: "Video ya grabado"
  }.freeze

  enum content_type: CONTENT_TYPES.keys

  # validates :content_type, inclusion: { in: content_types.keys }

end