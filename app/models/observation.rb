class Observation < ApplicationRecord
  has_many :admissions_observations
  has_many :admissions, through: :admissions_observations
end
