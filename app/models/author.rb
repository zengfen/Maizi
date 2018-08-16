class Author < ApplicationRecord
    has_many :books

    validates :name, presence: true

    attr_accessor :name
end



