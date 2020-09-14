# frozen_string_literal: true

class Owner < ApplicationRecord
  has_many :pets

  validates :name, length: { minimum: 5 }
end
