class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :omniauthable
  devise :database_authenticatable,
         :rememberable,
         :validatable,
         # :recoverable,
         # :registerable,
         # :confirmable,
         # :lockable,
         :timeoutable,
         :trackable

  has_many :programs

  validates :role, inclusion: { in: %w[visitor editor admin] }

  # validates_uniqueness_of :username
  # mount_uploader :avatar, AvatarUploader

  def admin?
    role == "admin"
  end

  def editor?
    role == "editor"
  end

  def admin_or_editor?
    admin? || editor?
  end
end
