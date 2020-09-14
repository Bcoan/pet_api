# frozen_string_literal: true

class Pet < ApplicationRecord
  belongs_to :pet_type
end
