class Hero < ApplicationRecord
    validates :name, presence: {mesage: "debe ser proporcionado"}
    validates :id_hero, uniqueness: true
end
