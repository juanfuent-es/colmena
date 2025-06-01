class Quotation < ApplicationRecord
    has_many :visits, as: :visitable, dependent: :destroy
end