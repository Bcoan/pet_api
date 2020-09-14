# frozen_string_literal: true

FactoryBot.define do
  factory :owner do
    name { 'John Doe' }
    document { '08479154098' }
    birth_date { '1990-01-01' }
  end
end
