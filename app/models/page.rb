class Page < ApplicationRecord
  belongs_to :user
  has_many :blocks, as: :blockable, dependent: :destroy
  has_many :visits, as: :visitable, dependent: :destroy
  
  # Category options
  CATEGORIES = {
    static: "Estática",
    blog: "Blog",
    article: "Artículo",
    tutorial: "Tutorial",
    course: "Curso",
    workshop: "Taller",
    users: "Usuarios",
    errors: "Errores"
  }.freeze

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :category, presence: true, inclusion: { in: CATEGORIES.keys.map(&:to_s) }
  before_validation :set_slug, on: :create

  mount_uploader :og_image, OgUploader

  def total_views
    visits.count
  end

  def full_url
    "#{Rails.application.credentials.app_domain}/#{slug}"
  end

  def category_name
    CATEGORIES[category.to_sym]
  end
  
  private
  
  def set_slug
    self.slug = title.parameterize if title.present? && slug.blank?
  end

end