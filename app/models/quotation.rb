class Quotation < ApplicationRecord
    validates :client, presence: true
    validates :project, presence: true

end