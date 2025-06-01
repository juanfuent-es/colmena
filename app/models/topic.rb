class Topic < ApplicationRecord
  belongs_to :theme
  has_many :blocks, as: :blockable, dependent: :destroy
  accepts_nested_attributes_for :blocks, allow_destroy: true
  has_many :visits, as: :visitable, dependent: :destroy
  
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

  validates :title, presence: true
  validates :content_type, presence: true, inclusion: { in: content_types.keys }
  
  # Scopes
  scope :ordered, -> { order(created_at: :desc) }

  def content_type_text
    CONTENT_TYPES[content_type]
  end
end