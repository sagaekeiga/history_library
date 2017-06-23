class Card < ApplicationRecord
validates :name, uniqueness: true
validates :url, uniqueness: true

end
