# == Schema Information
#
# Table name: visitors
#
#  id       :bigint           not null, primary key
#  ip       :string           default(""), not null
#  location :string           default(""), not null
#
class Visitor < ApplicationRecord
	has_many :visits
	accepts_nested_attributes_for :visits

	validates_uniqueness_of :ip

end
