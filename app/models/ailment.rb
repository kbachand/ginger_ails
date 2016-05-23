class Ailment < ActiveRecord::Base
	has_many :line_items
	has_many :reviews
end
