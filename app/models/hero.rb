class Hero < ApplicationRecord
    validates :name, presence: {mesage: "debe ser proporcionado"}
end
