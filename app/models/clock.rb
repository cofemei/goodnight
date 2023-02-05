# frozen_string_literal: true

class Clock < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :is_bedtime, inclusion: {in: [true, false]}
end
