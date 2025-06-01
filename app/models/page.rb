class Page < ApplicationRecord
  has_many :blocks, as: :blockable, dependent: :destroy
  has_many :visits, as: :visitable, dependent: :destroy
  
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
  
  before_validation :set_slug, on: :create
  
  private
  
  def set_slug
    self.slug = title.parameterize if title.present? && slug.blank?
  end

end