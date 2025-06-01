class Visit < ApplicationRecord
	belongs_to :visitor, 	inverse_of: :visits
	belongs_to :visitable, 	inverse_of: :visits, polymorphic: true, optional: true

end